// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library value_test;

import 'package:test/test.dart';
import 'package:built_value/built_value.dart';

part 'private_value_test.g.dart';

// This has to go here so we can access it in the test.
abstract class _PrivateValue
    implements Built<_PrivateValue, _PrivateValueBuilder> {
  int get value;

  factory _PrivateValue([updates(_PrivateValueBuilder b)]) = _$PrivateValue;

  _PrivateValue._();
}

void main() {
  group('PrivateValue', () {
    test('can be instantiated', () {
      new _PrivateValue((b) => b..value = 0);
    });
  });
}
