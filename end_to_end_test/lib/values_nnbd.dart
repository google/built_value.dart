// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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

abstract class NoFieldsValue
    implements Built<NoFieldsValue, NoFieldsValueBuilder> {
  static Serializer<NoFieldsValue> get serializer => _$noFieldsValueSerializer;

  factory NoFieldsValue([void Function(NoFieldsValueBuilder) updates]) =
      _$NoFieldsValue;

  NoFieldsValue._();
}
