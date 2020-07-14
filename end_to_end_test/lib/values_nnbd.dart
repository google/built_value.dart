// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/enums_nnbd.dart' as using_import_as;
import 'package:fixnum/fixnum.dart';

part 'values_nnbd.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  static Serializer<SimpleValue> get serializer => _$simpleValueSerializer;

  int get anInt;

  // Only fields marked @nullable can hold null.
  @nullable
  String? get aString;

  @nullable
  bool? get $mustBeEscaped;

  factory SimpleValue([void Function(SimpleValueBuilder) updates]) =
      _$SimpleValue;
  SimpleValue._();
}

abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  static Serializer<CompoundValue> get serializer => _$compoundValueSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue? get validatedValue;

  factory CompoundValue([void Function(CompoundValueBuilder) updates]) =
      _$CompoundValue;
  CompoundValue._();
}

@BuiltValue(nestedBuilders: false)
abstract class CompoundValueNoNesting
    implements Built<CompoundValueNoNesting, CompoundValueNoNestingBuilder> {
  static Serializer<CompoundValueNoNesting> get serializer =>
      _$compoundValueNoNestingSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue? get validatedValue;

  factory CompoundValueNoNesting(
          [void Function(CompoundValueNoNestingBuilder) updates]) =
      _$CompoundValueNoNesting;
  CompoundValueNoNesting._();
}

@BuiltValue(autoCreateNestedBuilders: false)
abstract class CompoundValueNoAutoNesting
    implements
        Built<CompoundValueNoAutoNesting, CompoundValueNoAutoNestingBuilder> {
  static Serializer<CompoundValueNoAutoNesting> get serializer =>
      _$compoundValueNoAutoNestingSerializer;

  NoFieldsValue get value;

  factory CompoundValueNoAutoNesting(
          [void Function(CompoundValueNoAutoNestingBuilder) updates]) =
      _$CompoundValueNoAutoNesting;
  CompoundValueNoAutoNesting._();
}

@BuiltValue(nestedBuilders: false, comparableBuilders: true)
abstract class CompoundValueComparableBuilders
    implements
        Built<CompoundValueComparableBuilders,
            CompoundValueComparableBuildersBuilder> {
  static Serializer<CompoundValueComparableBuilders> get serializer =>
      _$compoundValueComparableBuildersSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue? get validatedValue;

  factory CompoundValueComparableBuilders(
          [void Function(CompoundValueComparableBuildersBuilder) updates]) =
      _$CompoundValueComparableBuilders;
  CompoundValueComparableBuilders._();
}

abstract class CompoundValueExplicitNoNesting
    implements
        Built<CompoundValueExplicitNoNesting,
            CompoundValueExplicitNoNestingBuilder> {
  static Serializer<CompoundValueExplicitNoNesting> get serializer =>
      _$compoundValueExplicitNoNestingSerializer;

  SimpleValue get simpleValue;
  @nullable
  ValidatedValue? get validatedValue;

  factory CompoundValueExplicitNoNesting(
          [void Function(CompoundValueExplicitNoNestingBuilder) updates]) =
      _$CompoundValueExplicitNoNesting;
  CompoundValueExplicitNoNesting._();
}

abstract class CompoundValueExplicitNoNestingBuilder
    implements
        Builder<CompoundValueExplicitNoNesting,
            CompoundValueExplicitNoNestingBuilder> {
  // One field using nesting.
  SimpleValueBuilder simpleValue = SimpleValueBuilder();
  // One field not using nesting.
  ValidatedValue? validatedValue;

  factory CompoundValueExplicitNoNestingBuilder() =
      _$CompoundValueExplicitNoNestingBuilder;
  CompoundValueExplicitNoNestingBuilder._();
}

// Check that nested collections work with a manually declared builder.
abstract class ExplicitNestedList
    implements Built<ExplicitNestedList, ExplicitNestedListBuilder> {
  BuiltList<BuiltList<int>> get nestedList;

  factory ExplicitNestedList(
          [void Function(ExplicitNestedListBuilder) updates]) =
      _$ExplicitNestedList;
  ExplicitNestedList._();
}

abstract class ExplicitNestedListBuilder
    implements Builder<ExplicitNestedList, ExplicitNestedListBuilder> {
  ListBuilder<BuiltList<int>> nestedList = ListBuilder();

  factory ExplicitNestedListBuilder() = _$ExplicitNestedListBuilder;
  ExplicitNestedListBuilder._();
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

  factory DerivedValue([void Function(DerivedValueBuilder) updates]) =
      _$DerivedValue;
  DerivedValue._();
}

int derivedValueGetterCount = 0;

int derivedStringGetterCount = 0;

