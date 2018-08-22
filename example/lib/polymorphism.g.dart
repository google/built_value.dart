// GENERATED CODE - DO NOT MODIFY BY HAND

part of polymorphism;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new

Serializer<Cat> _$catSerializer = new _$CatSerializer();
Serializer<Fish> _$fishSerializer = new _$FishSerializer();

class _$CatSerializer implements StructuredSerializer<Cat> {
  @override
  final Iterable<Type> types = const [Cat, _$Cat];
  @override
  final String wireName = 'Cat';

  @override
  Iterable serialize(Serializers serializers, Cat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tail',
      serializers.serialize(object.tail, specifiedType: const FullType(bool)),
      'legs',
      serializers.serialize(object.legs, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Cat deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'tail':
          result.tail = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'legs':
          result.legs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fins',
      serializers.serialize(object.fins, specifiedType: const FullType(int)),
      'legs',
      serializers.serialize(object.legs, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Fish deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FishBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'fins':
          result.fins = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'legs':
          result.legs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

abstract class AnimalBuilder {
  void replace(Animal other);
  void update(void updates(AnimalBuilder b));
  int get legs;
  set legs(int legs);
}

class _$Cat extends Cat {
  @override
  final bool tail;
  @override
  final int legs;

  factory _$Cat([void updates(CatBuilder b)]) =>
      (new CatBuilder()..update(updates)).build();

  _$Cat._({this.tail, this.legs}) : super._() {
    if (tail == null) throw new BuiltValueNullFieldError('Cat', 'tail');
    if (legs == null) throw new BuiltValueNullFieldError('Cat', 'legs');
  }

  @override
  Cat rebuild(void updates(CatBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CatBuilder toBuilder() => new CatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cat && tail == other.tail && legs == other.legs;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, tail.hashCode), legs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cat')
          ..add('tail', tail)
          ..add('legs', legs))
        .toString();
  }
}

class CatBuilder implements Builder<Cat, CatBuilder>, AnimalBuilder {
  _$Cat _$v;

  bool _tail;
  bool get tail => _$this._tail;
  set tail(bool tail) => _$this._tail = tail;

  int _legs;
  int get legs => _$this._legs;
  set legs(int legs) => _$this._legs = legs;

  CatBuilder();

  CatBuilder get _$this {
    if (_$v != null) {
      _tail = _$v.tail;
      _legs = _$v.legs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Cat other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Cat;
  }

  @override
  void update(void updates(CatBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Cat build() {
    final _$result = _$v ?? new _$Cat._(tail: tail, legs: legs);
    replace(_$result);
    return _$result;
  }
}

class _$Fish extends Fish {
  @override
  final int fins;
  @override
  final int legs;

  factory _$Fish([void updates(FishBuilder b)]) =>
      (new FishBuilder()..update(updates)).build();

  _$Fish._({this.fins, this.legs}) : super._() {
    if (fins == null) throw new BuiltValueNullFieldError('Fish', 'fins');
    if (legs == null) throw new BuiltValueNullFieldError('Fish', 'legs');
  }

  @override
  Fish rebuild(void updates(FishBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FishBuilder toBuilder() => new FishBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Fish && fins == other.fins && legs == other.legs;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, fins.hashCode), legs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Fish')
          ..add('fins', fins)
          ..add('legs', legs))
        .toString();
  }
}

class FishBuilder implements Builder<Fish, FishBuilder>, AnimalBuilder {
  _$Fish _$v;

  int _fins;
  int get fins => _$this._fins;
  set fins(int fins) => _$this._fins = fins;

  int _legs;
  int get legs => _$this._legs;
  set legs(int legs) => _$this._legs = legs;

  FishBuilder();

  FishBuilder get _$this {
    if (_$v != null) {
      _fins = _$v.fins;
      _legs = _$v.legs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Fish other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Fish;
  }

  @override
  void update(void updates(FishBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Fish build() {
    final _$result = _$v ?? new _$Fish._(fins: fins, legs: legs);
    replace(_$result);
    return _$result;
  }
}
