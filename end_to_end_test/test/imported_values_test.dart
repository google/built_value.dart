// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:end_to_end_test/imported_values.dart';
import 'package:test/test.dart';

void main() {
  group('ImportedValue', () {
    test('can be instantiated', () {
      new ImportedValue((b) => b..simpleValue.anInt = 3);
    });
  });
}
