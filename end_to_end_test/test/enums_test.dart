// Copyright (c) 2019, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.8

import 'package:end_to_end_test/enums.dart';
import 'package:test/test.dart';

void main() {
  group('FallbackEnum', () {
    test('valueOf works for non-fallback values', () {
      expect(FallbackEnum.valueOf('yes'), FallbackEnum.yes);
    });

    test('valueOf uses fallback', () {
      expect(FallbackEnum.valueOf('arbitrary_unrecognized_string'),
          FallbackEnum.no);
    });
  });
}
