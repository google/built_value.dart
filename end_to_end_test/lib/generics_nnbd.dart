// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generics_nnbd.g.dart';

abstract class GenericValue<T>
    implements Built<GenericValue<T>, GenericValueBuilder<T>> {
  static Serializer<GenericValue<Object?>> get serializer =>
      _$genericValueSerializer;

  T get value;

  factory GenericValue([Function(GenericValueBuilder<T>) updates]) =
      _$GenericValue<T>;
  factory GenericValue.of(T value) => _$GenericValue._(value: value);
  GenericValue._();
}

abstract class InitializeGenericValue<T>
    implements
        Built<InitializeGenericValue<T>, InitializeGenericValueBuilder<T>> {
  static void _initializeBuilder<T>(InitializeGenericValueBuilder<T> b) {
    if (T == int) {
      b.value = 3 as T;
    }
  }

  T get value;

  factory InitializeGenericValue(
          [Function(InitializeGenericValueBuilder<T>) updates]) =
      _$InitializeGenericValue<T>;
  factory InitializeGenericValue.of(T value) =>
      _$InitializeGenericValue._(value: value);
  InitializeGenericValue._();
}

abstract class BoundGenericValue<T extends num>
    implements Built<BoundGenericValue<T>, BoundGenericValueBuilder<T>> {
  static Serializer<BoundGenericValue> get serializer =>
      _$boundGenericValueSerializer;

  T get value;

  factory BoundGenericValue([Function(BoundGenericValueBuilder<T>) updates]) =
      _$BoundGenericValue<T>;
  BoundGenericValue._();
}

abstract class CollectionGenericValue<T>
    implements
        Built<CollectionGenericValue<T>, CollectionGenericValueBuilder<T>> {
  static Serializer<CollectionGenericValue<Object?>> get serializer =>
      _$collectionGenericValueSerializer;

  BuiltList<T> get values;

  factory CollectionGenericValue(
          [Function(CollectionGenericValueBuilder<T>) updates]) =
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

  factory GenericContainer([void Function(GenericContainerBuilder) updates]) =
      _$GenericContainer;
  GenericContainer._();
}

// Check generation for `strict_raw_types`.
abstract class DynamicGenericContainer
    implements Built<DynamicGenericContainer, DynamicGenericContainerBuilder> {
  Generic<dynamic> get foo;

  factory DynamicGenericContainer(
          [void Function(DynamicGenericContainerBuilder) updates]) =
      _$DynamicGenericContainer;
  DynamicGenericContainer._();
}

abstract class PassthroughGenericContainer<T>
    implements
        Built<PassthroughGenericContainer<T>,
            PassthroughGenericContainerBuilder<T>> {
  static Serializer<PassthroughGenericContainer<Object?>> get serializer =>
      _$passthroughGenericContainerSerializer;

  GenericValue<T> get genericValue;
  CollectionGenericValue<T> get collectionGenericValue;

  factory PassthroughGenericContainer(
          [void Function(PassthroughGenericContainerBuilder<T>) updates]) =
      _$PassthroughGenericContainer<T>;
  PassthroughGenericContainer._();
}

abstract class NestedGenericContainer
    implements Built<NestedGenericContainer, NestedGenericContainerBuilder> {
  static Serializer<NestedGenericContainer> get serializer =>
      _$nestedGenericContainerSerializer;

  GenericValue<BuiltMap<int, String>> get map;

  factory NestedGenericContainer(
          [void Function(NestedGenericContainerBuilder) updates]) =
      _$NestedGenericContainer;
  NestedGenericContainer._();
}

abstract class CustomBuilderGenericValue<T>
    implements
        Built<CustomBuilderGenericValue<T>,
            CustomBuilderGenericValueBuilder<T>> {
  T get value;

  factory CustomBuilderGenericValue(
          [Function(CustomBuilderGenericValueBuilder<T>) updates]) =
      _$CustomBuilderGenericValue<T>;
  CustomBuilderGenericValue._();
}

abstract class CustomBuilderGenericValueBuilder<T>
    implements
        Builder<CustomBuilderGenericValue<T>,
            CustomBuilderGenericValueBuilder<T>> {
  T? value;

  factory CustomBuilderGenericValueBuilder() =
      _$CustomBuilderGenericValueBuilder<T>;
  CustomBuilderGenericValueBuilder._();
}

abstract class Generic<T> {
  T get value;
}

abstract class ConcreteGeneric
    implements Built<ConcreteGeneric, ConcreteGenericBuilder>, Generic<int> {
  static Serializer<ConcreteGeneric> get serializer =>
      _$concreteGenericSerializer;

  factory ConcreteGeneric([void Function(ConcreteGenericBuilder) updates]) =
      _$ConcreteGeneric;
  ConcreteGeneric._();
}

abstract class GenericFunction<T>
    implements Built<GenericFunction<T>, GenericFunctionBuilder<T>> {
  Function(T) get function;

  factory GenericFunction([Function(GenericFunctionBuilder<T>) updates]) =
      _$GenericFunction<T>;
  GenericFunction._();
}

// Check that we do not generate builder factories for generic fields that are
// not `Built` types.
abstract class NonBuiltGeneric
    implements Built<NonBuiltGeneric, NonBuiltGenericBuilder> {
  static Serializer<NonBuiltGeneric> get serializer =>
      _$nonBuiltGenericSerializer;

  NonBuilt<int> get value;

  factory NonBuiltGeneric([Function(NonBuiltGenericBuilder) updates]) =
      _$NonBuiltGeneric;
  NonBuiltGeneric._();
}

class NonBuilt<T> {}

// To check generation does not omit the generics.
abstract class EmptyGeneric<K, V>
    implements Built<EmptyGeneric<K, V>, EmptyGenericBuilder<K, V>> {
  factory EmptyGeneric([void Function(EmptyGenericBuilder<K, V>) updates]) =
      _$EmptyGeneric<K, V>;
  EmptyGeneric._();
  static Serializer<EmptyGeneric<Object?, Object?>> get serializer =>
      _$emptyGenericSerializer;
}
