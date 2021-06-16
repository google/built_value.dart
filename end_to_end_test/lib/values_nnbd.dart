// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/enums_nnbd.dart' as using_import_as;
import 'package:fixnum/fixnum.dart';

part 'values_nnbd.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  static Serializer<SimpleValue> get serializer => _$simpleValueSerializer;

  int get anInt;

  String? get aString;
  bool? get $mustBeEscaped;

  factory SimpleValue([void Function(SimpleValueBuilder) updates]) =
      _$SimpleValue;
  SimpleValue._();
}

abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  static Serializer<CompoundValue> get serializer => _$compoundValueSerializer;

  SimpleValue get simpleValue;
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
  ValidatedValue? get validatedValue;

  factory CompoundValueComparableBuilders(
          [void Function(CompoundValueComparableBuildersBuilder) updates]) =
      _$CompoundValueComparableBuilders;
  CompoundValueComparableBuilders._();
}

// Class using nesting by default.
abstract class CompoundValueNoNestingField
    implements
        Built<CompoundValueNoNestingField, CompoundValueNoNestingFieldBuilder> {
  static Serializer<CompoundValueNoNestingField> get serializer =>
      _$compoundValueNoNestingFieldSerializer;

  // One field not using nesting.
  @BuiltValueField(nestedBuilder: false)
  SimpleValue get simpleValue;

  // One nullable field not using nesting.
  @BuiltValueField(nestedBuilder: false)
  ValidatedValue? get validatedValue;

  // One field using nesting.
  SimpleValue get simpleValueWithNested;

  // One nullable field using nesting.
  ValidatedValue? get validatedValueWithNested;

  factory CompoundValueNoNestingField(
          [void Function(CompoundValueNoNestingFieldBuilder) updates]) =
      _$CompoundValueNoNestingField;

  CompoundValueNoNestingField._();
}

// Class not using nesting by default.
@BuiltValue(nestedBuilders: false)
abstract class CompoundValueNestingField
    implements
        Built<CompoundValueNestingField, CompoundValueNestingFieldBuilder> {
  static Serializer<CompoundValueNestingField> get serializer =>
      _$compoundValueNestingFieldSerializer;

  // One field not using nesting.
  SimpleValue get simpleValue;

  // One nullable field not using nesting.
  ValidatedValue? get validatedValue;

  // One field using nesting.
  @BuiltValueField(nestedBuilder: true)
  SimpleValue get simpleValueWithNested;

  // One nullable field using nesting.
  @BuiltValueField(nestedBuilder: true)
  ValidatedValue? get validatedValueWithNested;

  factory CompoundValueNestingField(
          [void Function(CompoundValueNestingFieldBuilder) updates]) =
      _$CompoundValueNestingField;

  CompoundValueNestingField._();
}

// Class using auto create builder nesting by default.
abstract class CompoundValueNoAutoNestingField
    implements
        Built<CompoundValueNoAutoNestingField,
            CompoundValueNoAutoNestingFieldBuilder> {
  static Serializer<CompoundValueNoAutoNestingField> get serializer =>
      _$compoundValueNoAutoNestingFieldSerializer;

  // One field not using auto create builder nesting.
  @BuiltValueField(autoCreateNestedBuilder: false)
  NoFieldsValue get value;

  // One field using auto create builder nesting.
  NoFieldsValue get valueWithAutoCreate;

  factory CompoundValueNoAutoNestingField(
          [void Function(CompoundValueNoAutoNestingFieldBuilder) updates]) =
      _$CompoundValueNoAutoNestingField;

  CompoundValueNoAutoNestingField._();
}

// Class not using auto create builder nesting by default.
abstract class CompoundValueAutoNestingField
    implements
        Built<CompoundValueAutoNestingField,
            CompoundValueAutoNestingFieldBuilder> {
  static Serializer<CompoundValueAutoNestingField> get serializer =>
      _$compoundValueAutoNestingFieldSerializer;

  // One field not using auto create builder nesting.
  NoFieldsValue get value;

  // One field using auto create builder nesting.
  @BuiltValueField(autoCreateNestedBuilder: true)
  NoFieldsValue get valueWithAutoCreate;

  factory CompoundValueAutoNestingField(
          [void Function(CompoundValueAutoNestingFieldBuilder) updates]) =
      _$CompoundValueAutoNestingField;

  CompoundValueAutoNestingField._();
}

