// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'values.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  int get anInt;
  BuiltList<String> get list;
  BuiltListMultimap<int, bool> get multimap;
  BuiltMap<String, int> get map;
  BuiltSet<int> get aSet;
  BuiltSetMultimap<int, bool> get setMultimap;

  factory SimpleValue([Function(SimpleValueBuilder) updates]) = _$SimpleValue;
  SimpleValue._();
}

abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  SimpleValue get simpleValue;
  String? get string;

  factory CompoundValue([Function(CompoundValueBuilder) updates]) =
      _$CompoundValue;
  CompoundValue._();
}

abstract class ComparedValue
    implements Built<ComparedValue, ComparedValueBuilder> {
  String get name;

  @BuiltValueField(compare: false)
  Function get onChanged;

  factory ComparedValue([Function(ComparedValueBuilder) updates]) =
      _$ComparedValue;
  ComparedValue._();
}
