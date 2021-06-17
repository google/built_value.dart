// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

library serializers_nnbd;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/collections_nnbd.dart';
import 'package:end_to_end_test/enums_nnbd.dart';
import 'package:end_to_end_test/generics_nnbd.dart';
import 'package:end_to_end_test/imported_values_nnbd.dart';
import 'package:end_to_end_test/interfaces_nnbd.dart';
import 'package:end_to_end_test/polymorphism_nnbd.dart';
import 'package:end_to_end_test/standard_json_nnbd.dart';
import 'package:end_to_end_test/values_nnbd.dart';

part 'serializers_nnbd.g.dart';

@SerializersFor([
  BoundGenericValue,
  Cage,
  Cat,
  CollectionGenericValue,
  Collections,
  CompoundValue,
  CompoundValueNoNestingField,
  CompoundValueNestingField,
  CompoundValueExplicitNoNesting,
  CompoundValueNoAutoNesting,
  CompoundValueNoAutoNestingField,
  CompoundValueAutoNestingField,
  CompoundValueNoNesting,
  ConcreteGeneric,
  EnumWithInt,
  FallbackEnum,
  FallbackNumberEnum,
  FieldDiscoveryValue,
  Fish,
  GenericContainer,
  GenericValue,
  HasDouble,
  HasString,
  ImportedValue,
  ImportedCustomValue,
  ImportedCustomNestedValue,
  NamedFactoryValue,
  NestedGenericContainer,
  NonBuiltGeneric,
  OtherValue,
  PartiallySerializableValue,
  PassthroughGenericContainer,
  PrimitivesValue,
  Robot,
  SecondTestEnum,
  SerializesNullsValue,
  SimpleValue,
  StandardCat,
  StandardJsonValue,
  TestEnum,
  UsesHandCoded,
  ValueUsingImportAs,
  ValueWithBuilderFinalizer,
  ValueWithBuilderInitializer,
  ValueWithCustomSerializer,
  ValueWithHasInt,
  ValueWithInt,
  WireNameEnum,
  WireNameValue,
  WireNumberEnum,
])
final Serializers serializers = _$serializers;

// Check that multiple `Serializers` can be declared in one file.
@SerializersFor([
  Cat,
])
final Serializers moreSerializers = _$moreSerializers;