abstract class CompoundValueExplicitNoNesting
    implements
        Built<CompoundValueExplicitNoNesting,
            CompoundValueExplicitNoNestingBuilder> {
  static Serializer<CompoundValueExplicitNoNesting> get serializer =>
      _$compoundValueExplicitNoNestingSerializer;

  SimpleValue get simpleValue;
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

  @memoized
  int? get nullableDerivedValue {
    ++nullableDerivedGetterCount;

    return null;
  }

  factory DerivedValue([void Function(DerivedValueBuilder) updates]) =
      _$DerivedValue;
  DerivedValue._();
}

int derivedValueGetterCount = 0;

int derivedStringGetterCount = 0;

int nullableDerivedGetterCount = 0;

abstract class ValueWithCode
    implements Built<ValueWithCode, ValueWithCodeBuilder> {
  static final int youCanHaveStaticFields = 3;

  int get anInt;
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
  String? get aString;
  SimpleValue get value;

  factory ValueWithDefaults([void Function(ValueWithDefaultsBuilder) updates]) =
      _$ValueWithDefaults;
  ValueWithDefaults._();
}

abstract class ValueWithDefaultsBuilder
    implements Builder<ValueWithDefaults, ValueWithDefaultsBuilder> {
  int anInt = 7;

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
  using_import_as.TestEnum? get nullableValue;

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

@BuiltValue(defaultCompare: false, defaultSerialize: false)
abstract class DefaultsForFieldSettingsValue
    implements
        Built<DefaultsForFieldSettingsValue,
            DefaultsForFieldSettingsValueBuilder> {
  static Serializer<DefaultsForFieldSettingsValue> get serializer =>
      _$defaultsForFieldSettingsValueSerializer;

  int get ignored;

  @BuiltValueField(compare: true)
  int get compared;

  @BuiltValueField(serialize: true)
  int get serialized;

  factory DefaultsForFieldSettingsValue(
          [void Function(DefaultsForFieldSettingsValueBuilder) updates]) =
      _$DefaultsForFieldSettingsValue;

  DefaultsForFieldSettingsValue._();
}

abstract class ValueWithBuilderInitializer
    implements
        Built<ValueWithBuilderInitializer, ValueWithBuilderInitializerBuilder> {
  static Serializer<ValueWithBuilderInitializer> get serializer =>
      _$valueWithBuilderInitializerSerializer;

  static void _initializeBuilder(ValueWithBuilderInitializerBuilder b) => b
    ..anIntWithDefault = 7
    ..nullableIntWithDefault = 8
    ..nestedValueWithDefault.anInt = 9
    ..nullableNestedValueWithDefault.anInt = 10;

  int get anInt;
  int get anIntWithDefault;
  int? get nullableInt;
  int? get nullableIntWithDefault;

  SimpleValue get nestedValue;
  SimpleValue get nestedValueWithDefault;
  SimpleValue? get nullableNestedValue;
  SimpleValue? get nullableNestedValueWithDefault;

  factory ValueWithBuilderInitializer(
          [void Function(ValueWithBuilderInitializerBuilder) updates]) =
      _$ValueWithBuilderInitializer;
  ValueWithBuilderInitializer._();
}

abstract class ValueWithBuilderFinalizer
    implements
        Built<ValueWithBuilderFinalizer, ValueWithBuilderFinalizerBuilder> {
  static Serializer<ValueWithBuilderFinalizer> get serializer =>
      _$valueWithBuilderFinalizerSerializer;

  /// Build hook forcing [anInt] to be odd.
  static void _finalizeBuilder(ValueWithBuilderFinalizerBuilder b) {
    if (b.anInt!.isEven) b.anInt = b.anInt! + 1;
  }

  int get anInt;

  factory ValueWithBuilderFinalizer(
          [void Function(ValueWithBuilderFinalizerBuilder) updates]) =
      _$ValueWithBuilderFinalizer;
  ValueWithBuilderFinalizer._();
}

abstract class ValueWithGenericBuilderInitializer<T>
    implements
        Built<ValueWithGenericBuilderInitializer<T>,
            ValueWithGenericBuilderInitializerBuilder<T>> {
  static void _initializeBuilder<TT>(
      ValueWithGenericBuilderInitializerBuilder<TT> b) {
    if (TT == int) {
      b.value = 42 as TT;
    }
  }

  T? get value;

  factory ValueWithGenericBuilderInitializer(
      [void Function(ValueWithGenericBuilderInitializerBuilder<T>)
          updates]) = _$ValueWithGenericBuilderInitializer<T>;
  ValueWithGenericBuilderInitializer._();
}

abstract class HashcodeValue
    implements Built<HashcodeValue, HashcodeValueBuilder> {
  int get x;
  int get y;

  HashcodeValue._();
  factory HashcodeValue([void Function(HashcodeValueBuilder) updates]) =
      _$HashcodeValue;
}

abstract class MemoizedHashcodeValue
    implements Built<MemoizedHashcodeValue, MemoizedHashcodeValueBuilder> {
  int get x;
  int get y;

  @override
  @memoized
  int get hashCode;

  MemoizedHashcodeValue._();
  factory MemoizedHashcodeValue(
          [void Function(MemoizedHashcodeValueBuilder) updates]) =
      _$MemoizedHashcodeValue;
}

abstract class _PrivateValue
    implements Built<_PrivateValue, _PrivateValueBuilder> {
  _PrivateValue._();
  factory _PrivateValue(void Function(_PrivateValueBuilder) updates) =
      _$PrivateValue;
}

abstract class SerializesNullsValue
    implements Built<SerializesNullsValue, SerializesNullsValueBuilder> {
  @BuiltValueSerializer(serializeNulls: true)
  static Serializer<SerializesNullsValue> get serializer =>
      _$serializesNullsValueSerializer;

  String? get value;

  factory SerializesNullsValue(
          [void Function(SerializesNullsValueBuilder) updates]) =
      _$SerializesNullsValue;
  SerializesNullsValue._();
}

abstract class NullableObjectValue
    implements Built<NullableObjectValue, NullableObjectValueBuilder> {
  static Serializer<NullableObjectValue> get serializer =>
      _$nullableObjectValueSerializer;

  Object? get value;

  factory NullableObjectValue(
          [void Function(NullableObjectValueBuilder) updates]) =
      _$NullableObjectValue;
  NullableObjectValue._();
}

abstract class ValueWithHooks
    implements Built<ValueWithHooks, ValueWithHooksBuilder> {
  static Serializer<ValueWithHooks> get serializer =>
      _$valueWithHooksSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void hook1(ValueWithHooksBuilder b) {
    b.hook1Count = (b.hook1Count ?? 0) + 1;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void hook2(ValueWithHooksBuilder b) {
    b.hook2Count = (b.hook2Count ?? 0) + 1;
  }

  @BuiltValueHook(initializeBuilder: true)
  static void justInitialize(ValueWithHooksBuilder b) {
    b.hookOrdering.add('justInitialize');
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void justFinalize(ValueWithHooksBuilder b) {
    b.hookOrdering.add('justFinalize');
  }

  @BuiltValueHook(finalizeBuilder: true, initializeBuilder: true)
  static void both(ValueWithHooksBuilder b) {
    b.hookOrdering.add('both');
  }

  @BuiltValueHook(initializeBuilder: true)
  static void moreJustInitialize(ValueWithHooksBuilder b) {
    b.hookOrdering.add('moreJustInitialize');
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void moreJustFinalize(ValueWithHooksBuilder b) {
    b.hookOrdering.add('moreJustFinalize');
  }

  @BuiltValueHook(finalizeBuilder: true, initializeBuilder: true)
  static void moreBoth(ValueWithHooksBuilder b) {
    b.hookOrdering.add('moreBoth');
  }

  int get hook1Count;
  int get hook2Count;
  BuiltList<String> get hookOrdering;

  factory ValueWithHooks([void Function(ValueWithHooksBuilder) updates]) =
      _$ValueWithHooks;
  ValueWithHooks._();
}
