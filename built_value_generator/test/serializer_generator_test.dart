// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    test('ignores empty library', () async {
      expect(await generate('library value;'), isEmpty);
    });

    test('ignores normal class', () async {
      expect(await generate(r'''
library value;

class EmptyClass {}
'''), isEmpty);
    });

    test('ignores built_value class without serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {}
'''), isNot(contains('Serializer<Value>')));
    });

    test('generates for built_value class with serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
}
'''), contains('Serializer<Value>'));
    });

    test('ignores EnumClass without serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

class Enum extends EnumClass {}
'''), isNot(contains('Serializer<Enum>')));
    });

    test('generates for EnumClass with serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

class Enum extends EnumClass {
  static final Serializer<Enum> serializer = _$serializer;
}
'''), isNotEmpty);
    });

    test('generates for serializers', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

final Serializers serializers = _$serializers;
'''), isNotEmpty);
    });

    test('generates correct serializer for built_value with primitives',
        () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  bool get aBool;
  double get aDouble;
  int get anInt;
  String get aString;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  bool aBool;
  double aDouble;
  int anInt;
  String aString;
}
'''), contains(r'''
Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  @override
  final Iterable<Type> types = const [Value, _$Value];
  @override
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aBool',
      serializers.serialize(object.aBool, specifiedType: const FullType(bool)),
      'aDouble',
      serializers.serialize(object.aDouble,
          specifiedType: const FullType(double)),
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'aString',
      serializers.serialize(object.aString,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'aBool':
            result.aBool = serializers.deserialize(value,
                specifiedType: const FullType(bool));
            break;
          case 'aDouble':
            result.aDouble = serializers.deserialize(value,
                specifiedType: const FullType(double));
            break;
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                specifiedType: const FullType(int));
            break;
          case 'aString':
            result.aString = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}
'''));
    });

    test('generates correct serializer for built_value with nullables',
        () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  bool get aBool;
  @nullable double get aDouble;
  @nullable int get anInt;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  bool aBool;
  @nullable double aDouble;
  @nullable int anInt;
}
'''), contains(r'''
Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  @override
  final Iterable<Type> types = const [Value, _$Value];
  @override
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aBool',
      serializers.serialize(object.aBool, specifiedType: const FullType(bool)),
    ];
    if (object.aDouble != null) {
      result.add('aDouble');
      result.add(serializers.serialize(object.aDouble,
          specifiedType: const FullType(double)));
    }
    if (object.anInt != null) {
      result.add('anInt');
      result.add(serializers.serialize(object.anInt,
          specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'aBool':
            result.aBool = serializers.deserialize(value,
                specifiedType: const FullType(bool));
            break;
          case 'aDouble':
            result.aDouble = serializers.deserialize(value,
                specifiedType: const FullType(double));
            break;
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                specifiedType: const FullType(int));
            break;
        }
      }
    }

    return result.build();
  }
}
'''));
    });

    test('generates correct serializer for built_value with collections',
        () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  BuiltList<String> get aList;
  BuiltMap<String, int> get aMap;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ListBuilder<String> aList;
  MapBuilder<String, int> aMap;
}
'''), contains(r'''
Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  @override
  final Iterable<Type> types = const [Value, _$Value];
  @override
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aList',
      serializers.serialize(object.aList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'aMap',
      serializers.serialize(object.aMap,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
    ];

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'aList':
            result.aList.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltList, const [const FullType(String)])));
            break;
          case 'aMap':
            result.aMap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltMap,
                    const [const FullType(String), const FullType(int)])));
            break;
        }
      }
    }

    return result.build();
  }
}
'''));
    });

    test('generates correct serializer for nested built_value', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  Value get value;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder value;
}
'''), contains(r'''
Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  @override
  final Iterable<Type> types = const [Value, _$Value];
  @override
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(Value)),
    ];

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'value':
            result.value.replace(serializers.deserialize(value,
                specifiedType: const FullType(Value)));
            break;
        }
      }
    }

    return result.build();
  }
}
'''));
    });

    test('generates correct serializer for EnumClass', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class TestEnum extends EnumClass {
  static final Serializer<TestEnum> serializer = _$serializer;

  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''), contains(r'''
Serializer<TestEnum> _$testEnumSerializer = new _$TestEnumSerializer();

class _$TestEnumSerializer implements PrimitiveSerializer<TestEnum> {
  @override
  final Iterable<Type> types = const [TestEnum];
  @override
  final String wireName = 'TestEnum';

  @override
  Object serialize(Serializers serializers, TestEnum object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  TestEnum deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return TestEnum.valueOf(serialized);
  }
}
'''));
    });

    test('does not crash for incorrect builder getter', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  bool get aBool;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  set aBool(bool aBool);
}
'''), contains('Serializer<Value>'));
    });
  });
}

// Test setup.

final String pkgName = 'pkg';
final PackageGraph packageGraph =
    new PackageGraph.fromRoot(new PackageNode(pkgName, null, null, null));

final PhaseGroup phaseGroup = new PhaseGroup.singleAction(
    new GeneratorBuilder([new BuiltValueGenerator()]),
    new InputSet(pkgName, const ['lib/*.dart']));

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'test_support|lib/test_support.dart': testSupportSource,
    '$pkgName|lib/value.dart': source,
  };

  final writer = new InMemoryAssetWriter();
  await testPhases(phaseGroup, srcs,
      packageGraph: packageGraph, writer: writer);
  return writer.assets[new AssetId(pkgName, 'lib/value.g.dart')]?.value ?? '';
}

// Classes mentioned in the test input need to exist, but we don't need the
// real versions. So just use minimal ones.
const String testSupportSource = r'''
const String nullable = 'nullable';

class Built<V, B> {}

class BuiltList<E> {}

class BuiltMap<K, V> {}

class EnumClass {}

class Serializer<T> {}

class Serializers {}
''';
