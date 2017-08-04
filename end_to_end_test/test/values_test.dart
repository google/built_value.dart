// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:end_to_end_test/enums.dart';
import 'package:end_to_end_test/values.dart';
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleValue', () {
    test('can be instantiated', () {
      new SimpleValue((b) => b..anInt = 0);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(
          () => new SimpleValue(), throwsA(new isInstanceOf<ArgumentError>()));
    });

    test('throws on null replace', () {
      expect(
          () => new SimpleValue((b) => b
            ..anInt = 1
            ..replace(null)),
          throwsA(new isInstanceOf<ArgumentError>()));
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
          throwsA(new isInstanceOf<StateError>()));
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
