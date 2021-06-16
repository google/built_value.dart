// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.11

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    group('rejects', () {
      test('import with "show"', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart' show Built, Builder;
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop using "show" when importing '
                '"package:built_value/built_value.dart".'));
      });

      test('double quoted import with "show"', () async {
        expect(
            await generate('''library value;
import "package:built_value/built_value.dart" show Built, Builder;
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop using "show" when importing '
                '"package:built_value/built_value.dart".'));
      });

      test('import with "as"', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart' as bv;
part 'value.g.dart';
abstract class Value implements bv.Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements bv.Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop using "as" when importing '
                '"package:built_value/built_value.dart".'));
      });

      test('double quoted import with "as"', () async {
        expect(
            await generate('''library value;
import "package:built_value/built_value.dart" as bv;
part 'value.g.dart';
abstract class Value implements bv.Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements bv.Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop using "as" when importing '
                '"package:built_value/built_value.dart".'));
      });

      test('"extends" with concrete base', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
class Foo {}
abstract class Value extends Foo implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop class extending other classes. '
                'Only "implements" and "extends Object with" are allowed.'));
      });

      test('"extends" with base with fields', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  final int x;
}
abstract class Value extends Foo implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop class extending other classes. '
                'Only "implements" and "extends Object with" are allowed.'));
      });

      test('"extends" with base with abstract getter', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  int get x;
}
abstract class Value extends Foo implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop class extending other classes. '
                'Only "implements" and "extends Object with" are allowed.'));
      });

      test('"extends" with base with operator==', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Foo {
  bool operator ==(other) => true;
}
abstract class Value extends Foo implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Stop class extending other classes. '
                'Only "implements" and "extends Object with" are allowed.'));
      });

      test('"extends Built"', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), allOf(contains('Make class implement Built<Value, ValueBuilder>.')));
      });

      test('hashCode', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  int get hashCode => 0;
}'''), contains('1. Stop implementing hashCode; it will be generated for you.'));
      });

      test('operator==', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  bool operator==(other) => false;
}'''), contains('1. Stop implementing operator==; it will be generated for you.'));
      });

      test('dynamic fields', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  get foo;
}'''),
            contains('1. Make field foo have non-dynamic type. If you are '
                'already specifying a type, please make sure the type is correctly imported.'));
      });

      test('2.12 rejects @nullable annotation', () async {
        expect(
            await generate('''// @dart=2.12
