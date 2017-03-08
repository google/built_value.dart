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

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TestEnumMixin = Object with _$TestEnumMixin;

/// It's possible to have multiple enums in the same file.
///
/// For this to work, you need to change any generated names that clash. For
/// example, _$values and _$valueOf will always clash. You can change them
/// to anything you like, the code generation wll match what you write.
class SecondTestEnum extends EnumClass {
  static const SecondTestEnum yes = _$ys;
  static const SecondTestEnum no = _$n;
  static const SecondTestEnum definitely = _$definitely;
  @SerializedAs('no-thanks')
  static const SecondTestEnum noThanks = _$noThanks;
  const SecondTestEnum._(String name) : super(name);
  static Serializer<SecondTestEnum> get serializer => _$secondTestEnumSerializer;
  static BuiltSet<SecondTestEnum> get values => _$vls;
  static SecondTestEnum valueOf(String name) => _$vlOf(name);
}
/// Fields can use built_value classes.
abstract class ValueUsingEnum
    implements Built<ValueUsingEnum, ValueUsingEnumBuilder> {
  /// Example of how to make a built_value type serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<ValueUsingEnum> get serializer => _$valueUsingEnumSerializer;


  SecondTestEnum get answer;
  factory ValueUsingEnum([updates(ValueUsingEnumBuilder b)]) = _$ValueUsingEnum;
  ValueUsingEnum._();
}
