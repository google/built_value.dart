// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

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
}'''), contains("TODO: Import generated part: part 'value.g.dart';"));
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
}'''), contains("TODO: Make class abstract"));
    });

    test('suggests to add constructor to value class', () async {
      expect(
          await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}
abstract class ValueBuilder extends Builder<Value, ValueBuilder> {
  ValueBuilder._();
  factory ValueBuilder() = _\$ValueBuilder;
}'''),
          contains(
              "TODO: Make class have exactly one constructor: Value._();"));
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
          contains("TODO: Make class have exactly one factory: "
              "factory Value([updates(ValueBuilder b)]) = _\$Value;"));
    });

    test('suggests to add builder class', () async {
      expect(await generate('''library value;
import 'package:built_value/built_value.dart';
part 'value.g.dart';
abstract class Value extends Built<Value, ValueBuilder> {
  Value._();
  factory Value([updates(ValueBuilder b)]) = _\$Value;
}'''), contains("TODO: Add abstract class ValueBuilder"));
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
}'''), contains("TODO: Make builder class abstract"));
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
          contains("TODO: Make builder class "
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
          contains("TODO: Make builder class have exactly one factory: "
              "factory ValueBuilder() = _\$ValueBuilder;"));
    });

    test('suggests value fields must be getters', () async {
      expect(
          await generate('''library value;
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
}'''),
          contains("TODO: Make field foo a getter"));
    });

    test('suggests builder fields must be getters', () async {
      expect(
          await generate('''library value;
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
}'''),
          contains("TODO: Make builder field foo a normal field"));
    });

    test('suggests builder fields must be in sync', () async {
      expect(
          await generate('''library value;
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
}'''),
          contains("TODO: Make builder have exactly these fields: foo"));
    });

    test('suggests builder fields must be same type', () async {
      expect(
          await generate('''library value;
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
}'''),
          contains("TODO: Make builder field foo have type int"));
    });
  });
}

// Test setup.

Future<String> generate(String source) async {
  final tempDir =
      Directory.systemTemp.createTempSync('built_value_generator.dart.');
  final packageDir = new Directory(tempDir.path + '/packages')..createSync();
  final builtValueDir = new Directory(packageDir.path + '/built_value')
    ..createSync();
  final builtValueFile = new File(builtValueDir.path + '/built_value.dart')
    ..createSync();
  builtValueFile.writeAsStringSync(builtValueSource);

  final libDir = new Directory(tempDir.path + '/lib')..createSync();
  final sourceFile = new File(libDir.path + '/value.dart');
  sourceFile.writeAsStringSync(source);

  await build([], [new BuiltValueGenerator()],
      projectPath: tempDir.path, librarySearchPaths: <String>['lib']);
  final outputFile = new File(libDir.path + '/value.g.dart');
  return outputFile.existsSync() ? outputFile.readAsStringSync() : '';
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
''';