library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  
  @nullable
  int get x;
}'''),
            contains('1. Remove "@nullable" from field "x". '
                'In null safe code, add "?" to the field type instead.'));
      });
    });

    group('suggests', () {
      test('to import part file', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains("1. Import generated part: part 'value.g.dart';"));
      });

      test('to make value class abstract', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make class abstract.'));
      });

      test('correct Built type parameters for implements', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Foo, Bar> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make class implement Built<Value, ValueBuilder>.'));
      });

      test('making builder initializer static', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  void _initializeBuilder(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix _initializeBuilder signature: '
                'static void _initializeBuilder(ValueBuilder b)'));
      });

      test('making builder initializer return void', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  static String _initializeBuilder(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix _initializeBuilder signature: '
                'static void _initializeBuilder(ValueBuilder b)'));
      });

      test('making builder initializer accept a builder', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  static void _initializeBuilder(String b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix _initializeBuilder signature: '
                'static void _initializeBuilder(ValueBuilder b)'));
      });

      test('making builder finalizer static', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  void _finalizeBuilder(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix _finalizeBuilder signature: '
                'static void _finalizeBuilder(ValueBuilder b)'));
      });

      test('making builder finalizer return void', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  static String _finalizeBuilder(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix _finalizeBuilder signature: '
                'static void _finalizeBuilder(ValueBuilder b)'));
      });

      test('making builder finalizer accept a builder', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  static void _finalizeBuilder(String b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix _finalizeBuilder signature: '
                'static void _finalizeBuilder(ValueBuilder b)'));
      });

      test('removing annotation from _initializeBuilder', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static void _initializeBuilder(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Remove @BuiltValueHook from _initializeBuilder. '
                'It is a magic method name that is always a hook. Or, to use '
                'the annotation, please rename the method.'));
      });

      test('fixing signature of @BuiltValueHook(initializeBuilder: true)',
          () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static String hook(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix hook signature to use it with @BuiltValueHook: '
                'static void hook(ValueBuilder b)'));
      });

      test('removing annotation from _finalizeBuilder', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  @BuiltValueHook(finalizeBuilder: true)
  static void _finalizeBuilder(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Remove @BuiltValueHook from _finalizeBuilder. '
                'It is a magic method name that is always a hook. Or, to use '
                'the annotation, please rename the method.'));
      });

      test('fixing signature of @BuiltValueHook(finalizeBuilder: true)',
          () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  @BuiltValueHook(finalizeBuilder: true)
  static String hook(ValueBuilder b) {}
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Fix hook signature to use it with @BuiltValueHook: '
                'static void hook(ValueBuilder b)'));
      });

      test('to add constructor to value class', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make class have exactly one constructor: Value._();'));
      });

      test('to add constructor when there is synthetic constructor', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make class have exactly one constructor: Value._();'));
      });

      test('to remove constructor from non-instantiable value class', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(instantiable: false)
abstract class Value implements Built<Value, ValueBuilder> {
  Value() {}
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Remove all constructors or remove "instantiable: false".'));
      });

      test('to add factory to value class', () async {
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
                'factory Value([void Function(ValueBuilder)? updates]) = _\$Value;'));
      });

      test('to remove factory from non-instantiable value class', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(instantiable: false)
abstract class Value implements Built<Value, ValueBuilder> {
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Remove all factories or remove "instantiable: false".'));
      });

      test('to make builder class abstract', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make builder class abstract'));
      });

      test('correct Builder type parameters', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Foo, Bar> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains(
                '1. Make builder class implement Builder<Value, ValueBuilder>. '
                'Currently: Builder<dynamic, dynamic>'));
      });

      test('to add constructor to builder class', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
            contains('1. Make builder class '
                'have exactly one constructor: ValueBuilder._();'));
      });

      test('constructor for builder class with synthetic constructor',
          () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
}'''),
            contains('1. Make builder class '
                'have exactly one constructor: ValueBuilder._();'));
      });

      test('to add factory to builder class', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
}'''),
            contains('1. Make builder class have exactly one factory: '
                'factory ValueBuilder() = _\$ValueBuilder;'));
      });

      test('value fields must be getters', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  int foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  int foo;
}'''), contains('1. Make field foo a getter.'));
      });

      test('value fields must be public', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  int get _foo;
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}'''), contains('1. Make field _foo public; remove the underscore.'));
      });

      test('builder fields must be normal fields', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
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

      test('builder fields must be in sync', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), contains('1. Make builder have exactly these fields: foo'));
      });

      test('builder fields must be same type', () async {
        expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  int get foo;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
  String foo;
}'''), contains('1. Make builder field foo have type: int'));
      });

      test('built_collection fields instead of SDK fields', () async {
        expect(
            await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  List get list;
  Set get set;
  Map get map;
}'''),
            allOf(
                contains('1. Make field "list" have type "BuiltList". '
                    'The current type, "List<dynamic>", is not allowed '
                    'because it is mutable.'),
                contains('2. Make field "set" have type "BuiltSet". '
                    'The current type, "Set<dynamic>", is not allowed '
                    'because it is mutable.')));
      });
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
abstract class Value extends Foo implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''), isNot(contains('1.')));
    });

    test('works with multiple implements', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder>, Object {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}'''), isNot(contains('1.')));
    });

    test('allows updates to have return type', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder>, Object {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}'''), isNot(contains('1.')));
    });

    test('handles unresolved Built type parameters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}'''), isNot(contains('1.')));
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
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          isNot(contains(
              '1. Make class have exactly one constructor: Value._();')));
    });

    test('ignores setters', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
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
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
}
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}
''');
      expect(generated, isNot(contains('super._() {}')));
      expect(generated, contains('super._();'));
    });

    test('uses toString()', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  String toString() => 'hi!';
}'''), isNot(contains('String toString()')));
    });

    test('comparableBuilders with nestedBuilders', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(comparableBuilders: true)
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  }'''),
          contains(
              '1. Set `nestedBuilders: false` in order to use `comparableBuilders: true`.'));
    });

    test('comparableBuilders with field nestedBuilder', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
@BuiltValue(comparableBuilders: true, nestedBuilders: false)
abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
  
  @BuiltValueField(nestedBuilder: true)
  NestedValue get nestedValue;
}
abstract class NestedValue implements Built<NestedValue, NestedValueBuilder> {
  NestedValue._();
  factory NestedValue([void Function(NestedValueBuilder) updates]) = _\$NestedValue;
}
'''),
          contains(
              '1. Make builder field nestedValue have `nestedBuilder: false` in order to use `comparableBuilders: true`.'));
    });

    test('cleans generated class names for private classes', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class _Value implements Built<_Value, _ValueBuilder> {
  _Value._();
  factory _Value([void Function(_ValueBuilder) updates]) = _\$Value;
}'''),
          allOf(
            isNot(contains(r'_$_')),
            isNot(contains(r'1.')),
          ));
    });
  });
}

// Test setup.

final String pkgName = 'pkg';

final Builder builder = PartBuilder([BuiltValueGenerator()], '.g.dart');

Future<String> generate(String source) async {
  var srcs = <String, String>{
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/value.dart': source,
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  String error;
  void captureError(dynamic logRecord) {
    if (logRecord.error is InvalidGenerationSourceError) {
      if (error != null) throw StateError('Expected at most one error.');
      error = logRecord.error.toString();
    }
  }

  var writer = InMemoryAssetWriter();
  await testBuilder(builder, srcs,
      rootPackage: pkgName, writer: writer, onLog: captureError);
  return error ??
      String.fromCharCodes(
          writer.assets[AssetId(pkgName, 'lib/value.g.dart')] ?? []);
}

const String builtValueSource = r'''
library built_value;

const nullable = 'nullable';

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

class BuiltValueField {
  final bool? compare;
  final bool? serialize;
  final String? wireName;
  final bool? nestedBuilder;
  final bool? autoCreateNestedBuilder;

  const BuiltValueField(
      {this.compare,
      this.serialize,
      this.wireName,
      this.nestedBuilder,
      this.autoCreateNestedBuilder});
}

class BuiltValueHook {
  final bool initializeBuilder;
  final bool finalizeBuilder;

  const BuiltValueHook(
      {this.initializeBuilder,
      this.finalizeBuilder});
}
''';
