library polymorphism;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'polymorphism.g.dart';

@BuiltValue(instantiable: false)
abstract class Animal extends Object
    with Walker
    implements Built<Animal, AnimalBuilder> {
  @override
  int get legs;
}

abstract class Cat extends Object
    with Walker
    implements Animal, Built<Cat, CatBuilder> {
  static Serializer<Cat> get serializer => _$catSerializer;

  bool get tail;

  factory Cat([updates(CatBuilder b)]) = _$Cat;
  Cat._();
}

abstract class Fish extends Object
    with Swimmer, Walker
    implements Animal, Built<Fish, FishBuilder> {
  static Serializer<Fish> get serializer => _$fishSerializer;

  @override
  int get fins;

  factory Fish([updates(FishBuilder b)]) = _$Fish;
  Fish._();
}

// Fields should come via mixins with no need for interfaces.
abstract class Robot extends Object
    with Swimmer, Walker
    implements Built<Robot, RobotBuilder> {
  static Serializer<Robot> get serializer => _$robotSerializer;

  factory Robot([updates(RobotBuilder b)]) = _$Robot;
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
  Animal get inhabitant;

  factory Cage([updates(CageBuilder b)]) = _$Cage;
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

  factory StandardCat([updates(StandardCatBuilder b)]) = _$StandardCat;
  StandardCat._();
}

@BuiltValue(instantiable: false)
abstract class HasField<T> implements Built<HasField<T>, HasFieldBuilder<T>> {
  T get field;
}

abstract class HasString
    implements Built<HasString, HasStringBuilder>, HasField<String> {
  static Serializer<HasString> get serializer => _$hasStringSerializer;

  @override
  String get field;

  factory HasString([updates(HasStringBuilder b)]) = _$HasString;
  HasString._();
}

abstract class HasDouble
    implements Built<HasDouble, HasDoubleBuilder>, HasField<double> {
  static Serializer<HasDouble> get serializer => _$hasDoubleSerializer;

  @override
  double get field;

  factory HasDouble([updates(HasDoubleBuilder b)]) = _$HasDouble;
  HasDouble._();
}
