// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:end_to_end_test/generics.dart';
import 'package:test/test.dart';

void main() {
  group('GenericValue', () {
    test('can be instantiated', () {
      new GenericValue<int>((b) => b..value = 0);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(() => new GenericValue<int>(), throws);
    });

    test('throws on missing generic type parameter', () {
      expect(() => new GenericValue((b) => b..value = 1), throws);
    });

    test('fields can be set via build constructor', () {
      final value = new GenericValue<int>((b) => b..value = 1);
      expect(value.value, 1);
    });

    test('fields can be updated via rebuild method', () {
      final value = new GenericValue<int>((b) => b..value = 0)
          .rebuild((b) => b..value = 1);
      expect(value.value, 1);
    });

    test('builder can be instantiated', () {
      new GenericValueBuilder<int>();
    });
  });

  group('BoundGenericValue', () {
    test('can be instantiated', () {
      new BoundGenericValue<int>((b) => b.value = 0);
    });
  });
}
