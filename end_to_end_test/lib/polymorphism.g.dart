// GENERATED CODE - DO NOT MODIFY BY HAND

part of polymorphism;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library polymorphism
// **************************************************************************

Serializer<Cat> _$catSerializer = new _$CatSerializer();
Serializer<Fish> _$fishSerializer = new _$FishSerializer();

class _$CatSerializer implements StructuredSerializer<Cat> {
  @override
  final Iterable<Type> types = const [Cat, _$Cat];
  @override
  final String wireName = 'Cat';

  @override
  Iterable serialize(Serializers serializers, Cat object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'legs',
      serializers.serialize(object.legs, specifiedType: const FullType(int)),
      'tail',
      serializers.serialize(object.tail, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Cat deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'legs':
          result.legs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tail':
          result.tail = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$FishSerializer implements StructuredSerializer<Fish> {
  @override
  final Iterable<Type> types = const [Fish, _$Fish];
  @override
  final String wireName = 'Fish';

  @override
  Iterable serialize(Serializers serializers, Fish object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'legs',
      serializers.serialize(object.legs, specifiedType: const FullType(int)),
      'fins',
      serializers.serialize(object.fins, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Fish deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new FishBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'legs':
          result.legs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fins':
          result.fins = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Animal
// **************************************************************************

// ignore_for_file: annotate_overrides
abstract class AnimalBuilder implements Builder<Animal, AnimalBuilder> {
  int get legs;
  set legs(int legs);
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Cat
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$Cat extends Cat {
  @override
  final int legs;
  @override
  final bool tail;

  factory _$Cat([void updates(CatBuilder b)]) =>
      (new CatBuilder()..update(updates)).build();

  _$Cat._({this.legs, this.tail}) : super._() {
    if (legs == null) throw new ArgumentError.notNull('legs');
    if (tail == null) throw new ArgumentError.notNull('tail');
  }

  @override
  Cat rebuild(void updates(CatBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CatBuilder toBuilder() => new CatBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Cat) return false;
    return legs == other.legs && tail == other.tail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, legs.hashCode), tail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cat')
          ..add('legs', legs)
          ..add('tail', tail))
        .toString();
  }
}

class CatBuilder implements Builder<Cat, CatBuilder>, AnimalBuilder {
  _$Cat _$v;

  int _legs;
  int get legs => _$this._legs;
  set legs(int legs) => _$this._legs = legs;

  bool _tail;
  bool get tail => _$this._tail;
  set tail(bool tail) => _$this._tail = tail;

  CatBuilder();

  CatBuilder get _$this {
    if (_$v != null) {
      _legs = _$v.legs;
      _tail = _$v.tail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cat other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Cat;
  }

  @override
  void update(void updates(CatBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Cat build() {
    final result = _$v ?? new _$Cat._(legs: legs, tail: tail);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Fish
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$Fish extends Fish {
  @override
  final int legs;
  @override
  final int fins;

  factory _$Fish([void updates(FishBuilder b)]) =>
      (new FishBuilder()..update(updates)).build();

  _$Fish._({this.legs, this.fins}) : super._() {
    if (legs == null) throw new ArgumentError.notNull('legs');
    if (fins == null) throw new ArgumentError.notNull('fins');
  }

  @override
  Fish rebuild(void updates(FishBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FishBuilder toBuilder() => new FishBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Fish) return false;
    return legs == other.legs && fins == other.fins;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, legs.hashCode), fins.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Fish')
          ..add('legs', legs)
          ..add('fins', fins))
        .toString();
  }
}

class FishBuilder implements Builder<Fish, FishBuilder>, AnimalBuilder {
  _$Fish _$v;

  int _legs;
  int get legs => _$this._legs;
  set legs(int legs) => _$this._legs = legs;

  int _fins;
  int get fins => _$this._fins;
  set fins(int fins) => _$this._fins = fins;

  FishBuilder();

  FishBuilder get _$this {
    if (_$v != null) {
      _legs = _$v.legs;
      _fins = _$v.fins;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Fish other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Fish;
  }

  @override
  void update(void updates(FishBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Fish build() {
    final result = _$v ?? new _$Fish._(legs: legs, fins: fins);
    replace(result);
    return result;
  }
}
