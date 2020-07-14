// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/imported_values_nnbd.dart';
import 'package:end_to_end_test/values_nnbd.dart';
import 'package:test/test.dart';

void main() {
  group('ImportedValue', () {
    test('can be instantiated', () {
      ImportedValue((b) => b..simpleValue.anInt = 3);
    });
  });

  group('ImportedCustomValue', () {
    test('can be instantiated', () {
      ImportedCustomValue((b) => b
        ..simpleValue = SimpleValue((b) => b..anInt = 3)
        ..simpleValues = BuiltList.of([]));
    });
  });

  group('ImportedCustomNestedValue', () {
    test('can be instantiated', () {
      ImportedCustomNestedValue((b) => b
        ..simpleValue.anInt = 3
        ..simpleValues.add(SimpleValue((b) => b..anInt = 4)));
    });
  });
}
