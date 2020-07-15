// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'polymorphism_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cat> _$catSerializer = new _$CatSerializer();
Serializer<Fish> _$fishSerializer = new _$FishSerializer();
Serializer<Robot> _$robotSerializer = new _$RobotSerializer();
Serializer<Cage> _$cageSerializer = new _$CageSerializer();
Serializer<StandardCat> _$standardCatSerializer = new _$StandardCatSerializer();
Serializer<HasString> _$hasStringSerializer = new _$HasStringSerializer();
Serializer<HasDouble> _$hasDoubleSerializer = new _$HasDoubleSerializer();
Serializer<UsesHandCoded> _$usesHandCodedSerializer =
    new _$UsesHandCodedSerializer();

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

class _$RobotSerializer implements StructuredSerializer<Robot> {
  @override
  final Iterable<Type> types = const [Robot, _$Robot];
  @override
  final String wireName = 'Robot';

  @override
  Iterable<Object> serialize(Serializers serializers, Robot object,
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
  Robot deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RobotBuilder();

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

class _$CageSerializer implements StructuredSerializer<Cage> {
  @override
  final Iterable<Type> types = const [Cage, _$Cage];
  @override
  final String wireName = 'Cage';

  @override
  Iterable<Object> serialize(Serializers serializers, Cage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
  Cage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'inhabitant':
          result.inhabitant = serializers.deserialize(value,
              specifiedType: const FullType(Animal)) as Animal;
          break;
        case 'otherInhabitants':
          result.otherInhabitants.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Animal)]))
              as BuiltList<Object>);
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
  Iterable<Object> serialize(Serializers serializers, StandardCat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tail',
      serializers.serialize(object.tail, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  StandardCat deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StandardCatBuilder();

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
  Iterable<Object> serialize(Serializers serializers, HasString object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HasString deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HasStringBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  Iterable<Object> serialize(Serializers serializers, HasDouble object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  HasDouble deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HasDoubleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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
  Iterable<Object> serialize(Serializers serializers, UsesHandCoded object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fieldInBaseBuilder',
      serializers.serialize(object.fieldInBaseBuilder,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UsesHandCoded deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsesHandCodedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'fieldInBaseBuilder':
          result.fieldInBaseBuilder = serializers.deserialize(value,
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
  int? get legs;
  set legs(int? legs);
}

abstract class MammalBuilder implements AnimalBuilder {
  void replace(covariant Mammal other);
  void update(void Function(MammalBuilder) updates);
  int? get legs;
  set legs(int? legs);
}

class _$Cat extends Cat {
  @override
  final bool tail;
  @override
  final int legs;

  factory _$Cat([void Function(CatBuilder) updates = emptyUpdate]) =>
      (new CatBuilder()..update(updates)).build();

  _$Cat._({required this.tail, required this.legs}) : super._() {
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

class CatBuilder implements Builder<Cat, CatBuilder>, MammalBuilder {
  _$Cat? _$v;

  bool? _tail;
  bool? get tail => _$this._tail;
  set tail(bool? tail) => _$this._tail = tail;

  int? _legs;
  int? get legs => _$this._legs;
  set legs(int? legs) => _$this._legs = legs;

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
    updates(this);
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

  factory _$Fish([void Function(FishBuilder) updates = emptyUpdate]) =>
      (new FishBuilder()..update(updates)).build();

  _$Fish._({required this.fins, required this.legs}) : super._() {
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
  _$Fish? _$v;

  int? _fins;
  int? get fins => _$this._fins;
  set fins(int? fins) => _$this._fins = fins;

  int? _legs;
  int? get legs => _$this._legs;
  set legs(int? legs) => _$this._legs = legs;

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
    updates(this);
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

class _$Robot extends Robot {
  @override
  final int fins;
  @override
  final int legs;

  factory _$Robot([void Function(RobotBuilder) updates = emptyUpdate]) =>
      (new RobotBuilder()..update(updates)).build();

  _$Robot._({required this.fins, required this.legs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(fins, 'Robot', 'fins');
    BuiltValueNullFieldError.checkNotNull(legs, 'Robot', 'legs');
  }

  @override
  Robot rebuild(void Function(RobotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RobotBuilder toBuilder() => new RobotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Robot && fins == other.fins && legs == other.legs;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, fins.hashCode), legs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Robot')
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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Robot;
  }

  @override
  void update(void Function(RobotBuilder) updates) {
    updates(this);
  }

  @override
  _$Robot build() {
    final _$result = _$v ??
        new _$Robot._(
            fins: BuiltValueNullFieldError.checkNotNull(fins, 'Robot', 'fins'),
            legs: BuiltValueNullFieldError.checkNotNull(legs, 'Robot', 'legs'));
    replace(_$result);
    return _$result;
  }
}

class _$Cage extends Cage {
  @override
  final Animal inhabitant;
  @override
  final BuiltList<Animal> otherInhabitants;

  factory _$Cage([void Function(CageBuilder) updates = emptyUpdate]) =>
      (new CageBuilder()..update(updates)).build();

  _$Cage._({required this.inhabitant, required this.otherInhabitants})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(inhabitant, 'Cage', 'inhabitant');
    BuiltValueNullFieldError.checkNotNull(
        otherInhabitants, 'Cage', 'otherInhabitants');
  }

  @override
  Cage rebuild(void Function(CageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CageBuilder toBuilder() => new CageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cage &&
        inhabitant == other.inhabitant &&
        otherInhabitants == other.otherInhabitants;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, inhabitant.hashCode), otherInhabitants.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cage')
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
      _$this._otherInhabitants ??= new ListBuilder<Animal>();
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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cage;
  }

  @override
  void update(void Function(CageBuilder) updates) {
    updates(this);
  }

  @override
  _$Cage build() {
    _$Cage _$result;
    try {
      _$result = _$v ??
          new _$Cage._(
              inhabitant: BuiltValueNullFieldError.checkNotNull(
                  inhabitant, 'Cage', 'inhabitant'),
              otherInhabitants: otherInhabitants.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'otherInhabitants';
        otherInhabitants.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Cage', _$failedField, e.toString());
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

  factory _$StandardCat(
          [void Function(StandardCatBuilder) updates = emptyUpdate]) =>
      (new StandardCatBuilder()..update(updates)).build();

  _$StandardCat._({required this.tail}) : super._() {
    BuiltValueNullFieldError.checkNotNull(tail, 'StandardCat', 'tail');
  }

  @override
  StandardCat rebuild(void Function(StandardCatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StandardCatBuilder toBuilder() => new StandardCatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StandardCat && tail == other.tail;
  }

  @override
  int get hashCode {
    return $jf($jc(0, tail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StandardCat')..add('tail', tail))
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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StandardCat;
  }

  @override
  void update(void Function(StandardCatBuilder) updates) {
    updates(this);
  }

  @override
  _$StandardCat build() {
    final _$result = _$v ??
        new _$StandardCat._(
            tail: BuiltValueNullFieldError.checkNotNull(
                tail, 'StandardCat', 'tail'));
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

  factory _$HasString(
          [void Function(HasStringBuilder) updates = emptyUpdate]) =>
      (new HasStringBuilder()..update(updates)).build();

  _$HasString._({required this.field}) : super._() {
    BuiltValueNullFieldError.checkNotNull(field, 'HasString', 'field');
  }

  @override
  HasString rebuild(void Function(HasStringBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HasStringBuilder toBuilder() => new HasStringBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HasString && field == other.field;
  }

  @override
  int get hashCode {
    return $jf($jc(0, field.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HasString')..add('field', field))
        .toString();
  }
}

class HasStringBuilder
    implements Builder<HasString, HasStringBuilder>, HasFieldBuilder<String> {
  _$HasString? _$v;

  String? _field;
  String? get field => _$this._field;
  set field(String? field) => _$this._field = field;

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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HasString;
  }

  @override
  void update(void Function(HasStringBuilder) updates) {
    updates(this);
  }

  @override
  _$HasString build() {
    final _$result = _$v ??
        new _$HasString._(
            field: BuiltValueNullFieldError.checkNotNull(
                field, 'HasString', 'field'));
    replace(_$result);
    return _$result;
  }
}

class _$HasDouble extends HasDouble {
  @override
  final double field;

  factory _$HasDouble(
          [void Function(HasDoubleBuilder) updates = emptyUpdate]) =>
      (new HasDoubleBuilder()..update(updates)).build();

  _$HasDouble._({required this.field}) : super._() {
    BuiltValueNullFieldError.checkNotNull(field, 'HasDouble', 'field');
  }

  @override
  HasDouble rebuild(void Function(HasDoubleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HasDoubleBuilder toBuilder() => new HasDoubleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HasDouble && field == other.field;
  }

  @override
  int get hashCode {
    return $jf($jc(0, field.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HasDouble')..add('field', field))
        .toString();
  }
}

class HasDoubleBuilder
    implements Builder<HasDouble, HasDoubleBuilder>, HasFieldBuilder<double> {
  _$HasDouble? _$v;

  double? _field;
  double? get field => _$this._field;
  set field(double? field) => _$this._field = field;

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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HasDouble;
  }

  @override
  void update(void Function(HasDoubleBuilder) updates) {
    updates(this);
  }

  @override
  _$HasDouble build() {
    final _$result = _$v ??
        new _$HasDouble._(
            field: BuiltValueNullFieldError.checkNotNull(
                field, 'HasDouble', 'field'));
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
          [void Function(UsesChainedInterfaceBuilder) updates = emptyUpdate]) =>
      (new UsesChainedInterfaceBuilder()..update(updates)).build();

  _$UsesChainedInterface._({required this.bar, required this.foo}) : super._() {
    BuiltValueNullFieldError.checkNotNull(bar, 'UsesChainedInterface', 'bar');
    BuiltValueNullFieldError.checkNotNull(foo, 'UsesChainedInterface', 'foo');
  }

  @override
  UsesChainedInterface rebuild(
          void Function(UsesChainedInterfaceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesChainedInterfaceBuilder toBuilder() =>
      new UsesChainedInterfaceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsesChainedInterface &&
        bar == other.bar &&
        foo == other.foo;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, bar.hashCode), foo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsesChainedInterface')
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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsesChainedInterface;
  }

  @override
  void update(void Function(UsesChainedInterfaceBuilder) updates) {
    updates(this);
  }

  @override
  _$UsesChainedInterface build() {
    final _$result = _$v ??
        new _$UsesChainedInterface._(
            bar: BuiltValueNullFieldError.checkNotNull(
                bar, 'UsesChainedInterface', 'bar'),
            foo: BuiltValueNullFieldError.checkNotNull(
                foo, 'UsesChainedInterface', 'foo'));
    replace(_$result);
    return _$result;
  }
}

class _$UsesHandCoded extends UsesHandCoded {
  @override
  final int fieldInBaseBuilder;

  factory _$UsesHandCoded(
          [void Function(UsesHandCodedBuilder) updates = emptyUpdate]) =>
      (new UsesHandCodedBuilder()..update(updates)).build();

  _$UsesHandCoded._({required this.fieldInBaseBuilder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fieldInBaseBuilder, 'UsesHandCoded', 'fieldInBaseBuilder');
  }

  @override
  UsesHandCoded rebuild(void Function(UsesHandCodedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesHandCodedBuilder toBuilder() => new UsesHandCodedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsesHandCoded &&
        fieldInBaseBuilder == other.fieldInBaseBuilder;
  }

  @override
  int get hashCode {
    return $jf($jc(0, fieldInBaseBuilder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsesHandCoded')
          ..add('fieldInBaseBuilder', fieldInBaseBuilder))
        .toString();
  }
}

class UsesHandCodedBuilder
    implements Builder<UsesHandCoded, UsesHandCodedBuilder>, HandCodedBuilder {
  _$UsesHandCoded? _$v;

  int? _fieldInBaseBuilder;
  int? get fieldInBaseBuilder => _$this._fieldInBaseBuilder;
  set fieldInBaseBuilder(int? fieldInBaseBuilder) =>
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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsesHandCoded;
  }

  @override
  void update(void Function(UsesHandCodedBuilder) updates) {
    updates(this);
  }

  @override
  _$UsesHandCoded build() {
    final _$result = _$v ??
        new _$UsesHandCoded._(
            fieldInBaseBuilder: BuiltValueNullFieldError.checkNotNull(
                fieldInBaseBuilder, 'UsesHandCoded', 'fieldInBaseBuilder'));
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
  factory _$ImplementsTwo(
          [void Function(ImplementsTwoBuilder) updates = emptyUpdate]) =>
      (new ImplementsTwoBuilder()..update(updates)).build();

  _$ImplementsTwo._() : super._();

  @override
  ImplementsTwo rebuild(void Function(ImplementsTwoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImplementsTwoBuilder toBuilder() => new ImplementsTwoBuilder()..replace(this);

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
    return newBuiltValueToStringHelper('ImplementsTwo').toString();
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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImplementsTwo;
  }

  @override
  void update(void Function(ImplementsTwoBuilder) updates) {
    updates(this);
  }

  @override
  _$ImplementsTwo build() {
    final _$result = _$v ?? new _$ImplementsTwo._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
