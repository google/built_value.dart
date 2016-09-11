// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library value_with_code;

import 'package:built_value/built_value.dart';

part 'value_with_code.g.dart';

/// Example of how to use built_value.
///
/// You can add static fields and methods, implement interfaces, add additonal
/// factory constructor, and generally use the class as a normal class.
abstract class ValueWithCode
    implements Built<ValueWithCode, ValueWithCodeBuilder> {
  static final int youCanHaveStaticFields = 3;

  int get anInt;
  @nullable
  String get aString;

  String get youCanWriteDerivedGetters => anInt.toString() + aString;

  ValueWithCode._();

  factory ValueWithCode([updates(ValueWithCodeBuilder b)]) = _$ValueWithCode;

  factory ValueWithCode.fromCustomFactory(int anInt) =>
      new ValueWithCode((b) => b
        ..anInt = anInt
        ..aString = 'two');
}
