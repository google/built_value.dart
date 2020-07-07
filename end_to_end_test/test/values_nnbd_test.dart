// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:built_collection/src/internal/hash.dart';
import 'package:built_value/built_value.dart';
import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/values_nnbd.dart';
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
            ..replace(null as SimpleValue)),
          throwsA(const TypeMatcher<Error>()));
    });

    test('fields can be set via build constructor', () {
      final value = SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..$mustBeEscaped = true);
      expect(value.anInt, 1);
      expect(value.aString, 'two');
      expect(value.$mustBeEscaped, true);
    });

    test('fields can be updated via rebuild method', () {
      final value = SimpleValue((b) => b
        ..anInt = 0
        ..aString = ''
        ..$mustBeEscaped = true).rebuild((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..$mustBeEscaped = false);
      expect(value.anInt, 1);
      expect(value.aString, 'two');
      expect(value.$mustBeEscaped, false);
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
        ..aString = 'seventythree'
        ..$mustBeEscaped = true);
      expect(
          value.hashCode,
          hashObjects(<Object?>[
            value.anInt,
            value.aString,
            value.$mustBeEscaped,
          ]));
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
        ..aString = ''
        ..$mustBeEscaped = true);
      expect(value1.toString(), '''SimpleValue {
  anInt=0,
  aString=,
  \$mustBeEscaped=true,
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
            ..validatedValue.anInt = 2).validatedValue!.anInt,
          2);
    });

    test('hash matches quiver hash', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 1
        ..simpleValue.aString = 'two');

      expect(value.hashCode,
          hashObjects(<Object?>[value.simpleValue, value.validatedValue]));
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
}
