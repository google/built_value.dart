// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:end_to_end_test/enums_nnbd.dart';
import 'package:test/test.dart';

void main() {
  group(TestEnumMixin, () {
    test('mixin works as expected', () {
      expect(UsesTestEnumMixin().toString(), 'yes no maybe');
    });
  });
  group(FallbackEnum, () {
    test('valueOf works for non-fallback values', () {
      expect(FallbackEnum.valueOf('yes'), FallbackEnum.yes);
    });

    test('valueOf uses fallback', () {
      expect(FallbackEnum.valueOf('arbitrary_unrecognized_string'),
          FallbackEnum.no);
    });
  });
}

class UsesTestEnumMixin with TestEnumMixin {
  // Refer to the constants to check they are available via the mixin from
  // another class.
  @override
  String toString() =>
      '${this.TestEnum.yes} ${this.TestEnum.no} ${this.TestEnum.maybe}';
}
