// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value.built_value_test;

import 'package:built_value/built_value.dart';
import 'package:unittest/unittest.dart';

void main() {
  group('BuiltValue', () {
    test('has a method like Iterable.skipWhile that updates in place', () {
      expect(
          (new SetBuilder<int>([1, 2])..skipWhile((x) => x == 1)).build(), [2]);
    });
  });
}
