// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'polymorphism.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cat> _$catSerializer = _$CatSerializer();
Serializer<Fish> _$fishSerializer = _$FishSerializer();
Serializer<Robot> _$robotSerializer = _$RobotSerializer();
Serializer<Cage> _$cageSerializer = _$CageSerializer();
Serializer<StandardCat> _$standardCatSerializer = _$StandardCatSerializer();
Serializer<HasString> _$hasStringSerializer = _$HasStringSerializer();
Serializer<HasDouble> _$hasDoubleSerializer = _$HasDoubleSerializer();
Serializer<UsesHandCoded> _$usesHandCodedSerializer =
    _$UsesHandCodedSerializer();

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

class _$RobotSerializer implements StructuredSerializer<Robot> {
  @override
  final Iterable<Type> types = const [Robot, _$Robot];
  @override
  final String wireName = 'Robot';

  @override
  Iterable<Object?> serialize(Serializers serializers, Robot object,
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
  Robot deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RobotBuilder();

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

class _$CageSerializer implements StructuredSerializer<Cage> {
  @override
  final Iterable<Type> types = const [Cage, _$Cage];
  @override
  final String wireName = 'Cage';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'inhabitant',
      serializers.serialize(object.inhabitant,
          specifiedType: const FullType(Animal)),
      'otherInhabitants',
      serializers.serialize(object.otherInhabitants,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Animal)])),
    ];

    return result;
  }

  @override
  Cage deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'inhabitant':
          result.inhabitant = serializers.deserialize(value,
              specifiedType: const FullType(Animal))! as Animal;
          break;
        case 'otherInhabitants':
          result.otherInhabitants.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Animal)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$StandardCatSerializer implements StructuredSerializer<StandardCat> {
  @override
  final Iterable<Type> types = const [StandardCat, _$StandardCat];
  @override
  final String wireName = 'StandardCat';

  @override
  Iterable<Object?> serialize(Serializers serializers, StandardCat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'tail',
      serializers.serialize(object.tail, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  StandardCat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = StandardCatBuilder();

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
      }
    }

    return result.build();
  }
}

class _$HasStringSerializer implements StructuredSerializer<HasString> {
  @override
  final Iterable<Type> types = const [HasString, _$HasString];
  @override
  final String wireName = 'HasString';

