// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/value_with_code.dart';
import 'package:test/test.dart';

void main() {
  group('ValueWithCode', () {
    test('can be instantiated via custom factory', () {
      expect(
          new ValueWithCode.fromCustomFactory(12),
          new ValueWithCode((b) => b
            ..anInt = 12
            ..aString = 'two'));
    });

    test('has derived getter', () {
      expect(
          new ValueWithCode((b) => b
            ..anInt = 12
            ..aString = 'two').youCanWriteDerivedGetters,
          '12two');
    });
  });
}
