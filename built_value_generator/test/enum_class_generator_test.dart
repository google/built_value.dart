// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

const String ignoreLintStatements = r'''

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_as
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals
''';

const String correctInput = r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}

abstract class TestEnumMixin = Object with _$TestEnumMixin;
''';

const String correctOutput = r'''
const TestEnum _$yes = const TestEnum._('yes');
const TestEnum _$no = const TestEnum._('no');
const TestEnum _$maybe = const TestEnum._('maybe');

TestEnum _$valueOf(String name) {
  switch (name) {
    case 'yes':
      return _$yes;
    case 'no':
      return _$no;
    case 'maybe':
      return _$maybe;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values = new BuiltSet<TestEnum>(const <TestEnum>[
  _$yes,
  _$no,
  _$maybe,
]);

class _$TestEnumMeta {
  const _$TestEnumMeta();
  TestEnum get yes => _$yes;
  TestEnum get no => _$no;
  TestEnum get maybe => _$maybe;
  TestEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<TestEnum> get values => _$values;
}

abstract class _$TestEnumMixin {
  // ignore: non_constant_identifier_names
  _$TestEnumMeta get TestEnum => const _$TestEnumMeta();
}
'''
    '$ignoreLintStatements';

void main() {
  group('generator', () {
    test('produces correct output for correct input', () async {
      expect(await generate(correctInput), endsWith(correctOutput));
    });

    test('produces two correct output for two correct inputs', () async {
      expect(
          await generateTwo(correctInput,
              correctInput.replaceAll('test_enum', 'test_enum_two')),
          endsWith(correctOutput.replaceAll('test_enum', 'test_enum_two')));
    });

    test('allows part statement with double quotes', () async {
      expect(
          await generate(correctInput.replaceAll(
              "part 'test_enum.g.dart'", 'part "test_enum.g.dart"')),
          endsWith(correctOutput));
    });

    test('ignores fields of different type', () async {
      expect(
          await generate(correctInput.replaceAll(
              'class TestEnum extends EnumClass {',
              'class TestEnum extends EnumClass {\n'
              '  static const int anInt = 3;')),
          endsWith(correctOutput));
    });

    test('fails on dynamic fields', () async {
      expect(
          await generate(correctInput.replaceAll(
              'class TestEnum extends EnumClass {',
              'class TestEnum extends EnumClass {\n'
              '  static const aNull = null;')),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Specify a type for field "aNull".
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on missing built_value import', () async {
      expect(
          await generate(r'''
library test_enum;

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Import EnumClass: import 'package:built_value/built_value.dart';
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on missing part statement', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'src_par.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          contains(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Import generated part: part 'test_enum.g.dart';
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on non-const static fields', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static TestEnum yes = _$yes;
  static TestEnum no = _$no;
  static TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Make field "yes" const.
//        2. Make field "no" const.
//        3. Make field "maybe" const.
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on non-const non-static fields', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  TestEnum yes = _$yes;
  TestEnum no = _$no;
  TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Make field "yes" static const.
//        2. Make field "no" static const.
//        3. Make field "maybe" static const.
'''
              '$ignoreLintStatements'));
    });

    test('ignores static const fields of wrong type', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const int count = 0;
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}

abstract class TestEnumMixin = Object with _$TestEnumMixin;
'''
              '$ignoreLintStatements'),
          endsWith(correctOutput));
    });

    test('matches generated names to rhs for field names', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$no;
  static const TestEnum no = _$maybe;
  static const TestEnum maybe = _$yes;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
const TestEnum _$no = const TestEnum._('yes');
const TestEnum _$maybe = const TestEnum._('no');
const TestEnum _$yes = const TestEnum._('maybe');

TestEnum _$valueOf(String name) {
  switch (name) {
    case 'yes':
      return _$no;
    case 'no':
      return _$maybe;
    case 'maybe':
      return _$yes;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values = new BuiltSet<TestEnum>(const <TestEnum>[
  _$no,
  _$maybe,
  _$yes,
]);
'''
              '$ignoreLintStatements'));
    });

    test('matches generated names to values and valueOf', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$vls;
  static TestEnum valueOf(String name) => _$vlOf(name);
}
'''),
          endsWith(r'''
const TestEnum _$yes = const TestEnum._('yes');
const TestEnum _$no = const TestEnum._('no');
const TestEnum _$maybe = const TestEnum._('maybe');

TestEnum _$vlOf(String name) {
  switch (name) {
    case 'yes':
      return _$yes;
    case 'no':
      return _$no;
    case 'maybe':
      return _$maybe;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$vls = new BuiltSet<TestEnum>(const <TestEnum>[
  _$yes,
  _$no,
  _$maybe,
]);
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on name clash for field rhs', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$no;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$yes;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Generated identifier "_$no" is used multiple times in test_enum, change to something else.
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on name clash for values', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$no;
  static const TestEnum no = _$maybe;
  static const TestEnum maybe = _$yes;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$no;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Generated identifier "_$no" is used multiple times in test_enum, change to something else.
'''
              '$ignoreLintStatements'));
    });

    test('does not fail with clash across multiple files', () async {
      expect(
          await generateTwo(correctInput,
              correctInput.replaceAll('test_enum', 'test_enum_two')),
          endsWith(correctOutput.replaceAll('test_enum', 'test_enum_two')));
    });

    test('fails with error on missing constructor', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Have exactly one constructor: const TestEnum._(String name) : super(name);
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on incorrect constructor', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Have exactly one constructor: const TestEnum._(String name) : super(name);
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on too many constructors', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);
  TestEnum._create(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}

abstract class BuiltSet<T> {
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Have exactly one constructor: const TestEnum._(String name) : super(name);
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on missing values getter', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Add getter: static BuiltSet<TestEnum> get values => _$values
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on missing valueOf', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Add method: static TestEnum valueOf(String name) => _$valueOf(name)
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on wrong mixin declaration', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}

class TestEnumMixin = Object with _$TestEnumMixin;
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Remove mixin or declare using exactly: abstract class TestEnumMixin = Object with _$TestEnumMixin;
'''
              '$ignoreLintStatements'));
    });

    test('fails with error on abstract class', () async {
      expect(
          await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

abstract class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
          endsWith(r'''
// Error: Please make the following changes to use EnumClass:
//
//        1. Make TestEnum concrete; remove "abstract".
'''
              '$ignoreLintStatements'));
    });

    test('is robust to newlines in input', () async {
      expect(await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name)
      : super(name);

  static BuiltSet<TestEnum> get values =>
      _$values;
  static TestEnum valueOf(String name) =>
      _$valueOf(name);
}

abstract class TestEnumMixin = Object with _$TestEnumMixin;
'''), endsWith(correctOutput));
    });
  });
}

// Test setup.

final String pkgName = 'pkg';

// Recreate BuiltValueGenerator for each test because we repeatedly create
// enums with the same name in the same library, which will clash.
Builder get builder => new PartBuilder([new BuiltValueGenerator()], '.g.dart');

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/test_enum.dart': source,
  };

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs, rootPackage: pkgName, writer: writer);
  return new String.fromCharCodes(
      writer.assets[new AssetId(pkgName, 'lib/test_enum.g.dart')]);
}

Future<String> generateTwo(String source, String source2) async {
  final srcs = {
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/test_enum.dart': source,
    '$pkgName|lib/test_enum_two.dart': source2
  };

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs, rootPackage: pkgName, writer: writer);
  return new String.fromCharCodes(
          writer.assets[new AssetId(pkgName, 'lib/test_enum.g.dart')]) +
      new String.fromCharCodes(
          writer.assets[new AssetId(pkgName, 'lib/test_enum_two.g.dart')]);
}

const String builtValueSource = r'''
library built_value;

class EnumClass {
  final String name;

  const EnumClass(this.name);

  @override
  String toString() => name;
}
''';
