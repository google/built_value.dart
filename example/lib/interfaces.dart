// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library interfaces;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'interfaces.g.dart';

/// Example "serializable" interface.
///
/// In fact it is the implementations of the interface that must be
/// serializable. See examples below.
abstract class HasInt {
  int get anInt;
}

/// Example [HasInt] implementation that is not serializable.
///
/// To be serializable it must use built_value or enum_class.
abstract class WrongHasInt implements HasInt {
  @override
  int anInt = 4;
}

/// Example [HasInt] that is serializable because it uses built_value.
abstract class ValueWithInt
    implements Built<ValueWithInt, ValueWithIntBuilder>, HasInt {
  /// Serializer field makes the built_value serializable.
  static final Serializer<ValueWithInt> serializer = _$valueWithIntSerializer;
  static final int youCanHaveStaticFields = 3;

  @override
  int get anInt;

  String get note;

  factory ValueWithInt([updates(ValueWithIntBuilder b)]) = _$ValueWithInt;
  ValueWithInt._();
}

/// Builder class for [ValueWithInt].
abstract class ValueWithIntBuilder
    implements Builder<ValueWithInt, ValueWithIntBuilder> {
  @virtual
  int anInt;
  @virtual
  String note;

  factory ValueWithIntBuilder() = _$ValueWithIntBuilder;
  ValueWithIntBuilder._();
}

/// Example [HasInt] that is serializable because it uses enum_class.
class EnumWithInt extends EnumClass implements HasInt {
  /// Serializer field makes the enum_class serializable.
  static final Serializer<EnumWithInt> serializer = _$enumWithIntSerializer;

  static const EnumWithInt one = _$one;
  static const EnumWithInt two = _$two;
  static const EnumWithInt three = _$three;

  const EnumWithInt._(String name) : super(name);

  static BuiltSet<EnumWithInt> get values => _$values;

  static EnumWithInt valueOf(String name) => _$valueOf(name);

  @override
  int get anInt {
    switch (this) {
      case one:
        return 1;
      case two:
        return 2;
      case three:
        return 3;
      default:
        throw new StateError(this.toString());
    }
  }
}
