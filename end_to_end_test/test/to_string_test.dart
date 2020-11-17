// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.11

import 'package:built_value/built_value.dart';
import 'package:end_to_end_test/values.dart';
import 'package:test/test.dart';

void main() {
  group('toString', () {
    test('omits nulls', () {
      final value = CompoundValue((b) => b..simpleValue.anInt = 1);

      expect(value.toString(), '''CompoundValue {
  simpleValue=SimpleValue {
    anInt=1,
  },
}''');
    });

    test('can be customized', () {
      newBuiltValueToStringHelper =
          (className) => FlatBuiltValueToStringHelper(className);
      final value = CompoundValue((b) => b..simpleValue.anInt = 1);

      expect(value.toString(),
          '''CompoundValue {simpleValue=SimpleValue {anInt=1}}''');
    });
  });
}
