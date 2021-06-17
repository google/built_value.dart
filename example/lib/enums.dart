// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library enums;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enums.g.dart';

/// Example of how to use [EnumClass].
///
/// Enum constants must be declared as `static const`. Initialize them from
/// the generated code. You can use any initializer starting _$ and the
/// generated code will match it. For example, you could initialize "yes" to
/// "_$yes", "_$y" or even "_$abc".
///
/// You need to write three pieces of boilerplate to hook up the generated
/// code: a constructor called `_`, a `values` method, and a `valueOf` method.
class TestEnum extends EnumClass {
  /// Example of how to make an [EnumClass] serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<TestEnum> get serializer => _$testEnumSerializer;

  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}

/// It's possible to have multiple enums in the same file.
///
/// For this to work, you need to change any generated names that clash. For
/// example, _$values and _$valueOf will always clash. You can change them
/// to anything you like, the code generation will match what you write.
class SecondTestEnum extends EnumClass {
  static const SecondTestEnum yes = _$ys;
  static const SecondTestEnum no = _$n;
  static const SecondTestEnum definitely = _$definitely;

  const SecondTestEnum._(String name) : super(name);

  static BuiltSet<SecondTestEnum> get values => _$vls;
  static SecondTestEnum valueOf(String name) => _$vlOf(name);
}

/// If you need to change the values sent over the wire when serializing you
/// can do so using the [BuiltValueEnum] and [BuiltValueEnumConst] annotations.
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
