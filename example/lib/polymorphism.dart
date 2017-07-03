library polymorphism;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'polymorphism.g.dart';

/// Example of using polymorphism.
///
/// Built Value classes and builders can implement interfaces and use mixins as
/// any other class.
///
/// One special case is if you want to `rebuild` instances via an interface.
/// Then, the interface needs to implement `Built`, but should not itself be
/// instantiated. You can do this by marking the class `instantiable: false`,
/// as here.
///
/// Very little code is generated for a non-instantiable Built Value; just the
/// interface for the builder. You can write this yourself if you prefer, then
/// nothing will be generated.
@BuiltValue(instantiable: false)
abstract class Animal extends Object
    with Walker
    implements Built<Animal, AnimalBuilder> {
  @override
  int get legs;
}

/// `Cat` implements the non-instantiable Built Value `Animal`. The generated
/// builder `CatBuilder` automatically extends 'AnimalBuilder`. This allows you
/// to use `Cat` as an `Animal`.
abstract class Cat extends Object
    with Walker
    implements Animal, Built<Cat, CatBuilder> {
  /// Serializer field makes the built_value serializable.
  static Serializer<Cat> get serializer => _$catSerializer;

  bool get tail;

  factory Cat([updates(CatBuilder b)]) = _$Cat;
  Cat._();
}

/// `Fish` implements the non-instantiable Built Value `Animal`. The generated
/// builder `FishBuilder` automatically extends 'AnimalBuilder`. This allows
/// you to use `Fish` as an `Animal`.
abstract class Fish extends Object
    with Swimmer, Walker
    implements Animal, Built<Fish, FishBuilder> {
  /// Serializer field makes the built_value serializable.
  static Serializer<Fish> get serializer => _$fishSerializer;

  @override
  int get fins;

  factory Fish([updates(FishBuilder b)]) = _$Fish;
  Fish._();
}

/// As with any Built Value, behaviour can be added via mixins.
abstract class Walker {
  int get legs;

  bool get canWalk => legs > 0;
}

/// As with any Built Value, behaviour can be added via mixins.
abstract class Swimmer {
  int get fins;

  bool get canSwim => fins > 1;
}
