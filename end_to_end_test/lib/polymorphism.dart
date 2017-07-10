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

abstract class Walker {
  int get legs;

  bool get canWalk => legs > 1;
}

abstract class Swimmer {
  int get fins;

  bool get canSwim => fins > 1;
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
