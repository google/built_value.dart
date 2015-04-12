// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/compound_value.dart';
import 'package:test/test.dart';

void main() {
  group('compound value', () {
    test('can be instantiated', () {
      new CompoundValue();
    });

    test('allows nested updates', () {
      expect(new CompoundValue((b) => b.value
        ..anInt = 1
        ..anObject = 2).value.anInt, 1);
    });
  });
}
