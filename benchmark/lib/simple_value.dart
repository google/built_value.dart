// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library simple_value;

import 'package:built_value/built_value.dart';

part 'simple_value.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  int get anInt;

  String get aString;

  SimpleValue._();
  factory SimpleValue([updates(SimpleValueBuilder b)]) = _$SimpleValue;
}
