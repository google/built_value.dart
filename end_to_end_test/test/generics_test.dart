// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_value/built_value.dart';
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

  group('InitializeGenericValue', () {
    test('can initialize itself for int', () {
      InitializeGenericValue<int>();
    });
  });

  group('BoundGenericValue', () {
    test('can be instantiated', () {
      BoundGenericValue<int>((b) => b.value = 0);
      BoundGenericValue<int>((b) => b
        ..value = 0
        ..nullableValue = 1);
    });
  });

  group('BoundNullableGenericValue', () {
    test('can be instantiated', () {
      BoundNullableGenericValue<int>((b) => b.value = 1);
      BoundNullableGenericValue<int>((b) => b
        ..value = 1
        ..nullableValue = 2);
      BoundNullableGenericValue<int?>();
      BoundNullableGenericValue<int?>((b) => b.value = 1);
      BoundNullableGenericValue<int?>((b) => b
        ..value = 1
        ..nullableValue = 2);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(() => BoundNullableGenericValue<int>(),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));
    });
  });

  group('GenericFunction', () {
    test('can be compared', () {
      // Generic functions have troublesome behaviour when casting. Check that
      // operator== does not throw due to a disallowed cast.
      void function(int x) {}
      expect(
          GenericFunction<int>((b) => b..function = function) ==
              GenericFunction<int>((b) => b..function = function),
          true);
    });
  });
}
