// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.8

library interfaces;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interfaces.g.dart';

abstract class HasInt {
  int get anInt;
}

abstract class ValueWithInt
    implements Built<ValueWithInt, ValueWithIntBuilder>, HasInt {
  static Serializer<ValueWithInt> get serializer => _$valueWithIntSerializer;
  static final int youCanHaveStaticFields = 3;

  @override
  int get anInt;

  String get note;

  factory ValueWithInt([void Function(ValueWithIntBuilder) updates]) =
      _$ValueWithInt;
  ValueWithInt._();
}

class EnumWithInt extends EnumClass implements HasInt {
  /// Serializer field makes the enum_class serializable.
  static Serializer<EnumWithInt> get serializer => _$enumWithIntSerializer;

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
        throw StateError(toString());
    }
  }
}

abstract class ValueWithHasInt
    implements Built<ValueWithHasInt, ValueWithHasIntBuilder> {
  static Serializer<ValueWithHasInt> get serializer =>
      _$valueWithHasIntSerializer;

  factory ValueWithHasInt([void Function(ValueWithHasIntBuilder) updates]) =
      _$ValueWithHasInt;
  ValueWithHasInt._();

  HasInt get hasInt;
}
