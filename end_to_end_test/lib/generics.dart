// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library generics;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generics.g.dart';

abstract class GenericValue<T>
    implements Built<GenericValue<T>, GenericValueBuilder<T>> {
  static Serializer<GenericValue> get serializer => _$genericValueSerializer;

  T get value;

  factory GenericValue([updates(GenericValueBuilder<T> b)]) = _$GenericValue<T>;
  GenericValue._();
}

abstract class BoundGenericValue<T extends num>
    implements Built<BoundGenericValue<T>, BoundGenericValueBuilder<T>> {
  static Serializer<BoundGenericValue> get serializer =>
      _$boundGenericValueSerializer;

  T get value;

  factory BoundGenericValue([updates(BoundGenericValueBuilder<T> b)]) =
      _$BoundGenericValue<T>;
  BoundGenericValue._();
}

abstract class CollectionGenericValue<T>
    implements
        Built<CollectionGenericValue<T>, CollectionGenericValueBuilder<T>> {
  static Serializer<CollectionGenericValue> get serializer =>
      _$collectionGenericValueSerializer;

  BuiltList<T> get values;

  factory CollectionGenericValue(
          [updates(CollectionGenericValueBuilder<T> b)]) =
      _$CollectionGenericValue<T>;
  CollectionGenericValue._();
}

abstract class GenericContainer
    implements Built<GenericContainer, GenericContainerBuilder> {
  static Serializer<GenericContainer> get serializer =>
      _$genericContainerSerializer;

  GenericValue<String> get genericValue;
  BoundGenericValue<double> get boundGenericValue;
  CollectionGenericValue<String> get collectionGenericValue;

  factory GenericContainer([updates(GenericContainerBuilder b)]) =
      _$GenericContainer;
  GenericContainer._();
}
