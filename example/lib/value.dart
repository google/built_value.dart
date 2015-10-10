// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library value;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'value.g.dart';

/// Example of how to use built_value.
///
/// The value class must implement [Built]. It must be abstract, and have
/// fields declared as abstract getters. Finally, it must have a particular
/// constructor and factory, as shown here.
abstract class Value implements Built<Value, ValueBuilder> {
  static final int youCanHaveStaticFields = 3;

  int get anInt;
  String get aString;
  @nullable Object get anObject;
  int get aDefaultInt;
  BuiltList<int> get listOfInt;

  int get youCanWriteDerivedGetters => anInt + aDefaultInt;

  Value._();
  factory Value([updates(ValueBuilder b)]) = _$Value;
}

/// The builder class must implement [Builder]. It must be abstract, and have
/// fields declared as normal public fields. Finally, it must have a particular
/// constructor and factory, as shown here.
///
/// Defaults can be specified by assigning them to fields here.
///
/// Validation can be done by overriding the [build] method.
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  int anInt;
  String aString;
  @nullable Object anObject;
  int aDefaultInt = 7;
  ListBuilder<int> listOfInt = new ListBuilder<int>();

  ValueBuilder._();
  factory ValueBuilder() = _$ValueBuilder;

  set youCanWriteExtraSetters(int value) {
    anInt = value;
    aDefaultInt = value;
  }
}
