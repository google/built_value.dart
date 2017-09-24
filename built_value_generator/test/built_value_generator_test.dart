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
    test('suggests to import part file', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Import generated part: part 'value.g.dart';"));
    });

    test('suggests to make value class abstract', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make class abstract."));
    });

    test('suggests correct Built type parameters', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Foo, Bar> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Make class implement Built<Value, ValueBuilder>. '
              'Currently: Built<Foo, Bar>'));
    });

    test('suggests correct Built type parameters for implements', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Foo, Bar> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Make class implement Built<Value, ValueBuilder>. '
              'Currently: Built<Foo, Bar>'));
    });

    test('works with multiple implements', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder>, Object {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}'''), isNot(contains('1.')));
    });

    test('allows updates to have return type', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder>, Object {
  Value._();
  factory Value([void updates(ValueBuilder b)]) = _\$Value;
}'''), isNot(contains('1.')));
    });

    test('handles unresolved Built type parameters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}'''), isNot(contains('1.')));
    });

    test('suggests to add constructor to value class', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make class have exactly one constructor: Value._();"));
    });

    test('suggests to add constructor when there is synthetic constructor',
        () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make class have exactly one constructor: Value._();"));
    });

    test('allows code in constructor of value class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._() {
    print("hi");
  }
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          isNot(contains(
              "1. Make class have exactly one constructor: Value._();")));
    });

    test('suggests to remove constructor from non-instantiable value class',
        () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(instantiable: false)
abstract class Value extends Built<Value, ValueBuilder> {
  Value() {}
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Remove all constructors or remove "instantiable: false".'));
    });

    test('suggests to add factory to value class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains(
              '1. Add a factory so your class can be instantiated. Example:\n'
              '//\n'
              '//        '
              'factory Value([updates(ValueBuilder b)]) = _\$Value;'));
    });

    test('suggests to remove factory from non-instantiable value class',
        () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(instantiable: false)
abstract class Value extends Built<Value, ValueBuilder> {
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Remove all factories or remove "instantiable: false".'));
    });

    test('suggests to make builder class abstract', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make builder class abstract"));
    });

    test('suggests correct Builder type parameters', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Foo, Bar> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains(
              '1. Make builder class implement Builder<Value, ValueBuilder>. '
              'Currently: Builder<dynamic, dynamic>'));
    });

    test('suggests to add constructor to builder class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains("1. Make builder class "
              "have exactly one constructor: ValueBuilder._();"));
    });

    test('suggests constructor for builder class with synthetic constructor',
        () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
}'''),
          contains("1. Make builder class "
              "have exactly one constructor: ValueBuilder._();"));
    });

    test('suggests to add factory to builder class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
}'''),
          contains("1. Make builder class have exactly one factory: "
              "factory ValueBuilder() = _\$ValueBuilder;"));
    });

    test('suggests value fields must be getters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int foo;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  int foo;
}'''), contains("1. Make field foo a getter."));
    });

    test('rejects dynamic fields', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  get foo;
}'''), contains("1. Make field foo have non-dynamic type."));
    });

    test('suggests builder fields must be getters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  int get foo;
}'''), contains("1. Make builder field foo a normal field."));
    });

    test('suggests builder fields must be in sync', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make builder have exactly these fields: foo"));
    });

    test('suggests builder fields must be same type', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  String foo;
}'''), contains("1. Make builder field foo have type: int"));
    });

    test('ignores setters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  set foo(int foo) => print(foo);
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  set foo(int foo) => print(foo);
}'''), isNot(contains('1.')));
    });

    test('generates empty constructor with semicolon not braces', () async {
      final generated = await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}
''');
      expect(generated, isNot(contains('super._() {}')));
      expect(generated, contains('super._();'));
    });
  });

  test('rejects hashCode', () async {
    expect(
        await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get hashCode => 0;
}'''),
        contains(
            '1. Stop implementing hashCode; it will be generated for you.'));
  });

  test('rejects operator==', () async {
    expect(
        await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  bool operator==(other) => false;
}'''),
        contains(
            '1. Stop implementing operator==; it will be generated for you.'));
  });

  test('uses toString()', () async {
    expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  String toString() => 'hi!';
}'''), isNot(contains('String toString()')));
  });
}

// Test setup.

final String pkgName = 'pkg';

final Builder builder = new PartBuilder([new BuiltValueGenerator()]);

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/value.dart': source,
  };

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs, rootPackage: pkgName, writer: writer);
  return writer.assets[new AssetId(pkgName, 'lib/value.g.dart')]?.stringValue;
}

const String builtValueSource = r'''
library built_value;

abstract class Built<V extends Built<V, B>, B extends Builder<V, B>> {
  V rebuild(updates(B builder));
  B toBuilder();
}

abstract class Builder<V extends Built<V, B>, B extends Builder<V, B>> {
  void replace(V value);
  void update(updates(B builder));
  V build();
}

class BuiltValue {
  final bool instantiable;
  final bool nestedBuilders;

  const BuiltValue({this.instantiable: true, this.nestedBuilders: true});
}
''';