  @override
  Iterable<Object?> serialize(Serializers serializers, HasString object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HasString deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HasStringBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HasDoubleSerializer implements StructuredSerializer<HasDouble> {
  @override
  final Iterable<Type> types = const [HasDouble, _$HasDouble];
  @override
  final String wireName = 'HasDouble';

  @override
  Iterable<Object?> serialize(Serializers serializers, HasDouble object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  HasDouble deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HasDoubleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$UsesHandCodedSerializer implements StructuredSerializer<UsesHandCoded> {
  @override
  final Iterable<Type> types = const [UsesHandCoded, _$UsesHandCoded];
  @override
  final String wireName = 'UsesHandCoded';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsesHandCoded object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fieldInBaseBuilder',
      serializers.serialize(object.fieldInBaseBuilder,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UsesHandCoded deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UsesHandCodedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fieldInBaseBuilder':
          result.fieldInBaseBuilder = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

abstract class AnimalBuilder {
  void replace(Animal other);
  void update(void Function(AnimalBuilder) updates);
  int? get legs;
  set legs(int? legs);
}

abstract class MammalBuilder implements AnimalBuilder {
  void replace(covariant Mammal other);
  void update(void Function(MammalBuilder) updates);
  int? get legs;
  set legs(covariant int? legs);
}

class _$Cat extends Cat {
  @override
  final bool tail;
  @override
  final int legs;

  factory _$Cat([void Function(CatBuilder)? updates]) =>
      (CatBuilder()..update(updates))._build();

  _$Cat._({required this.tail, required this.legs}) : super._();
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

class CatBuilder implements Builder<Cat, CatBuilder>, MammalBuilder {
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

  _$Fish._({required this.fins, required this.legs}) : super._();
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

class _$Robot extends Robot {
  @override
  final int fins;
  @override
  final int legs;

  factory _$Robot([void Function(RobotBuilder)? updates]) =>
      (RobotBuilder()..update(updates))._build();

  _$Robot._({required this.fins, required this.legs}) : super._();
  @override
  Robot rebuild(void Function(RobotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RobotBuilder toBuilder() => RobotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Robot && fins == other.fins && legs == other.legs;
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
    return (newBuiltValueToStringHelper(r'Robot')
          ..add('fins', fins)
          ..add('legs', legs))
        .toString();
  }
}

class RobotBuilder implements Builder<Robot, RobotBuilder> {
  _$Robot? _$v;

  int? _fins;
  int? get fins => _$this._fins;
  set fins(int? fins) => _$this._fins = fins;

  int? _legs;
  int? get legs => _$this._legs;
  set legs(int? legs) => _$this._legs = legs;

  RobotBuilder();

  RobotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fins = $v.fins;
      _legs = $v.legs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Robot other) {
    _$v = other as _$Robot;
  }

  @override
  void update(void Function(RobotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Robot build() => _build();

  _$Robot _build() {
    final _$result = _$v ??
        _$Robot._(
          fins: BuiltValueNullFieldError.checkNotNull(fins, r'Robot', 'fins'),
          legs: BuiltValueNullFieldError.checkNotNull(legs, r'Robot', 'legs'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Cage extends Cage {
  @override
  final Animal inhabitant;
  @override
  final BuiltList<Animal> otherInhabitants;

  factory _$Cage([void Function(CageBuilder)? updates]) =>
      (CageBuilder()..update(updates))._build();

  _$Cage._({required this.inhabitant, required this.otherInhabitants})
      : super._();
  @override
  Cage rebuild(void Function(CageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CageBuilder toBuilder() => CageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cage &&
        inhabitant == other.inhabitant &&
        otherInhabitants == other.otherInhabitants;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, inhabitant.hashCode);
    _$hash = $jc(_$hash, otherInhabitants.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cage')
          ..add('inhabitant', inhabitant)
          ..add('otherInhabitants', otherInhabitants))
        .toString();
  }
}

class CageBuilder implements Builder<Cage, CageBuilder> {
  _$Cage? _$v;

  Animal? _inhabitant;
  Animal? get inhabitant => _$this._inhabitant;
  set inhabitant(Animal? inhabitant) => _$this._inhabitant = inhabitant;

  ListBuilder<Animal>? _otherInhabitants;
  ListBuilder<Animal> get otherInhabitants =>
      _$this._otherInhabitants ??= ListBuilder<Animal>();
  set otherInhabitants(ListBuilder<Animal>? otherInhabitants) =>
      _$this._otherInhabitants = otherInhabitants;

  CageBuilder();

  CageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _inhabitant = $v.inhabitant;
      _otherInhabitants = $v.otherInhabitants.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cage other) {
    _$v = other as _$Cage;
  }

  @override
  void update(void Function(CageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Cage build() => _build();

  _$Cage _build() {
    _$Cage _$result;
    try {
      _$result = _$v ??
          _$Cage._(
            inhabitant: BuiltValueNullFieldError.checkNotNull(
                inhabitant, r'Cage', 'inhabitant'),
            otherInhabitants: otherInhabitants.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'otherInhabitants';
        otherInhabitants.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Cage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StandardCat extends StandardCat {
  @override
  final bool tail;

  factory _$StandardCat([void Function(StandardCatBuilder)? updates]) =>
      (StandardCatBuilder()..update(updates))._build();

  _$StandardCat._({required this.tail}) : super._();
  @override
  StandardCat rebuild(void Function(StandardCatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StandardCatBuilder toBuilder() => StandardCatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StandardCat && tail == other.tail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StandardCat')..add('tail', tail))
        .toString();
  }
}

class StandardCatBuilder implements Builder<StandardCat, StandardCatBuilder> {
  _$StandardCat? _$v;

  bool? _tail;
  bool? get tail => _$this._tail;
  set tail(bool? tail) => _$this._tail = tail;

  StandardCatBuilder();

  StandardCatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tail = $v.tail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StandardCat other) {
    _$v = other as _$StandardCat;
  }

  @override
  void update(void Function(StandardCatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StandardCat build() => _build();

  _$StandardCat _build() {
    final _$result = _$v ??
        _$StandardCat._(
          tail: BuiltValueNullFieldError.checkNotNull(
              tail, r'StandardCat', 'tail'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract class HasFieldBuilder<T> {
  void replace(HasField<T> other);
  void update(void Function(HasFieldBuilder<T>) updates);
  T? get field;
  set field(T? field);
}

class _$HasString extends HasString {
  @override
  final String field;

  factory _$HasString([void Function(HasStringBuilder)? updates]) =>
      (HasStringBuilder()..update(updates))._build();

  _$HasString._({required this.field}) : super._();
  @override
  HasString rebuild(void Function(HasStringBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HasStringBuilder toBuilder() => HasStringBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HasString && field == other.field;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HasString')..add('field', field))
        .toString();
  }
}

class HasStringBuilder
    implements Builder<HasString, HasStringBuilder>, HasFieldBuilder<String> {
  _$HasString? _$v;

  String? _field;
  String? get field => _$this._field;
  set field(covariant String? field) => _$this._field = field;

  HasStringBuilder();

  HasStringBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant HasString other) {
    _$v = other as _$HasString;
  }

  @override
  void update(void Function(HasStringBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HasString build() => _build();

  _$HasString _build() {
    final _$result = _$v ??
        _$HasString._(
          field: BuiltValueNullFieldError.checkNotNull(
              field, r'HasString', 'field'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$HasDouble extends HasDouble {
  @override
  final double field;

  factory _$HasDouble([void Function(HasDoubleBuilder)? updates]) =>
      (HasDoubleBuilder()..update(updates))._build();

  _$HasDouble._({required this.field}) : super._();
  @override
  HasDouble rebuild(void Function(HasDoubleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HasDoubleBuilder toBuilder() => HasDoubleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HasDouble && field == other.field;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HasDouble')..add('field', field))
        .toString();
  }
}

class HasDoubleBuilder
    implements Builder<HasDouble, HasDoubleBuilder>, HasFieldBuilder<double> {
  _$HasDouble? _$v;

  double? _field;
  double? get field => _$this._field;
  set field(covariant double? field) => _$this._field = field;

  HasDoubleBuilder();

  HasDoubleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant HasDouble other) {
    _$v = other as _$HasDouble;
  }

  @override
  void update(void Function(HasDoubleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HasDouble build() => _build();

  _$HasDouble _build() {
    final _$result = _$v ??
        _$HasDouble._(
          field: BuiltValueNullFieldError.checkNotNull(
              field, r'HasDouble', 'field'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$UsesChainedInterface extends UsesChainedInterface {
  @override
  final int bar;
  @override
  final int foo;

  factory _$UsesChainedInterface(
          [void Function(UsesChainedInterfaceBuilder)? updates]) =>
      (UsesChainedInterfaceBuilder()..update(updates))._build();

  _$UsesChainedInterface._({required this.bar, required this.foo}) : super._();
  @override
  UsesChainedInterface rebuild(
          void Function(UsesChainedInterfaceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesChainedInterfaceBuilder toBuilder() =>
      UsesChainedInterfaceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsesChainedInterface &&
        bar == other.bar &&
        foo == other.foo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bar.hashCode);
    _$hash = $jc(_$hash, foo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsesChainedInterface')
          ..add('bar', bar)
          ..add('foo', foo))
        .toString();
  }
}

class UsesChainedInterfaceBuilder
    implements Builder<UsesChainedInterface, UsesChainedInterfaceBuilder> {
  _$UsesChainedInterface? _$v;

  int? _bar;
  int? get bar => _$this._bar;
  set bar(int? bar) => _$this._bar = bar;

  int? _foo;
  int? get foo => _$this._foo;
  set foo(int? foo) => _$this._foo = foo;

  UsesChainedInterfaceBuilder();

  UsesChainedInterfaceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bar = $v.bar;
      _foo = $v.foo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsesChainedInterface other) {
    _$v = other as _$UsesChainedInterface;
  }

  @override
  void update(void Function(UsesChainedInterfaceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsesChainedInterface build() => _build();

  _$UsesChainedInterface _build() {
    final _$result = _$v ??
        _$UsesChainedInterface._(
          bar: BuiltValueNullFieldError.checkNotNull(
              bar, r'UsesChainedInterface', 'bar'),
          foo: BuiltValueNullFieldError.checkNotNull(
              foo, r'UsesChainedInterface', 'foo'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$UsesHandCoded extends UsesHandCoded {
  @override
  final int fieldInBaseBuilder;

  factory _$UsesHandCoded([void Function(UsesHandCodedBuilder)? updates]) =>
      (UsesHandCodedBuilder()..update(updates))._build();

  _$UsesHandCoded._({required this.fieldInBaseBuilder}) : super._();
  @override
  UsesHandCoded rebuild(void Function(UsesHandCodedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesHandCodedBuilder toBuilder() => UsesHandCodedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsesHandCoded &&
        fieldInBaseBuilder == other.fieldInBaseBuilder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fieldInBaseBuilder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsesHandCoded')
          ..add('fieldInBaseBuilder', fieldInBaseBuilder))
        .toString();
  }
}

class UsesHandCodedBuilder
    implements Builder<UsesHandCoded, UsesHandCodedBuilder>, HandCodedBuilder {
  _$UsesHandCoded? _$v;

  int? _fieldInBaseBuilder;
  int? get fieldInBaseBuilder => _$this._fieldInBaseBuilder;
  set fieldInBaseBuilder(covariant int? fieldInBaseBuilder) =>
      _$this._fieldInBaseBuilder = fieldInBaseBuilder;

  UsesHandCodedBuilder();

  UsesHandCodedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fieldInBaseBuilder = $v.fieldInBaseBuilder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UsesHandCoded other) {
    _$v = other as _$UsesHandCoded;
  }

  @override
  void update(void Function(UsesHandCodedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsesHandCoded build() => _build();

  _$UsesHandCoded _build() {
    final _$result = _$v ??
        _$UsesHandCoded._(
          fieldInBaseBuilder: BuiltValueNullFieldError.checkNotNull(
              fieldInBaseBuilder, r'UsesHandCoded', 'fieldInBaseBuilder'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract class OneBuilder {
  void replace(One other);
  void update(void Function(OneBuilder) updates);
}

abstract class TwoBuilder {
  void replace(Two other);
  void update(void Function(TwoBuilder) updates);
}

class _$ImplementsTwo extends ImplementsTwo {
  factory _$ImplementsTwo([void Function(ImplementsTwoBuilder)? updates]) =>
      (ImplementsTwoBuilder()..update(updates))._build();

  _$ImplementsTwo._() : super._();
  @override
  ImplementsTwo rebuild(void Function(ImplementsTwoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImplementsTwoBuilder toBuilder() => ImplementsTwoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImplementsTwo;
  }

  @override
  int get hashCode {
    return 185492149;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ImplementsTwo').toString();
  }
}

class ImplementsTwoBuilder
    implements
        Builder<ImplementsTwo, ImplementsTwoBuilder>,
        OneBuilder,
        TwoBuilder {
  _$ImplementsTwo? _$v;

  ImplementsTwoBuilder();

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant ImplementsTwo other) {
    _$v = other as _$ImplementsTwo;
  }

  @override
  void update(void Function(ImplementsTwoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImplementsTwo build() => _build();

  _$ImplementsTwo _build() {
    final _$result = _$v ?? _$ImplementsTwo._();
    replace(_$result);
    return _$result;
  }
}

abstract class VehicleBuilder {
  void replace(Vehicle other);
  void update(void Function(VehicleBuilder) updates);
  VehicleColorBuilder get color;
  set color(VehicleColorBuilder? color);
}

class _$Car extends Car {
  @override
  final int seatsCount;
  @override
  final VehicleColor color;

  factory _$Car([void Function(CarBuilder)? updates]) =>
      (CarBuilder()..update(updates))._build();

  _$Car._({required this.seatsCount, required this.color}) : super._();
  @override
  Car rebuild(void Function(CarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CarBuilder toBuilder() => CarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Car &&
        seatsCount == other.seatsCount &&
        color == other.color;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, seatsCount.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Car')
          ..add('seatsCount', seatsCount)
          ..add('color', color))
        .toString();
  }
}

class CarBuilder implements Builder<Car, CarBuilder>, VehicleBuilder {
  _$Car? _$v;

  int? _seatsCount;
  int? get seatsCount => _$this._seatsCount;
  set seatsCount(covariant int? seatsCount) => _$this._seatsCount = seatsCount;

  VehicleColorBuilder? _color;
  VehicleColorBuilder get color => _$this._color ??= VehicleColorBuilder();
  set color(covariant VehicleColorBuilder? color) => _$this._color = color;

  CarBuilder();

  CarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _seatsCount = $v.seatsCount;
      _color = $v.color.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Car other) {
    _$v = other as _$Car;
  }

  @override
  void update(void Function(CarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Car build() => _build();

  _$Car _build() {
    _$Car _$result;
    try {
      _$result = _$v ??
          _$Car._(
            seatsCount: BuiltValueNullFieldError.checkNotNull(
                seatsCount, r'Car', 'seatsCount'),
            color: color.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'color';
        color.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Car', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MixinCar extends MixinCar {
  @override
  final int seatsCount;
  @override
  final VehicleColor color;

  factory _$MixinCar([void Function(MixinCarBuilder)? updates]) =>
      (MixinCarBuilder()..update(updates))._build();

  _$MixinCar._({required this.seatsCount, required this.color}) : super._();
  @override
  MixinCar rebuild(void Function(MixinCarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MixinCarBuilder toBuilder() => MixinCarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MixinCar &&
        seatsCount == other.seatsCount &&
        color == other.color;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, seatsCount.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MixinCar')
          ..add('seatsCount', seatsCount)
          ..add('color', color))
        .toString();
  }
}

class MixinCarBuilder
    with VehicleBuilder
    implements Builder<MixinCar, MixinCarBuilder> {
  _$MixinCar? _$v;

  int? _seatsCount;
  int? get seatsCount => _$this._seatsCount;
  set seatsCount(covariant int? seatsCount) => _$this._seatsCount = seatsCount;

  VehicleColorBuilder? _color;
  VehicleColorBuilder get color => _$this._color ??= VehicleColorBuilder();
  set color(covariant VehicleColorBuilder? color) => _$this._color = color;

  MixinCarBuilder();

  MixinCarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _seatsCount = $v.seatsCount;
      _color = $v.color.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MixinCar other) {
    _$v = other as _$MixinCar;
  }

  @override
  void update(void Function(MixinCarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MixinCar build() => _build();

  _$MixinCar _build() {
    _$MixinCar _$result;
    try {
      _$result = _$v ??
          _$MixinCar._(
            seatsCount: BuiltValueNullFieldError.checkNotNull(
                seatsCount, r'MixinCar', 'seatsCount'),
            color: color.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'color';
        color.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MixinCar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VehicleColor extends VehicleColor {
  @override
  final String label;

  factory _$VehicleColor([void Function(VehicleColorBuilder)? updates]) =>
      (VehicleColorBuilder()..update(updates))._build();

  _$VehicleColor._({required this.label}) : super._();
  @override
  VehicleColor rebuild(void Function(VehicleColorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VehicleColorBuilder toBuilder() => VehicleColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VehicleColor && label == other.label;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VehicleColor')..add('label', label))
        .toString();
  }
}

class VehicleColorBuilder
    implements Builder<VehicleColor, VehicleColorBuilder> {
  _$VehicleColor? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  VehicleColorBuilder();

  VehicleColorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VehicleColor other) {
    _$v = other as _$VehicleColor;
  }

  @override
  void update(void Function(VehicleColorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VehicleColor build() => _build();

  _$VehicleColor _build() {
    final _$result = _$v ??
        _$VehicleColor._(
          label: BuiltValueNullFieldError.checkNotNull(
              label, r'VehicleColor', 'label'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract class NotInstantiableNotNestedBuilder
    implements
        Builder<NotInstantiableNotNested, NotInstantiableNotNestedBuilder> {
  BuiltList<String>? get list;
  set list(BuiltList<String>? list);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
