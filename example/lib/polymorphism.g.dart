// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polymorphism.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cat> _$catSerializer = _$CatSerializer();
Serializer<Fish> _$fishSerializer = _$FishSerializer();

class _$CatSerializer implements StructuredSerializer<Cat> {
  @override
  final Iterable<Type> types = const [Cat, _$Cat];
  @override
  final String wireName = 'Cat';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'tail',
      serializers.serialize(object.tail, specifiedType: const FullType(bool)),
      'legs',
      serializers.serialize(object.legs, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Cat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tail':
          result.tail = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'legs':
          result.legs = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
  Iterable<Object?> serialize(Serializers serializers, Fish object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fins',
      serializers.serialize(object.fins, specifiedType: const FullType(int)),
      'legs',
      serializers.serialize(object.legs, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Fish deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FishBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fins':
          result.fins = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'legs':
          result.legs = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class AnimalBuilder {
  void replace(Animal other);
  void update(void Function(AnimalBuilder) updates);
  int? get legs;
  set legs(int? legs);
}

class _$Cat extends Cat {
  @override
  final bool tail;
  @override
  final int legs;

  factory _$Cat([void Function(CatBuilder)? updates]) =>
      (CatBuilder()..update(updates))._build();

  _$Cat._({required this.tail, required this.legs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(tail, r'Cat', 'tail');
    BuiltValueNullFieldError.checkNotNull(legs, r'Cat', 'legs');
  }

  @override
  Cat rebuild(void Function(CatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatBuilder toBuilder() => CatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cat && tail == other.tail && legs == other.legs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tail.hashCode);
    _$hash = $jc(_$hash, legs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cat')
          ..add('tail', tail)
          ..add('legs', legs))
        .toString();
  }
}

class CatBuilder implements Builder<Cat, CatBuilder>, AnimalBuilder {
  _$Cat? _$v;

  bool? _tail;
  bool? get tail => _$this._tail;
  set tail(covariant bool? tail) => _$this._tail = tail;

  int? _legs;
  int? get legs => _$this._legs;
  set legs(covariant int? legs) => _$this._legs = legs;

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
  void update(void Function(CatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Cat build() => _build();

  _$Cat _build() {
    final _$result = _$v ??
        _$Cat._(
          tail: BuiltValueNullFieldError.checkNotNull(tail, r'Cat', 'tail'),
          legs: BuiltValueNullFieldError.checkNotNull(legs, r'Cat', 'legs'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Fish extends Fish {
  @override
  final int fins;
  @override
  final int legs;

  factory _$Fish([void Function(FishBuilder)? updates]) =>
      (FishBuilder()..update(updates))._build();

  _$Fish._({required this.fins, required this.legs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(fins, r'Fish', 'fins');
    BuiltValueNullFieldError.checkNotNull(legs, r'Fish', 'legs');
  }

  @override
  Fish rebuild(void Function(FishBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FishBuilder toBuilder() => FishBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Fish && fins == other.fins && legs == other.legs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fins.hashCode);
    _$hash = $jc(_$hash, legs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Fish')
          ..add('fins', fins)
          ..add('legs', legs))
        .toString();
  }
}

class FishBuilder implements Builder<Fish, FishBuilder>, AnimalBuilder {
  _$Fish? _$v;

  int? _fins;
  int? get fins => _$this._fins;
  set fins(covariant int? fins) => _$this._fins = fins;

  int? _legs;
  int? get legs => _$this._legs;
  set legs(covariant int? legs) => _$this._legs = legs;

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
  void update(void Function(FishBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Fish build() => _build();

  _$Fish _build() {
    final _$result = _$v ??
        _$Fish._(
          fins: BuiltValueNullFieldError.checkNotNull(fins, r'Fish', 'fins'),
          legs: BuiltValueNullFieldError.checkNotNull(legs, r'Fish', 'legs'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
