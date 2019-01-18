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
    test('rejects import with "show"', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart' show Built, Builder;
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop using "show" when importing '
              '"package:built_value/built_value.dart".'));
    });

    test('rejects double quoted import with "show"', () async {
      expect(
          await generate('''library value;
import "package:built_value/built_value.dart" show Built, Builder;
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop using "show" when importing '
              '"package:built_value/built_value.dart".'));
    });

    test('rejects import with "as"', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart' as bv;
part 'value.g.dart';
abstract class Value implements bv.Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements bv.Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop using "as" when importing '
              '"package:built_value/built_value.dart".'));
    });

    test('rejects double quoted import with "as"', () async {
      expect(
          await generate('''library value;
import "package:built_value/built_value.dart" as bv;
part 'value.g.dart';
abstract class Value implements bv.Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements bv.Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop using "as" when importing '
              '"package:built_value/built_value.dart".'));
    });

    test('suggests to import part file', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Import generated part: part 'value.g.dart';"));
    });

    test('suggests to make value class abstract', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make class abstract."));
    });

    test('suggests correct Built type parameters for implements', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Foo, Bar> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make class implement Built<Value, ValueBuilder>.'));
    });

    test('rejects "extends" with concrete base', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
class Foo {}
abstract class Value implements Built<Value, ValueBuilder> extends Foo {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop class extending other classes. '
              'Only "implements" and "extends Object with" are allowed.'));
    });

    test('rejects "extends" with base with fields', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  final int x;
}
abstract class Value implements Built<Value, ValueBuilder> extends Foo {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop class extending other classes. '
              'Only "implements" and "extends Object with" are allowed.'));
    });

    test('rejects "extends" with base with abstract getter', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  int get x;
}
abstract class Value implements Built<Value, ValueBuilder> extends Foo {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop class extending other classes. '
              'Only "implements" and "extends Object with" are allowed.'));
    });

    test('rejects "extends" with base with operator==', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  bool get operator==(other) => true;
}
abstract class Value implements Built<Value, ValueBuilder> extends Foo {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains('1. Stop class extending other classes. '
              'Only "implements" and "extends Object with" are allowed.'));
    });

    test(
        'allows "extends" with base with abstract and concrete methods '
        'and concrete getters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  int foo();
  int bar() => 3;
  int get baz => foo();
}
abstract class Value implements Built<Value, ValueBuilder> extends Foo {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), isNot(contains('1.')));
    });

    test('rejects "extends Built"', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), allOf(contains('Make class implement Built<Value, ValueBuilder>.')));
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
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}'''), isNot(contains('1.')));
    });

    test('suggests to add constructor to value class', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make class have exactly one constructor: Value._();"));
    });

    test('suggests to add constructor when there is synthetic constructor',
        () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make class have exactly one constructor: Value._();"));
    });

    test('allows code in constructor of value class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._() {
    print("hi");
  }
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
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
abstract class Value implements Built<Value, ValueBuilder> {
  Value() {}
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Remove all constructors or remove "instantiable: false".'));
    });

    test('suggests to add factory to value class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains(
              '1. Add a factory so your class can be instantiated. Example:\n'
              '\n'
              'factory Value([updates(ValueBuilder b)]) = _\$Value;'));
    });

    test('suggests to remove factory from non-instantiable value class',
        () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(instantiable: false)
abstract class Value implements Built<Value, ValueBuilder> {
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Remove all factories or remove "instantiable: false".'));
    });

    test('suggests to make builder class abstract', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make builder class abstract"));
    });

    test('suggests correct Builder type parameters', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Foo, Bar> {
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
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
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
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
}'''),
          contains("1. Make builder class "
              "have exactly one constructor: ValueBuilder._();"));
    });

    test('suggests to add factory to builder class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
}'''),
          contains("1. Make builder class have exactly one factory: "
              "factory ValueBuilder() = _\$ValueBuilder;"));
    });

    test('suggests value fields must be getters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  int foo;
}'''), contains("1. Make field foo a getter."));
    });

    test('suggests value fields must be public', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  int get _foo;
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}'''), contains('1. Make field _foo public; remove the underscore.'));
    });

    test('rejects dynamic fields', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  get foo;
}'''),
          contains('1. Make field foo have non-dynamic type. If you are '
              'already specifying a type, please make sure the type is correctly imported.'));
    });

    test('suggests builder fields must be normal fields', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  int get foo;
}'''),
          contains('1. Make builder field foo a normal field or a '
              'getter/setter pair.'));
    });

    test('suggests builder fields must be in sync', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Make builder have exactly these fields: foo"));
    });

    test('suggests builder fields must be same type', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  String foo;
}'''), contains("1. Make builder field foo have type: int"));
    });

    test('ignores setters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  set foo(int foo) => print(foo);
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  set foo(int foo) => print(foo);
}'''), isNot(contains('1.')));
    });

    test('generates empty constructor with semicolon not braces', () async {
      final generated = await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
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
abstract class Value implements Built<Value, ValueBuilder> {
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
abstract class Value implements Built<Value, ValueBuilder> {
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
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  String toString() => 'hi!';
}'''), isNot(contains('String toString()')));
  });

  test('suggests built_collection fields instead of SDK fields', () async {
    expect(
        await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  List get list;
  Set get set;
  Map get map;
}'''),
        allOf(
            contains('1. Make field "list" have type "BuiltList". '
                'The current type, "List", is not allowed '
                'because it is mutable.'),
            contains('2. Make field "set" have type "BuiltSet". '
                'The current type, "Set", is not allowed '
                'because it is mutable.')));
  });

  test('rejects comparableBuilders with nestedBuilders', () async {
    expect(
        await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(comparableBuilders: true)
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
  }'''),
        contains(
            '1. Set `nestedBuilders: false` in order to use `comparableBuilders: true`.'));
  });
}

// Test setup.

final String pkgName = 'pkg';

final Builder builder = new PartBuilder([new BuiltValueGenerator()], '.g.dart');

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/value.dart': source,
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  String error;
  void captureError(LogRecord logRecord) {
    if (logRecord.error is InvalidGenerationSourceError) {
      if (error != null) throw StateError('Expected at most one error.');
      error = logRecord.error.toString();
    }
  }

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs,
      rootPackage: pkgName, writer: writer, onLog: captureError);
  return error ??
      new String.fromCharCodes(
          writer.assets[new AssetId(pkgName, 'lib/value.g.dart')] ?? []);
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
  final bool comparableBuilders;
  final bool instantiable;
  final bool nestedBuilders;
  final String wireName;

  const BuiltValue({
      this.comparableBuilders: false,
      this.instantiable: true,
      this.nestedBuilders: true,
      this.wireName});
}
''';
