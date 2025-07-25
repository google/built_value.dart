// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:logging/logging.dart';
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
'''), isNot(contains('implements StructuredSerializer<Value>')));
    });

    test('generates for built_value class with serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _$Value;
}
'''), contains('implements StructuredSerializer<Value>'));
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
  static Serializer<Enum> get serializer => _$serializer;
}
'''), isNotEmpty);
    });

    test('does not generate for serializers without annotation', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

final Serializers serializers = _$serializers;
'''), isEmpty);
    });

    test('generates for serializers with annotation', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

@SerializersFor(const [Value])
final Serializers serializers = _$serializers;

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  bool get aBool;

  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _$Value;
}
'''), contains(r'_$serializers'));
    });

    test('errors on annotation on wrong declaration', () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

@SerializersFor(const [Value])
final serializers = _$serializers;

@SerializersFor(const [Value])
final int moreSerializers = _$moreSerializers;

@SerializersFor(const [Value])
final Serializers correctSerializers = _$correctSerializers;

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  bool get aBool;

  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _$Value;
}
'''),
          contains(
              r'1. These top level getters are annotated @SerializersFor but '
              'do not have the required type Serializers, please fix the type '
              'or remove the annotation: serializers, moreSerializers'));
    });

    test('does not crash for incorrect builder getter', () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  bool get aBool;

  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _$Value;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  set aBool(bool aBool);

  ValueBuilder._();
  factory ValueBuilder() = _$ValueBuilder;
}
'''),
          contains(
              'Make builder field aBool a normal field or a getter/setter pair.'));
    });

    test('checks serializer declarations use correct values', () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  bool get aBool;

  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _$Value;
}

abstract class OtherValue implements Built<OtherValue, OtherValueBuilder> {
  static Serializer<Value> get serializer => _$serializer;
  bool get aBool;

  OtherValue._();
  factory OtherValue([void Function(OtherValueBuilder) updates]) = _$OtherValue;
}
'''),
          contains(r'1. Declare OtherValue.serializer as: '
              'static Serializer<OtherValue> get serializer => '
              '_\$otherValueSerializer;'));
    });

    test('suggests Function fields be marked not serializable', () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  Function() get function;

  factory Value() => _$Value();
  Value._();
}
'''),
          contains(r'1. Function fields are not serializable. Remove '
              '"function" or mark it "@BuiltValueField(serialize: false)".'));
    });

    test('cannot generate serializer for private classes', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class _Value implements Built<_Value, _ValueBuilder> {
  static Serializer<_Value> get serializer => _$valueSerializer;
  bool get aBool;

  _Value._();
  factory _Value([void Function(ValueBuilder) updates]) = _$Value;
}
'''), contains(r'1. Cannot generate serializers for private class _Value'));
    });

    test('cannot generate serializer if there are record fields', () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

part 'value.g.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static Serializer<Value> get serializer => _$valueSerializer;
  (int, int) get record;

  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _$Value;
}
'''),
          contains(r'1. Fields declared with record types are not '
              'automatically serializable. '
              'To allow the class to be serialized, modify "record" by'));
    });
  });
}

// Test setup.

final String pkgName = 'pkg';

final Builder builder = PartBuilder([BuiltValueGenerator()], '.g.dart');

Future<String> generate(String source) async {
  var srcs = <String, String>{
    'test_support|lib/test_support.dart': testSupportSource,
    '$pkgName|lib/value.dart': source,
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  String? error;
  void captureError(LogRecord logRecord) {
    if (logRecord.level != Level.SEVERE) return;
    if (error != null) throw StateError('Expected at most one error.');
    error = logRecord.message;
  }

  final id =
      AssetId(pkgName, '.dart_tool/build/generated/$pkgName/lib/value.g.dart');
  final result = await testBuilder(builder, srcs,
      rootPackage: pkgName, onLog: captureError);
  return error ??
      (result.readerWriter.testing.exists(id)
          ? result.readerWriter.testing.readString(id)
          : '');
}

// Classes mentioned in the test input need to exist, but we don't need the
// real versions. So just use minimal ones.
const String testSupportSource = r'''
const String nullable = 'nullable';

class Built<V, B> {}

class Builder<V, B> {}

class BuiltList<E> {}

class BuiltMap<K, V> {}

class EnumClass {}

class SerializersFor {
  final List<Type> types;

  const SerializersFor(this.types);
}

class Serializer<T> {}

class Serializers {}
''';
