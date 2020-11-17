// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.11

import 'package:built_value/built_value.dart';
import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/generics.dart';
import 'package:test/test.dart';

void main() {
  group('GenericValue', () {
    test('can be instantiated', () {
      GenericValue<int>((b) => b..value = 0);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(() => GenericValue<int>(),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));
    });

    test('throws on missing generic type parameter', () {
      expect(() => GenericValue<dynamic>((b) => b..value = 1),
          throwsA(const TypeMatcher<BuiltValueMissingGenericsError>()));
    });

    test('throws on missing generic type parameter via constructor', () {
      expect(() => GenericValue<dynamic>.of(1),
          throwsA(const TypeMatcher<BuiltValueMissingGenericsError>()));
    });

    test('includes parameter name in missing generics error message', () {
      expect(() => GenericValue<dynamic>((b) => b..value = 1),
          throwsA(isErrorContaining('"T"')));
    });

    test('includes class name in missing generics null error message', () {
      expect(() => GenericValue<dynamic>((b) => b..value = 1),
          throwsA(isErrorContaining('"GenericValue"')));
    });

    test('fields can be set via build constructor', () {
      final value = GenericValue<int>((b) => b..value = 1);
      expect(value.value, 1);
    });

    test('fields can be updated via rebuild method', () {
      final value =
          GenericValue<int>((b) => b..value = 0).rebuild((b) => b..value = 1);
      expect(value.value, 1);
    });

    test('builder can be instantiated', () {
      GenericValueBuilder<int>();
    });
  });

  group('BoundGenericValue', () {
    test('can be instantiated', () {
      BoundGenericValue<int>((b) => b.value = 0);
    });
  });

  group('GenericFunction', () {
    test('can be compared', () {
      // Generic functions have troublesome behaviour when casting. Check that
      // operator== does not throw due to a disallowed cast.
      final function = (int x) {};
      expect(
          GenericFunction<int>((b) => b..function = function) ==
              GenericFunction<int>((b) => b..function = function),
          true);
    });
  });
}
