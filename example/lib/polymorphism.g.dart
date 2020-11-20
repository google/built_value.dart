// GENERATED CODE - DO NOT MODIFY BY HAND

part of polymorphism;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cat> _$catSerializer = new _$CatSerializer();
Serializer<Fish> _$fishSerializer = new _$FishSerializer();

class _$CatSerializer implements StructuredSerializer<Cat> {
  @override
  final Iterable<Type> types = const [Cat, _$Cat];
  @override
  final String wireName = 'Cat';

  @override
  Iterable<Object> serialize(Serializers serializers, Cat object,
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
  Cat deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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
  Iterable<Object> serialize(Serializers serializers, Fish object,
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
  Fish deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FishBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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
  void update(void Function(AnimalBuilder) updates);
  int get legs;
  set legs(int legs);
}

class _$Cat extends Cat {
  @override
  final bool tail;
  @override
  final int legs;

  factory _$Cat([void Function(CatBuilder) updates]) =>
      (new CatBuilder()..update(updates)).build();

  _$Cat._({this.tail, this.legs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(tail, 'Cat', 'tail');
    BuiltValueNullFieldError.checkNotNull(legs, 'Cat', 'legs');
  }

  @override
  Cat rebuild(void Function(CatBuilder) updates) =>
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
    final $v = _$v;
    if ($v != null) {
      _tail = $v.tail;
      _legs = $v.legs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Cat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cat;
  }

  @override
  void update(void Function(CatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Cat build() {
    final _$result = _$v ??
        new _$Cat._(
            tail: BuiltValueNullFieldError.checkNotNull(tail, 'Cat', 'tail'),
            legs: BuiltValueNullFieldError.checkNotNull(legs, 'Cat', 'legs'));
    replace(_$result);
    return _$result;
  }
}

class _$Fish extends Fish {
  @override
  final int fins;
  @override
  final int legs;

  factory _$Fish([void Function(FishBuilder) updates]) =>
      (new FishBuilder()..update(updates)).build();

  _$Fish._({this.fins, this.legs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(fins, 'Fish', 'fins');
    BuiltValueNullFieldError.checkNotNull(legs, 'Fish', 'legs');
  }

  @override
  Fish rebuild(void Function(FishBuilder) updates) =>
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
    final $v = _$v;
    if ($v != null) {
      _fins = $v.fins;
      _legs = $v.legs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Fish other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Fish;
  }

  @override
  void update(void Function(FishBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Fish build() {
    final _$result = _$v ??
        new _$Fish._(
            fins: BuiltValueNullFieldError.checkNotNull(fins, 'Fish', 'fins'),
            legs: BuiltValueNullFieldError.checkNotNull(legs, 'Fish', 'legs'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
