// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/built_value.dart';
import 'package:end_to_end_test/enums.dart';
import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/values.dart';
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleValue', () {
    test('can be instantiated', () {
      SimpleValue((b) => b..anInt = 0);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(() => SimpleValue(),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));
    });

    test('includes field name in null error message', () {
      expect(() => SimpleValue(), throwsA(isErrorContaining('anInt')));
    });

    test('includes class name in null error message', () {
      expect(() => SimpleValue(), throwsA(isErrorContaining('SimpleValue')));
    });

    test('throws on null replace', () {
      expect(
          () => SimpleValue((b) => b
            ..anInt = 1
            ..replace(null)),
          throwsA(const TypeMatcher<ArgumentError>()));
    });

    test('fields can be set via build constructor', () {
      final value = SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two');
      expect(value.anInt, 1);
      expect(value.aString, 'two');
    });

    test('fields can be updated via rebuild method', () {
      final value = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '').rebuild((b) => b
        ..anInt = 1
        ..aString = 'two');
      expect(value.anInt, 1);
      expect(value.aString, 'two');
    });

    test('builder can be instantiated', () {
      SimpleValueBuilder();
    });

    test('builder exposes values via getters', () {
      final builder = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '').toBuilder();
      expect(builder.anInt, 0);
    });

    test('compares equal when equal', () {
      final value1 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1, value2);
    });

    test('compares not equal when not equal', () {
      final value1 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = SimpleValue((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1, isNot(equals(value2)));
    });

    test('hash matches quiver hash', () {
      final value = SimpleValue((b) => b
        ..anInt = 73
        ..aString = 'seventythree');
      expect(value.hashCode, hashObjects([value.anInt, value.aString]));
    });

    test('hashes equal when equal', () {
      final value1 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1.hashCode, value2.hashCode);
    });

    test('hashes not equal when not equal', () {
      final value1 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = SimpleValue((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1.hashCode, isNot(equals(value2.hashCode)));
    });

    test('has toString', () {
      final value1 = SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1.toString(), '''SimpleValue {
  anInt=0,
  aString=,
}''');
    });
  });

  group('CompoundValue', () {
    test('can be instantiated', () {
      CompoundValue((b) => b..simpleValue.anInt = 1);
    });

    test('throws on null for non-nullable nested fields on build', () {
      expect(() => CompoundValue(),
          throwsA(const TypeMatcher<BuiltValueNestedFieldError>()));
    });

    test('includes helpful information in null error message', () {
      expect(
          () => CompoundValue(),
          throwsA(allOf(
              // Mentions outer type.
              isErrorContaining('"CompoundValue"'),
              // Mentions field in outer type.
              isErrorContaining('"simpleValue"'),
              // Mentions inner type.
              isErrorContaining('"SimpleValue"'),
              // Mentions field in inner type.
              isErrorContaining('"anInt"'))));
    });

    test('allows nested updates', () {
      expect(
          CompoundValue((b) => b
            ..simpleValue.anInt = 1
            ..simpleValue.aString = 'two').simpleValue.anInt,
          1);
    });

    test('nullable nested builders can be assigned', () {
      expect(
          CompoundValue((b) => b
            ..simpleValue.anInt = 1
            ..validatedValue.anInt = 2).validatedValue.anInt,
          2);
    });

    test('hash matches quiver hash', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 1
        ..simpleValue.aString = 'two');

      expect(value.hashCode,
          hashObjects([value.simpleValue, value.validatedValue]));
    });
  });

  group('CompoundValueNoNesting', () {
    test('does not use nested builders', () {
      CompoundValueNoNesting(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));
    });
  });

  group(CompoundValueNoAutoNesting, () {
    test('does not auto create nested builders', () {
      expect(() => CompoundValueNoAutoNesting((b) => b..value),
          throwsA(const TypeMatcher<BuiltValueNestedFieldError>()));
    });
  });

  group('CompoundValueComparableBuilders', () {
    test('builder implements operator==', () {
      final left = CompoundValueComparableBuilders(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));
      final right = CompoundValueComparableBuilders(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));
      expect(left.toBuilder() == right.toBuilder(), true);
    });

    test('built does not equal builder', () {
      final value = CompoundValueComparableBuilders(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));

      /// ignore: unrelated_type_equality_checks
      expect(value == value.toBuilder(), false);
    });

    test('builder implements hashCode', () {
      final left = CompoundValueComparableBuilders(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));
      final right = CompoundValueComparableBuilders(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));
      expect(left.toBuilder().hashCode == right.toBuilder().hashCode, true);
    });

    test('built hashCode does not equal builder hashCode', () {
      final value = CompoundValueComparableBuilders(
          (b) => b..simpleValue = SimpleValue((b) => b..anInt = 1));

      // It's not actually required that the hash codes differ; but since
      // they are not equal, it's better if the hash codes _do_ differ. This
      // helps performance if you put both built and builder in a hash set or
      // map.
      expect(value.hashCode, isNot(value.toBuilder().hashCode));
    });
  });

  group('DerivedValue', () {
    test('caches derivedValue', () {
      final value = DerivedValue((b) => b..anInt = 7);
      expect(derivedValueGetterCount, 0);
      expect(value.derivedValue, 17);
      expect(derivedValueGetterCount, 1);
      expect(value.derivedValue, 17);
      expect(derivedValueGetterCount, 1);
    });

    test('caches derivedString', () {
      final value = DerivedValue((b) => b..anInt = 0);
      expect(derivedStringGetterCount, 0);
      expect(value.derivedString, [value.toString()]);
      expect(derivedStringGetterCount, 1);
      expect(value.derivedString, [value.toString()]);
      expect(derivedStringGetterCount, 1);
    });
  });

  group('ValidatedValue', () {
    test('can be instantiated', () {
      ValidatedValue((b) => b..anInt = 1);
    });

    test('does custom validation', () {
      expect(() => ValidatedValue((b) => b..anInt = 7),
          throwsA(const TypeMatcher<StateError>()));
    });
  });

  group('ValueWithCode', () {
    test('can be instantiated via custom factory', () {
      expect(
          ValueWithCode.fromCustomFactory(12),
          ValueWithCode((b) => b
            ..anInt = 12
            ..aString = 'two'));
    });

    test('has derived getter', () {
      expect(
          ValueWithCode((b) => b
            ..anInt = 12
            ..aString = 'two').youCanWriteDerivedGetters,
          '12two');
    });
  });

  group('ValueWithDefaults', () {
    test('has defaults', () {
      expect(ValueWithDefaults().anInt, 7);
    });

    test('builder exposes values via getters', () {
      final builder = ValueWithDefaults((b) => b..anInt = 12).toBuilder();
      expect(builder.anInt, 12);
    });
  });

  group(ValueWithBuilderSmarts, () {
    test('can be instantiated', () {
      ValueWithBuilderSmarts((b) => b..value = 'hi');
    });

    test('validates on set', () {
      expect(() => ValueWithBuilderSmarts((b) => b..value = 'not allowed'),
          throwsA(const TypeMatcher<ArgumentError>()));
    });
  });

  group('ValueUsingImportAs', () {
    test('can be instantiated', () {
      ValueUsingImportAs((b) => b..value = TestEnum.yes);
    });
  });

  group('ValueWithOnSet', () {
    test('notifies on sets', () {
      var notified = false;
      var builder = ValueWithOnSet((b) => b..value = 2).toBuilder();
      builder.onSet = () => notified = true;
      builder.value = 3;
      expect(notified, true);
    });
  });

  group(CustomToStringValue, () {
    test('has custom toString()', () {
      expect(CustomToStringValue().toString(), 'custom');
    });
  });

  group('ValueUsingImportAs', () {
    test('can be instantiated', () {
      ValueUsingImportAs((b) => b..value = TestEnum.yes);
    });
  });

  group('OtherValue', () {
    test('compares correctly', () {
      var value = OtherValue((b) => b..other = 1);
      var equalValue = OtherValue((b) => b..other = 1);
      expect(value, equalValue);
    });
  });
}
