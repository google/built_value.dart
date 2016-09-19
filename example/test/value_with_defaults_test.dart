// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/value_with_defaults.dart';
import 'package:test/test.dart';

void main() {
  group('ValueWithDefaults', () {
    test('has defaults', () {
      expect(new ValueWithDefaults().anInt, 7);
    });
  });
}
