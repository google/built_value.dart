// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'polymorphism_nnbd.g.dart';

@BuiltValue(instantiable: false)
abstract class Animal extends Object with Walker implements OtherInterface {
  @override
  int get legs;

  Animal rebuild(void Function(AnimalBuilder) updates);
  AnimalBuilder toBuilder();
}

// Polymorphic base classes are allowed to omit implementing `Built` while
// still being allowed to implement any other interface.
abstract class OtherInterface {}

// Check a second layer of `instantiable: false` inheritance.
@BuiltValue(instantiable: false)
abstract class Mammal implements Animal {
  @override
  Mammal rebuild(void Function(MammalBuilder) updates);
  @override
  MammalBuilder toBuilder();
}

abstract class Cat extends Object
    with Walker
    implements Mammal, Built<Cat, CatBuilder> {
  static Serializer<Cat> get serializer => _$catSerializer;

  bool get tail;

  factory Cat([void Function(CatBuilder) updates]) = _$Cat;
  Cat._();
}

abstract class Fish extends Object
    with Swimmer, Walker
    implements Animal, Built<Fish, FishBuilder> {
  static Serializer<Fish> get serializer => _$fishSerializer;

  @override
  int get fins;

  factory Fish([void Function(FishBuilder) updates]) = _$Fish;
  Fish._();
}

// Fields should come via mixins with no need for interfaces.
abstract class Robot extends Object
    with Swimmer, Walker
    implements Built<Robot, RobotBuilder> {
  static Serializer<Robot> get serializer => _$robotSerializer;

  factory Robot([void Function(RobotBuilder) updates]) = _$Robot;
  Robot._();
}

abstract class Walker {
  int get legs;

  bool get canWalk => legs > 1;
}

abstract class Swimmer {
  int get fins;

  bool get canSwim => fins > 1;
}

abstract class Cage implements Built<Cage, CageBuilder> {
  static Serializer<Cage> get serializer => _$cageSerializer;

  Animal get inhabitant;
  BuiltList<Animal> get otherInhabitants;

  factory Cage([void Function(CageBuilder) updates]) = _$Cage;
  Cage._();
}

// It's possible to implement getters via mixins. Such getters are treated
// exactly as concrete getters in the immediate class -- they are ignored.
abstract class FourLeggedWalker {
  int get legs => 4;
}

abstract class HasLegs {
  int get legs;
}

// "Legs" field comes from "FourLeggedWalker" mixin and does not lead to a
// generated field.
abstract class StandardCat extends Object
    with Walker, FourLeggedWalker
    implements HasLegs, Built<StandardCat, StandardCatBuilder> {
  static Serializer<StandardCat> get serializer => _$standardCatSerializer;

  bool get tail;

  factory StandardCat([void Function(StandardCatBuilder) updates]) =
      _$StandardCat;
  StandardCat._();
}

@BuiltValue(instantiable: false)
abstract class HasField<T> {
  T get field;

  HasField<T> rebuild(void Function(HasFieldBuilder<T>) updates);
  HasFieldBuilder<T> toBuilder();
}

abstract class HasString
    implements Built<HasString, HasStringBuilder>, HasField<String> {
  static Serializer<HasString> get serializer => _$hasStringSerializer;

  @override
  String get field;

  factory HasString([void Function(HasStringBuilder) updates]) = _$HasString;
  HasString._();
}

abstract class HasDouble
    implements Built<HasDouble, HasDoubleBuilder>, HasField<double> {
  static Serializer<HasDouble> get serializer => _$hasDoubleSerializer;

  @override
  double get field;

  factory HasDouble([void Function(HasDoubleBuilder) updates]) = _$HasDouble;
  HasDouble._();
}

// Check generation for fields that are pulled in via a chain of `implements`.
// Check both the "abstract" case and the "implemented by mixin" case.
abstract class ChainedInterface {
  int get foo;
  int get moreFoo;
}

abstract class ChainedInterface2 implements ChainedInterface {
  int get bar;
  int get moreBar;
}

abstract class MoreMixin {
  int get moreFoo => 0;
  int get moreBar => 1;
}

abstract class UsesChainedInterface extends Object
    with MoreMixin
    implements
        Built<UsesChainedInterface, UsesChainedInterfaceBuilder>,
        ChainedInterface2 {
  factory UsesChainedInterface(
          [void Function(UsesChainedInterfaceBuilder) updates]) =
      _$UsesChainedInterface;
  UsesChainedInterface._();
}

// Check that a non-instantiable `built` class is allow to omit `Built`, and
// the corresponding hand-coded builder is allowed to omit `Builder`, to
// choose which fields to specify, and to omit factory and constructor.
@BuiltValue(instantiable: false)
abstract class HandCoded {
  int get fieldInBaseBuilder;
  int get fieldNotInBaseBuilder;

  HandCoded rebuild(void Function(HandCodedBuilder) updates);
}

abstract class HandCodedBuilder {
  int? fieldInBaseBuilder;
}

abstract class UsesHandCoded
    implements Built<UsesHandCoded, UsesHandCodedBuilder>, HandCoded {
  static Serializer<UsesHandCoded> get serializer => _$usesHandCodedSerializer;

  // If a field is not present in the base builder, we're free to supply an
  // implementation rather than using the generated one.
  @override
  int get fieldNotInBaseBuilder => 37;

  factory UsesHandCoded([void Function(UsesHandCodedBuilder) updates]) =
      _$UsesHandCoded;
  UsesHandCoded._();
}

// Check generation when two @BuiltValue(instantiable: false) classes are
// implemented. Currently needs a workaround due to analyzer issue:
// https://github.com/dart-lang/sdk/issues/32025
@BuiltValue(instantiable: false)
abstract class One {}

@BuiltValue(instantiable: false)
abstract class Two {}

abstract class ImplementsTwo
    implements Built<ImplementsTwo, ImplementsTwoBuilder>, One, Two {
  factory ImplementsTwo([void Function(ImplementsTwoBuilder) updates]) =
      _$ImplementsTwo;
  ImplementsTwo._();
}

// Nullability of nested builders.
@BuiltValue(instantiable: false)
abstract class Vehicle {
  // some property
  VehicleColor get color;

  // common BuiltValue interface
  Vehicle rebuild(void Function(VehicleBuilder b) updates);
  VehicleBuilder toBuilder();
}

abstract class Car implements Vehicle, Built<Car, CarBuilder> {
  Car._();

  factory Car([void Function(CarBuilder)? updates]) = _$Car;

  int get seatsCount;
}

// Check that generated builders mix in parent buildes when the class mixes
// in the other class; otherwise, they won't build.
abstract class MixinCar
    with Vehicle
    implements Built<MixinCar, MixinCarBuilder> {
  MixinCar._();

  factory MixinCar([void Function(MixinCarBuilder)? updates]) = _$MixinCar;

  int get seatsCount;
}

abstract class VehicleColor
    implements Built<VehicleColor, VehicleColorBuilder> {
  VehicleColor._();

  factory VehicleColor([void Function(VehicleColorBuilder)? updates]) =
      _$VehicleColor;

  String get label;
}

@BuiltValue(instantiable: false, nestedBuilders: false)
abstract class NotInstantiableNotNested
    implements
        Built<NotInstantiableNotNested, NotInstantiableNotNestedBuilder> {
  BuiltList<String> get list;
}
