// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library enums;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enums.g.dart';

class TestEnum extends EnumClass {
  static Serializer<TestEnum> get serializer => _$testEnumSerializer;

  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}

abstract class TestEnumMixin = Object with _$TestEnumMixin;

class SecondTestEnum extends EnumClass {
  static const SecondTestEnum yes = _$ys;
  static const SecondTestEnum no = _$n;
  static const SecondTestEnum definitely = _$definitely;

  const SecondTestEnum._(String name) : super(name);

  static BuiltSet<SecondTestEnum> get values => _$vls;
  static SecondTestEnum valueOf(String name) => _$vlOf(name);
}

@BuiltValueEnum(wireName: 'E')
class WireNameEnum extends EnumClass {
  static Serializer<WireNameEnum> get serializer => _$wireNameEnumSerializer;

  @BuiltValueEnumConst(wireName: 'y')
  static const WireNameEnum yes = _$wireYes;

  @BuiltValueEnumConst(wireName: 'n')
  static const WireNameEnum no = _$wireNo;

  @BuiltValueEnumConst(wireName: 'd')
  static const WireNameEnum definitely = _$wireDefinitely;

  const WireNameEnum._(String name) : super(name);

  static BuiltSet<WireNameEnum> get values => _$wireValues;
  static WireNameEnum valueOf(String name) => _$wireValueOf(name);
}

// Check escaping for dollar sign in enum values.
class DollarValueEnum extends EnumClass {
  static Serializer<DollarValueEnum> get serializer =>
      _$dollarValueEnumSerializer;

  static const DollarValueEnum value$ = _$value$;

  const DollarValueEnum._(String name) : super(name);

  static BuiltSet<DollarValueEnum> get values => _$dollarValues;
  static DollarValueEnum valueOf(String name) => _$dollarValueOf(name);
}
