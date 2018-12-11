// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library values;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/enums.dart' as using_import_as;
import 'package:fixnum/fixnum.dart';

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

@BuiltValue(nestedBuilders: false)
abstract class CompoundValueNoNesting
    implements Built<CompoundValueNoNesting, CompoundValueNoNestingBuilder> {
  static Serializer<CompoundValueNoNesting> get serializer =>
      _$compoundValueNoNestingSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue get validatedValue;

  factory CompoundValueNoNesting([updates(CompoundValueNoNestingBuilder b)]) =
      _$CompoundValueNoNesting;
  CompoundValueNoNesting._();
}

abstract class CompoundValueExplicitNoNesting
    implements
        Built<CompoundValueExplicitNoNesting,
            CompoundValueExplicitNoNestingBuilder> {
  static Serializer<CompoundValueExplicitNoNesting> get serializer =>
      _$compoundValueExplicitNoNestingSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue get validatedValue;

  factory CompoundValueExplicitNoNesting(
          [updates(CompoundValueExplicitNoNestingBuilder b)]) =
      _$CompoundValueExplicitNoNesting;
  CompoundValueExplicitNoNesting._();
}

abstract class CompoundValueExplicitNoNestingBuilder
    implements
        Builder<CompoundValueExplicitNoNesting,
            CompoundValueExplicitNoNestingBuilder> {
  // One field using nesting.
  SimpleValueBuilder simpleValue;
  // One field not using nesting.
  ValidatedValue validatedValue;

  factory CompoundValueExplicitNoNestingBuilder() =
      _$CompoundValueExplicitNoNestingBuilder;
  CompoundValueExplicitNoNestingBuilder._();
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
  Int64 get int64;
  double get dbl;
  num get number;
  String get string;
  DateTime get dateTime;
  Duration get duration;
  Uri get uri;
  BigInt get bigInt;

  factory PrimitivesValue([updates(PrimitivesValueBuilder b)]) =
      _$PrimitivesValue;

  PrimitivesValue._();
}

typedef MyFunctionType = int Function(String);

abstract class FunctionValue
    implements Built<FunctionValue, FunctionValueBuilder> {
  MyFunctionType get function;

  factory FunctionValue([updates(FunctionValueBuilder b)]) = _$FunctionValue;

  FunctionValue._();
}

abstract class ListOfFunctionValue
    implements Built<ListOfFunctionValue, ListOfFunctionValueBuilder> {
  BuiltList<MyFunctionType> get functions;

  factory ListOfFunctionValue([updates(ListOfFunctionValueBuilder b)]) =
      _$ListOfFunctionValue;

  ListOfFunctionValue._();
}

abstract class PartiallySerializableValue
    implements
        Built<PartiallySerializableValue, PartiallySerializableValueBuilder> {
  static Serializer<PartiallySerializableValue> get serializer =>
      _$partiallySerializableValueSerializer;

  int get value;

  @nullable
  @BuiltValueField(serialize: false)
  int get transientValue;

  factory PartiallySerializableValue(
          [updates(PartiallySerializableValueBuilder b)]) =
      _$PartiallySerializableValue;

  PartiallySerializableValue._();
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

@BuiltValue(wireName: r'$V')
abstract class WireNameValue
    implements Built<WireNameValue, WireNameValueBuilder> {
  static Serializer<WireNameValue> get serializer => _$wireNameValueSerializer;

  @BuiltValueField(wireName: r'$v')
  int get value;

  factory WireNameValue([updates(WireNameValueBuilder b)]) = _$WireNameValue;

  WireNameValue._();
}

// Check discovery of serializable types via fields.
abstract class FieldDiscoveryValue
    implements Built<FieldDiscoveryValue, FieldDiscoveryValueBuilder> {
  static Serializer<FieldDiscoveryValue> get serializer =>
      _$fieldDiscoveryValueSerializer;

  DiscoverableValue get value;
  BuiltList<ThirdDiscoverableValue> get values;

  // Check that discovery doesn't recurse forever on reference to self.
  @nullable
  FieldDiscoveryValue get recursiveValue;

  factory FieldDiscoveryValue([updates(FieldDiscoveryValueBuilder b)]) =
      _$FieldDiscoveryValue;
  FieldDiscoveryValue._();
}

// Discovered indirectly via FieldDiscoveryValue.
abstract class DiscoverableValue
    implements Built<DiscoverableValue, DiscoverableValueBuilder> {
  static Serializer<DiscoverableValue> get serializer =>
      _$discoverableValueSerializer;

  SecondDiscoverableValue get value;

  factory DiscoverableValue([updates(DiscoverableValueBuilder b)]) =
      _$DiscoverableValue;
  DiscoverableValue._();
}

// Discovered indirectly via DiscoverableValue.
abstract class SecondDiscoverableValue
    implements Built<SecondDiscoverableValue, SecondDiscoverableValueBuilder> {
  static Serializer<SecondDiscoverableValue> get serializer =>
      _$secondDiscoverableValueSerializer;

  int get value;

  factory SecondDiscoverableValue([updates(SecondDiscoverableValueBuilder b)]) =
      _$SecondDiscoverableValue;
  SecondDiscoverableValue._();
}

// Discovered indirectly via FieldDiscoveryValue.
abstract class ThirdDiscoverableValue
    implements Built<ThirdDiscoverableValue, ThirdDiscoverableValueBuilder> {
  static Serializer<ThirdDiscoverableValue> get serializer =>
      _$thirdDiscoverableValueSerializer;

  int get value;

  factory ThirdDiscoverableValue([updates(ThirdDiscoverableValueBuilder b)]) =
      _$ThirdDiscoverableValue;
  ThirdDiscoverableValue._();
}

// Check that discovery doesn't recurse forever when there is a loop in field
// types.
abstract class RecursiveValueA
    implements Built<RecursiveValueA, RecursiveValueABuilder> {
  static Serializer<RecursiveValueA> get serializer =>
      _$recursiveValueASerializer;

  RecursiveValueB get value;

  factory RecursiveValueA([updates(RecursiveValueABuilder b)]) =
      _$RecursiveValueA;
  RecursiveValueA._();
}

abstract class RecursiveValueB
    implements Built<RecursiveValueB, RecursiveValueBBuilder> {
  static Serializer<RecursiveValueB> get serializer =>
      _$recursiveValueBSerializer;

  RecursiveValueA get value;

  factory RecursiveValueB([updates(RecursiveValueBBuilder b)]) =
      _$RecursiveValueB;
  RecursiveValueB._();
}
