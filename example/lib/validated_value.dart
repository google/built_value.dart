// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library validated_value;

import 'package:built_value/built_value.dart';

part 'validated_value.g.dart';

/// Example of how to use built_value.
///
/// Validation can be done in the constructor.
abstract class ValidatedValue
    implements Built<ValidatedValue, ValidatedValueBuilder> {
  int get anInt;
  @nullable
  String get aString;

  ValidatedValue._() {
    if (anInt == 7) throw 'anInt may not be 7';
  }

  factory ValidatedValue([updates(ValidatedValueBuilder b)]) = _$ValidatedValue;
}
