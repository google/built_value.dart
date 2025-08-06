// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

import 'collections.dart';
import 'enums.dart';
import 'generics.dart';
import 'imported_values.dart';
import 'interfaces.dart';
import 'polymorphism.dart';
import 'records.dart';
import 'standard_json.dart';
import 'values.dart';

part 'serializers.g.dart';

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
  SerializableRecordValue,
  SimpleValue,
  StandardCat,
  StandardJsonValue,
  TestEnum,
  UsesHandCoded,
  $ValueSpecial,
  ValueUsingImportAs,
  ValueWithAwkwardNestedBuilder,
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
@SerializersFor([Cat])
final Serializers moreSerializers = _$moreSerializers;

// Check that generation does not fail due to new type `Never`.
// ignore: only_throw_errors
Never get never => throw 'Never!';

// Check that generation does not fail due to new type `Record`.
(int, int) get record => (0, 0);
