// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

final String correctInput = r'''
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

final String correctOutput = r'''
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
      throw ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values = BuiltSet<TestEnum>(const <TestEnum>[
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
''';

void main() {
  group('generator', () {
    group('fails', () {
      test('on dynamic fields', () async {
        expect(
            await generate(correctInput.replaceAll(
                'class TestEnum extends EnumClass {',
                'class TestEnum extends EnumClass {\n'
                    '  static const aNull = null;')),
            contains(r'''Please make the following changes to use EnumClass:

1. Specify a type for field "aNull".'''));
      });

      test('with error on missing part statement', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Import generated part: part 'test_enum.g.dart';'''));
      });

      test('with error on non-const static fields', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Make field "yes" const.
2. Make field "no" const.
3. Make field "maybe" const.'''));
      });

      test('with error on non-const non-static fields', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Make field "yes" static const.
2. Make field "no" static const.
3. Make field "maybe" static const.'''));
      });

      test('with error on name clash for field rhs', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Generated identifier "_$no" is used multiple times in test_enum, change to something else.'''));
      });

      test('with error on name clash for values', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Generated identifier "_$no" is used multiple times in test_enum, change to something else.'''));
      });

      test('with error on missing constructor', () async {
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
            contains(r'''Please make the following changes to use EnumClass:

1. Have exactly one constructor: const TestEnum._(String name) : super(name); '''
                'or in Dart>=2.17: const TestEnum._(super.name);'));
      });

      test('with error on incorrect constructor', () async {
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
            contains(r'''Please make the following changes to use EnumClass:

1. Have exactly one constructor: const TestEnum._(String name) : super(name); '''
                'or in Dart>=2.17: const TestEnum._(super.name);'));
      });

      test('with error on too many constructors', () async {
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
            contains(r'''Please make the following changes to use EnumClass:

1. Have exactly one constructor: const TestEnum._(String name) : super(name); '''
                'or in Dart>=2.17: const TestEnum._(super.name);'));
      });

      test('with error on missing values getter', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Add getter: static BuiltSet<TestEnum> get values => _$values'''));
      });

      test('with error on missing valueOf', () async {
        expect(await generate(r'''
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
'''), contains(r'''Please make the following changes to use EnumClass:

1. Add method: static TestEnum valueOf(String name) => _$valueOf(name)'''));
      });

      test('with error on abstract class', () async {
        expect(await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

abstract class TestEnum extends EnumClass {
  static const TestEnum yes = _$yes;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''), contains(r'''Please make the following changes to use EnumClass:

1. Make TestEnum concrete; remove "abstract".'''));
      });

      test('if there is more than one fallback field', () async {
        expect(
            await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  @BuiltValueEnumConst(fallback: true)
  static const TestEnum yes = _$yes;
  @BuiltValueEnumConst(fallback: true)
  static const TestEnum no = _$no;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''),
            contains(r'''Please make the following changes to use EnumClass:

1. Remove `fallback = true` so that at most one constant is the fallback.'''
                ' Currently on "TestEnum" fields "yes", "no".'));
      });

      test('if both `wireName` and `wireNumber` are used', () async {
        expect(await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: 'yes', wireNumber: 1)
  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
'''), contains(r'''Please make the following changes to use EnumClass:

1. Specify either `wireName` or `wireNumber`, not both, on field "yes".'''));
      });
    });

    test('produces correct output for correct input', () async {
      expect(await generate(correctInput), contains(correctOutput));
    });

    test('produces two correct output for two correct inputs', () async {
      expect(
          await generateTwo(correctInput,
              correctInput.replaceAll('test_enum', 'test_enum_two')),
          contains(correctOutput.replaceAll('test_enum', 'test_enum_two')));
    });

    test('allows part statement with double quotes', () async {
      expect(
          await generate(correctInput.replaceAll(
              "part 'test_enum.g.dart'", 'part "test_enum.g.dart"')),
          contains(correctOutput));
    });

    test('ignores fields of different type', () async {
      expect(
          await generate(correctInput.replaceAll(
              'class TestEnum extends EnumClass {',
              'class TestEnum extends EnumClass {\n'
                  '  static const int anInt = 3;')),
          contains(correctOutput));
    });

    test('ignores static const fields of wrong type', () async {
      expect(await generate(r'''
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
'''), contains(correctOutput));
    });

    test('matches generated names to rhs for field names', () async {
      expect(await generate(r'''
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
'''), contains(r'''
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
      throw ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values = BuiltSet<TestEnum>(const <TestEnum>[
  _$no,
  _$maybe,
  _$yes,
]);
'''));
    });

    test('matches generated names to values and valueOf', () async {
      expect(await generate(r'''
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
'''), contains(r'''
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
      throw ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$vls = BuiltSet<TestEnum>(const <TestEnum>[
  _$yes,
  _$no,
  _$maybe,
]);
'''));
    });

    test('does not fail with clash across multiple files', () async {
      expect(
          await generateTwo(correctInput,
              correctInput.replaceAll('test_enum', 'test_enum_two')),
          contains(correctOutput.replaceAll('test_enum', 'test_enum_two')));
    });

    test('does not report name clash on null', () async {
      expect(await generate(r'''
library test_enum;

import 'package:built_value/built_value.dart';

part 'test_enum.g.dart';

class TestEnum extends EnumClass {
  static const TestEnum yes = _$no;
  static const TestEnum no = _$maybe;
  static const TestEnum maybe = _$yes;

  const TestEnum._(String name) : super(name);
}
'''), isNot(contains('null')));
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
'''), contains(correctOutput));
    });
  });
}

// Test setup.

final String pkgName = 'pkg';

// Recreate BuiltValueGenerator for each test because we repeatedly create
// enums with the same name in the same library, which will clash.
Builder get builder => PartBuilder([BuiltValueGenerator()], '.g.dart');

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/test_enum.dart': '// @dart=2.19\n$source',
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  String? error;
  void captureError(LogRecord logRecord) {
    if (logRecord.level != Level.SEVERE) return;
    if (error != null) throw StateError('Expected at most one error.');
    error = logRecord.message;
  }

  final result = await testBuilder(builder, srcs,
      rootPackage: pkgName, onLog: captureError);
  return error ??
      result.readerWriter.testing.readString(AssetId(
          pkgName, '.dart_tool/build/generated/$pkgName/lib/test_enum.g.dart'));
}

Future<String> generateTwo(String source, String source2) async {
  final srcs = {
    'built_value|lib/built_value.dart': builtValueSource,
    '$pkgName|lib/test_enum.dart': '// @dart=2.19\n$source',
    '$pkgName|lib/test_enum_two.dart': '// @dart=2.19\n$source2',
  };

  final result = await testBuilder(builder, srcs, rootPackage: pkgName);
  return result.readerWriter.testing.readString(AssetId(pkgName,
          '.dart_tool/build/generated/$pkgName/lib/test_enum.g.dart')) +
      result.readerWriter.testing.readString(AssetId(pkgName,
          '.dart_tool/build/generated/$pkgName/lib/test_enum_two.g.dart'));
}

const String builtValueSource = r'''
library built_value;

class EnumClass {
  final String name;

  const EnumClass(this.name);

  @override
  String toString() => name;
}

class BuiltValueEnumConst {
  final String? wireName;
  final int? wireNumber;
  final bool fallback;

  const BuiltValueEnumConst({
      this.wireName,
      this.wireNumber,
      this.fallback = false});
}
''';
