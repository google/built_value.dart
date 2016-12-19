// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/memoization.dart';
import 'package:test/test.dart';

void main() {
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
}
