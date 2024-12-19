// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:end_to_end_test/mixins.dart';
import 'package:test/test.dart';

void main() {
  group(GetsCorrectFieldsViaMixins, () {
    test('has correct fields', () {
      // If it has any unwanted fields they will not be nullable so this will
      // throw.
      var value = GetsCorrectFieldsViaMixins((b) => b..shouldBeAField = 1);
      expect(value.shouldBeAField, 1);
    });
  });
}
