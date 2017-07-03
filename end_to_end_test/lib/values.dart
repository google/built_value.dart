// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library values;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/enums.dart' as using_import_as;

part 'values.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  static Serializer<SimpleValue> get serializer => _$simpleValueSerializer;

  int get anInt;

  // Only fields marked @nullable can hold null.
  @nullable
  String get aString;

  factory SimpleValue([updates(SimpleValueBuilder b)]) = _$SimpleValue;
  SimpleValue._();
}

abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  static Serializer<CompoundValue> get serializer => _$compoundValueSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue get validatedValue;

  factory CompoundValue([updates(CompoundValueBuilder b)]) = _$CompoundValue;
  CompoundValue._();
}

abstract class DerivedValue
    implements Built<DerivedValue, DerivedValueBuilder> {
  int get anInt;

  @memoized
  int get derivedValue {
    ++derivedValueGetterCount;

    return anInt + 10;
  }

  @memoized
  Iterable<String> get derivedString {
    ++derivedStringGetterCount;

    return [toString()];
  }

  factory DerivedValue([updates(DerivedValueBuilder b)]) = _$DerivedValue;
  DerivedValue._();
}

int derivedValueGetterCount = 0;

int derivedStringGetterCount = 0;

abstract class ValueWithCode
    implements Built<ValueWithCode, ValueWithCodeBuilder> {
  static final int youCanHaveStaticFields = 3;

  int get anInt;
  @nullable
  String get aString;

  String get youCanWriteDerivedGetters => anInt.toString() + aString;

  factory ValueWithCode([updates(ValueWithCodeBuilder b)]) = _$ValueWithCode;
  ValueWithCode._();

  factory ValueWithCode.fromCustomFactory(int anInt) =>
      new ValueWithCode((b) => b
        ..anInt = anInt
        ..aString = 'two');
}

abstract class ValueWithDefaults
    implements Built<ValueWithDefaults, ValueWithDefaultsBuilder> {
  int get anInt;
  @nullable
  String get aString;
  SimpleValue get value;

  factory ValueWithDefaults([updates(ValueWithDefaultsBuilder b)]) =
      _$ValueWithDefaults;
  ValueWithDefaults._();
}

abstract class ValueWithDefaultsBuilder
    implements Builder<ValueWithDefaults, ValueWithDefaultsBuilder> {
  int anInt = 7;

  @nullable
  String aString;
  SimpleValueBuilder value = new SimpleValue((b) => b..anInt = 3).toBuilder();

  factory ValueWithDefaultsBuilder() = _$ValueWithDefaultsBuilder;
  ValueWithDefaultsBuilder._();
}

abstract class ValidatedValue
    implements Built<ValidatedValue, ValidatedValueBuilder> {
  static Serializer<ValidatedValue> get serializer =>
      _$validatedValueSerializer;

  int get anInt;
  @nullable
  String get aString;

  factory ValidatedValue([updates(ValidatedValueBuilder b)]) = _$ValidatedValue;

  ValidatedValue._() {
    if (anInt == 7) throw new StateError('anInt may not be 7');
  }
}

abstract class ValueUsingImportAs
    implements Built<ValueUsingImportAs, ValueUsingImportAsBuilder> {
  static Serializer<ValueUsingImportAs> get serializer =>
      _$valueUsingImportAsSerializer;

  using_import_as.TestEnum get value;

  factory ValueUsingImportAs([updates(ValueUsingImportAsBuilder b)]) =
      _$ValueUsingImportAs;

  ValueUsingImportAs._();
}

abstract class NoFieldsValue
    implements Built<NoFieldsValue, NoFieldsValueBuilder> {
  static Serializer<NoFieldsValue> get serializer => _$noFieldsValueSerializer;

  factory NoFieldsValue([updates(NoFieldsValueBuilder b)]) = _$NoFieldsValue;

  NoFieldsValue._();
}

abstract class PrimitivesValue
    implements Built<PrimitivesValue, PrimitivesValueBuilder> {
  static Serializer<PrimitivesValue> get serializer =>
      _$primitivesValueSerializer;

  bool get boolean;
  int get integer;
  double get dbl;
  num get number;
  String get string;
  DateTime get dateTime;

  factory PrimitivesValue([updates(PrimitivesValueBuilder b)]) =
      _$PrimitivesValue;

  PrimitivesValue._();
}

abstract class NamedFactoryValue
    implements Built<NamedFactoryValue, NamedFactoryValueBuilder> {
  static Serializer<NamedFactoryValue> get serializer =>
      _$namedFactoryValueSerializer;

  int get value;

  factory NamedFactoryValue(int value) =>
      new _$NamedFactoryValue._(value: value);

  NamedFactoryValue._();
}
