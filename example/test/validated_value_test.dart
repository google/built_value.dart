// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/validated_value.dart';
import 'package:test/test.dart';

void main() {
  group('ValidatedValue', () {
    test('can be instantiated', () {
      new ValidatedValue((b) => b..anInt = 1);
    });

    test('does custom validation', () {
      expect(() => new ValidatedValue((b) => b..anInt = 7), throws);
    });
  });
}
