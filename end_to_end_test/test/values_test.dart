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
      new SimpleValue((b) => b..anInt = 0);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(() => new SimpleValue(),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));
    });

    test('includes field name in null error message', () {
      expect(() => new SimpleValue(), throwsA(isErrorContaining('anInt')));
    });

    test('includes class name in null error message', () {
      expect(
          () => new SimpleValue(), throwsA(isErrorContaining('SimpleValue')));
    });

    test('throws on null replace', () {
      expect(
          () => new SimpleValue((b) => b
            ..anInt = 1
            ..replace(null)),
          throwsA(const TypeMatcher<ArgumentError>()));
    });

    test('fields can be set via build constructor', () {
      final value = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two');
      expect(value.anInt, 1);
      expect(value.aString, 'two');
    });

    test('fields can be updated via rebuild method', () {
      final value = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '').rebuild((b) => b
        ..anInt = 1
        ..aString = 'two');
      expect(value.anInt, 1);
      expect(value.aString, 'two');
    });

    test('builder can be instantiated', () {
      new SimpleValueBuilder();
    });

    test('builder exposes values via getters', () {
      final builder = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '').toBuilder();
      expect(builder.anInt, 0);
    });

    test('compares equal when equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1, value2);
    });

    test('compares not equal when not equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1, isNot(equals(value2)));
    });

    test('hash matches quiver hash', () {
      final value = new SimpleValue((b) => b
        ..anInt = 73
        ..aString = 'seventythree');
      expect(value.hashCode, hashObjects([value.anInt, value.aString]));
    });

    test('hashes equal when equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1.hashCode, value2.hashCode);
    });

    test('hashes not equal when not equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1.hashCode, isNot(equals(value2.hashCode)));
    });

    test('has toString', () {
      final value1 = new SimpleValue((b) => b
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
      new CompoundValue((b) => b..simpleValue.anInt = 1);
    });

    test('throws on null for non-nullable nested fields on build', () {
      expect(() => new CompoundValue(),
          throwsA(const TypeMatcher<BuiltValueNestedFieldError>()));
    });

    test('includes helpful information in null error message', () {
      expect(
          () => new CompoundValue(),
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
          new CompoundValue((b) => b
            ..simpleValue.anInt = 1
            ..simpleValue.aString = 'two').simpleValue.anInt,
          1);
    });

    test('nullable nested builders can be assigned', () {
      expect(
          new CompoundValue((b) => b
            ..simpleValue.anInt = 1
            ..validatedValue.anInt = 2).validatedValue.anInt,
          2);
    });

    test('hash matches quiver hash', () {
      final value = new CompoundValue((b) => b
        ..simpleValue.anInt = 1
        ..simpleValue.aString = 'two');

      expect(value.hashCode,
          hashObjects([value.simpleValue, value.validatedValue]));
    });
  });

  group('CompoundValueNoNesting', () {
    test('does not use nested builders', () {
      new CompoundValueNoNesting(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));
    });
  });

  group('CompoundValueComparableBuilders', () {
    test('builder implements operator==', () {
      final left = new CompoundValueComparableBuilders(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));
      final right = new CompoundValueComparableBuilders(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));
      expect(left.toBuilder() == right.toBuilder(), true);
    });

    test('built does not equal builder', () {
      final value = new CompoundValueComparableBuilders(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));

      /// ignore: unrelated_type_equality_checks
      expect(value == value.toBuilder(), false);
    });

    test('builder implements hashCode', () {
      final left = new CompoundValueComparableBuilders(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));
      final right = new CompoundValueComparableBuilders(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));
      expect(left.toBuilder().hashCode == right.toBuilder().hashCode, true);
    });

    test('built hashCode does not equal builder hashCode', () {
      final value = new CompoundValueComparableBuilders(
          (b) => b..simpleValue = new SimpleValue((b) => b..anInt = 1));

      // It's not actually required that the hash codes differ; but since
      // they are not equal, it's better if the hash codes _do_ differ. This
      // helps performance if you put both built and builder in a hash set or
      // map.
      expect(value.hashCode, isNot(value.toBuilder().hashCode));
    });
  });

  group('DerivedValue', () {
    test('caches derivedValue', () {
      final value = new DerivedValue((b) => b..anInt = 7);
      expect(derivedValueGetterCount, 0);
      expect(value.derivedValue, 17);
      expect(derivedValueGetterCount, 1);
      expect(value.derivedValue, 17);
      expect(derivedValueGetterCount, 1);
    });

    test('caches derivedString', () {
      final value = new DerivedValue((b) => b..anInt = 0);
      expect(derivedStringGetterCount, 0);
      expect(value.derivedString, [value.toString()]);
      expect(derivedStringGetterCount, 1);
      expect(value.derivedString, [value.toString()]);
      expect(derivedStringGetterCount, 1);
    });
  });

  group('ValidatedValue', () {
    test('can be instantiated', () {
      new ValidatedValue((b) => b..anInt = 1);
    });

    test('does custom validation', () {
      expect(() => new ValidatedValue((b) => b..anInt = 7),
          throwsA(const TypeMatcher<StateError>()));
    });
  });

  group('ValueWithCode', () {
    test('can be instantiated via custom factory', () {
      expect(
          new ValueWithCode.fromCustomFactory(12),
          new ValueWithCode((b) => b
            ..anInt = 12
            ..aString = 'two'));
    });

    test('has derived getter', () {
      expect(
          new ValueWithCode((b) => b
            ..anInt = 12
            ..aString = 'two').youCanWriteDerivedGetters,
          '12two');
    });
  });

  group('ValueWithDefaults', () {
    test('has defaults', () {
      expect(new ValueWithDefaults().anInt, 7);
    });

    test('builder exposes values via getters', () {
      final builder = new ValueWithDefaults((b) => b..anInt = 12).toBuilder();
      expect(builder.anInt, 12);
    });
  });

  group('ValueUsingImportAs', () {
    test('can be instantiated', () {
      new ValueUsingImportAs((b) => b..value = TestEnum.yes);
    });
  });
}
