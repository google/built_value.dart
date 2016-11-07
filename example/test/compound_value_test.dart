// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/compound_value.dart';
import 'package:example/validated_value.dart';
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
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
            ..validatedValue = new ValidatedValueBuilder()
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
}