abstract class ValueWithCode
    implements Built<ValueWithCode, ValueWithCodeBuilder> {
  static final int youCanHaveStaticFields = 3;

  int get anInt;
  @nullable
  String? get aString;

  String get youCanWriteDerivedGetters => anInt.toString() + aString!;

  factory ValueWithCode([void Function(ValueWithCodeBuilder) updates]) =
      _$ValueWithCode;
  ValueWithCode._();

  factory ValueWithCode.fromCustomFactory(int anInt) => ValueWithCode((b) => b
    ..anInt = anInt
    ..aString = 'two');
}

abstract class ValueWithDefaults
    implements Built<ValueWithDefaults, ValueWithDefaultsBuilder> {
  int get anInt;
  @nullable
  String? get aString;
  SimpleValue get value;

  factory ValueWithDefaults([void Function(ValueWithDefaultsBuilder) updates]) =
      _$ValueWithDefaults;
  ValueWithDefaults._();
}

abstract class ValueWithDefaultsBuilder
    implements Builder<ValueWithDefaults, ValueWithDefaultsBuilder> {
  int anInt = 7;

  @nullable
  String? aString;
  SimpleValueBuilder value = SimpleValue((b) => b..anInt = 3).toBuilder();

  factory ValueWithDefaultsBuilder() = _$ValueWithDefaultsBuilder;
  ValueWithDefaultsBuilder._();
}

abstract class ValueWithBuilderSmarts
    implements Built<ValueWithBuilderSmarts, ValueWithBuilderSmartsBuilder> {
  String get value;

  factory ValueWithBuilderSmarts(
          [void Function(ValueWithBuilderSmartsBuilder) updates]) =
      _$ValueWithBuilderSmarts;
  ValueWithBuilderSmarts._();
}

abstract class ValueWithBuilderSmartsBuilder
    implements Builder<ValueWithBuilderSmarts, ValueWithBuilderSmartsBuilder> {
  String? _value;
  String get value => _value!;
  set value(String v) {
    if (v == 'not allowed') throw ArgumentError('not allowed');
    _value = v;
  }

  factory ValueWithBuilderSmartsBuilder() = _$ValueWithBuilderSmartsBuilder;
  ValueWithBuilderSmartsBuilder._();
}

abstract class ValidatedValue
    implements Built<ValidatedValue, ValidatedValueBuilder> {
  static Serializer<ValidatedValue> get serializer =>
      _$validatedValueSerializer;

  int get anInt;

  @nullable
  String? get aString;

  factory ValidatedValue([void Function(ValidatedValueBuilder) updates]) =
      _$ValidatedValue;

  ValidatedValue._() {
    if (anInt == 7) throw StateError('anInt may not be 7');
  }
}

abstract class ValueUsingImportAs
    implements Built<ValueUsingImportAs, ValueUsingImportAsBuilder> {
  static Serializer<ValueUsingImportAs> get serializer =>
      _$valueUsingImportAsSerializer;

  using_import_as.TestEnum get value;

  factory ValueUsingImportAs(
          [void Function(ValueUsingImportAsBuilder) updates]) =
      _$ValueUsingImportAs;

  ValueUsingImportAs._();
}

abstract class NoFieldsValue
    implements Built<NoFieldsValue, NoFieldsValueBuilder> {
  static Serializer<NoFieldsValue> get serializer => _$noFieldsValueSerializer;

  factory NoFieldsValue([void Function(NoFieldsValueBuilder) updates]) =
      _$NoFieldsValue;

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
  RegExp get regExp;
  Uri get uri;
  BigInt get bigInt;

  factory PrimitivesValue([void Function(PrimitivesValueBuilder) updates]) =
      _$PrimitivesValue;

  PrimitivesValue._();
}

typedef MyFunctionType = int Function(String);

abstract class FunctionValue
    implements Built<FunctionValue, FunctionValueBuilder> {
  MyFunctionType get function;

  factory FunctionValue([void Function(FunctionValueBuilder) updates]) =
      _$FunctionValue;

  FunctionValue._();
}

abstract class ListOfFunctionValue
    implements Built<ListOfFunctionValue, ListOfFunctionValueBuilder> {
  BuiltList<MyFunctionType> get functions;

  factory ListOfFunctionValue(
          [void Function(ListOfFunctionValueBuilder) updates]) =
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
  int? get transientValue;

  factory PartiallySerializableValue(
          [void Function(PartiallySerializableValueBuilder) updates]) =
      _$PartiallySerializableValue;

  PartiallySerializableValue._();
}

abstract class NamedFactoryValue
    implements Built<NamedFactoryValue, NamedFactoryValueBuilder> {
  static Serializer<NamedFactoryValue> get serializer =>
      _$namedFactoryValueSerializer;

  int get value;

  factory NamedFactoryValue(int value) => _$NamedFactoryValue._(value: value);

  NamedFactoryValue._();
}

