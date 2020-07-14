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
