// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/collections.dart';
import 'package:end_to_end_test/enums.dart';
import 'package:end_to_end_test/generics.dart';
import 'package:end_to_end_test/interfaces.dart';
import 'package:end_to_end_test/polymorphism.dart';
import 'package:end_to_end_test/standard_json.dart';
import 'package:end_to_end_test/values.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BoundGenericValue,
  Cat,
  CollectionGenericValue,
  Collections,
  CompoundValue,
  CompoundValueNoNesting,
  EnumWithInt,
  FieldDiscoveryValue,
  GenericContainer,
  GenericValue,
  HasDouble,
  HasString,
  NamedFactoryValue,
  NestedGenericContainer,
  PartiallySerializableValue,
  PrimitivesValue,
  Robot,
  SecondTestEnum,
  SimpleValue,
  StandardCat,
  StandardJsonValue,
  TestEnum,
  ValueUsingImportAs,
  ValueWithHasInt,
  ValueWithInt,
])
final Serializers serializers = _$serializers;

// Check that multiple `Serializers` can be declared in one file.
@SerializersFor(const [
  Cat,
])
final Serializers moreSerializers = _$moreSerializers;