@BuiltValue(wireName: r'$V')
abstract class WireNameValue
    implements Built<WireNameValue, WireNameValueBuilder> {
  static Serializer<WireNameValue> get serializer => _$wireNameValueSerializer;

  @BuiltValueField(wireName: r'$v')
  int get value;

  factory WireNameValue([void Function(WireNameValueBuilder) updates]) =
      _$WireNameValue;

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
  FieldDiscoveryValue? get recursiveValue;

  factory FieldDiscoveryValue(
          [void Function(FieldDiscoveryValueBuilder) updates]) =
      _$FieldDiscoveryValue;
  FieldDiscoveryValue._();
}

// Discovered indirectly via FieldDiscoveryValue.
abstract class DiscoverableValue
    implements Built<DiscoverableValue, DiscoverableValueBuilder> {
  static Serializer<DiscoverableValue> get serializer =>
      _$discoverableValueSerializer;

  SecondDiscoverableValue get value;

  factory DiscoverableValue([void Function(DiscoverableValueBuilder) updates]) =
      _$DiscoverableValue;
  DiscoverableValue._();
}

// Discovered indirectly via DiscoverableValue.
abstract class SecondDiscoverableValue
    implements Built<SecondDiscoverableValue, SecondDiscoverableValueBuilder> {
  static Serializer<SecondDiscoverableValue> get serializer =>
      _$secondDiscoverableValueSerializer;

  int get value;

  factory SecondDiscoverableValue(
          [void Function(SecondDiscoverableValueBuilder) updates]) =
      _$SecondDiscoverableValue;
  SecondDiscoverableValue._();
}

// Discovered indirectly via FieldDiscoveryValue.
abstract class ThirdDiscoverableValue
    implements Built<ThirdDiscoverableValue, ThirdDiscoverableValueBuilder> {
  static Serializer<ThirdDiscoverableValue> get serializer =>
      _$thirdDiscoverableValueSerializer;

  int get value;

  factory ThirdDiscoverableValue(
          [void Function(ThirdDiscoverableValueBuilder) updates]) =
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

  factory RecursiveValueA([void Function(RecursiveValueABuilder) updates]) =
      _$RecursiveValueA;
  RecursiveValueA._();
}

abstract class RecursiveValueB
    implements Built<RecursiveValueB, RecursiveValueBBuilder> {
  static Serializer<RecursiveValueB> get serializer =>
      _$recursiveValueBSerializer;

  RecursiveValueA get value;

  factory RecursiveValueB([void Function(RecursiveValueBBuilder) updates]) =
      _$RecursiveValueB;
  RecursiveValueB._();
}

abstract class ValueWithCustomSerializer
    implements
        Built<ValueWithCustomSerializer, ValueWithCustomSerializerBuilder> {
  @BuiltValueSerializer(custom: true)
  static Serializer<ValueWithCustomSerializer> get serializer =>
      const ValueWithCustomSerializerSerializer();

  int get value;

  factory ValueWithCustomSerializer(
          [void Function(ValueWithCustomSerializerBuilder) updates]) =
      _$ValueWithCustomSerializer;
  ValueWithCustomSerializer._();
}

class ValueWithCustomSerializerSerializer
    implements PrimitiveSerializer<ValueWithCustomSerializer> {
  @override
  Iterable<Type> get types =>
      [ValueWithCustomSerializer, _$ValueWithCustomSerializer];

  const ValueWithCustomSerializerSerializer();

  @override
  String get wireName => 'ValueWithCustomSerializer';

  @override
  ValueWithCustomSerializer deserialize(
      Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return ValueWithCustomSerializer((b) => b.value = serialized as int);
  }

  @override
  Object serialize(Serializers serializers, ValueWithCustomSerializer object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.value;
  }
}

@BuiltValue(generateBuilderOnSetField: true)
abstract class ValueWithOnSet
    implements Built<ValueWithOnSet, ValueWithOnSetBuilder> {
  int get value;

  factory ValueWithOnSet([void Function(ValueWithOnSetBuilder) updates]) =
      _$ValueWithOnSet;
  ValueWithOnSet._();
}

// Check that `toString` from a mixin is not redefined.
abstract class CustomToStringValue extends Object
    with CustomToString
    implements Built<CustomToStringValue, CustomToStringValueBuilder> {
  factory CustomToStringValue(
          [void Function(CustomToStringValueBuilder) updates]) =
      _$CustomToStringValue;
  CustomToStringValue._();
}

mixin CustomToString {
  @override
  String toString() => 'custom';
}

// Check that a field can be called `other`.
abstract class OtherValue implements Built<OtherValue, OtherValueBuilder> {
  static Serializer<OtherValue> get serializer => _$otherValueSerializer;

  int get other;

  factory OtherValue([void Function(OtherValueBuilder) updates]) = _$OtherValue;
  OtherValue._();
}
