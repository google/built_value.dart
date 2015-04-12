// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library compound_value;

import 'package:built_value/built_value.dart';

import 'value.dart';

part 'compound_value.g.dart';

/// Example of how to use built_value.
///
/// The value class must implement [Built]. It must be abstract, and have
/// fields declared as abstract getters. Finally, it must have a particular
/// constructor and factory, as shown here.
abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  Value get value;

  CompoundValue._();
  factory CompoundValue([updates(CompoundValueBuilder b)]) = _$CompoundValue;
}

/// The builder class must implement [Builder]. It must be abstract, and have
/// fields declared as normal public fields. Finally, it must have a particular
/// constructor and factory, as shown here.
///
/// Defaults can be specified by assigning them to fields here.
///
/// Validation can be done by overriding the [build] method.
abstract class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  ValueBuilder value = new ValueBuilder()
    ..anInt = 0
    ..aString = '1';

  CompoundValueBuilder._();
  factory CompoundValueBuilder() = _$CompoundValueBuilder;
}
