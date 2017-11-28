// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library values;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'values.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  int get anInt;
  BuiltMap<String, int> get map;

  factory SimpleValue([updates(SimpleValueBuilder b)]) = _$SimpleValue;
  SimpleValue._();
}

abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  SimpleValue get simpleValue;
  @nullable
  String get string;

  factory CompoundValue([updates(CompoundValueBuilder b)]) = _$CompoundValue;
  CompoundValue._();
}

abstract class ComparedValue
    implements Built<ComparedValue, ComparedValueBuilder> {
  String get name;

  @BuiltValueField(compare: false)
  Function get onChanged;

  factory ComparedValue([updates(ComparedValueBuilder b)]) = _$ComparedValue;
  ComparedValue._();
}
