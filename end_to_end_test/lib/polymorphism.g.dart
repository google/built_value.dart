// GENERATED CODE - DO NOT MODIFY BY HAND

part of polymorphism;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

Serializer<Cat> _$catSerializer = new _$CatSerializer();
Serializer<Fish> _$fishSerializer = new _$FishSerializer();
Serializer<HasString> _$hasStringSerializer = new _$HasStringSerializer();
Serializer<HasDouble> _$hasDoubleSerializer = new _$HasDoubleSerializer();

class _$CatSerializer implements StructuredSerializer<Cat> {
  @override
  final Iterable<Type> types = const [Cat, _$Cat];
  @override
  final String wireName = 'Cat';

  @override
  Iterable serialize(Serializers serializers, Cat object,
      {FullType specifiedType: FullType.unspecified}) {
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
      {FullType specifiedType: FullType.unspecified}) {
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
      {FullType specifiedType: FullType.unspecified}) {
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
      {FullType specifiedType: FullType.unspecified}) {
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

class _$HasStringSerializer implements StructuredSerializer<HasString> {
  @override
  final Iterable<Type> types = const [HasString, _$HasString];
  @override
  final String wireName = 'HasString';

  @override
  Iterable serialize(Serializers serializers, HasString object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HasString deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new HasStringBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
  Iterable serialize(Serializers serializers, HasDouble object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  HasDouble deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new HasDoubleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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

// ignore_for_file: annotate_overrides
abstract class AnimalBuilder implements Builder<Animal, AnimalBuilder> {
  int get legs;
  set legs(int legs);
}

// ignore_for_file: annotate_overrides
class _$Cat extends Cat {
  @override
  final bool tail;
  @override
  final int legs;

  factory _$Cat([void updates(CatBuilder b)]) =>
      (new CatBuilder()..update(updates)).build();

  _$Cat._({this.tail, this.legs}) : super._() {
    if (tail == null) throw new ArgumentError.notNull('tail');
    if (legs == null) throw new ArgumentError.notNull('legs');
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
    return tail == other.tail && legs == other.legs;
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
    final _$result = _$v ?? new _$Cat._(tail: tail, legs: legs);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: annotate_overrides
class _$Fish extends Fish {
  @override
  final int fins;
  @override
  final int legs;

  factory _$Fish([void updates(FishBuilder b)]) =>
      (new FishBuilder()..update(updates)).build();

  _$Fish._({this.fins, this.legs}) : super._() {
    if (fins == null) throw new ArgumentError.notNull('fins');
    if (legs == null) throw new ArgumentError.notNull('legs');
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
    return fins == other.fins && legs == other.legs;
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
    final _$result = _$v ?? new _$Fish._(fins: fins, legs: legs);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: annotate_overrides
abstract class HasFieldBuilder<T>
    implements Builder<HasField<T>, HasFieldBuilder<T>> {
  T get field;
  set field(T field);
}

// ignore_for_file: annotate_overrides
class _$HasString extends HasString {
  @override
  final String field;

  factory _$HasString([void updates(HasStringBuilder b)]) =>
      (new HasStringBuilder()..update(updates)).build();

  _$HasString._({this.field}) : super._() {
    if (field == null) throw new ArgumentError.notNull('field');
  }

  @override
  HasString rebuild(void updates(HasStringBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  HasStringBuilder toBuilder() => new HasStringBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! HasString) return false;
    return field == other.field;
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
  _$HasString _$v;

  String _field;
  String get field => _$this._field;
  set field(String field) => _$this._field = field;

  HasStringBuilder();

  HasStringBuilder get _$this {
    if (_$v != null) {
      _field = _$v.field;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HasString other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$HasString;
  }

  @override
  void update(void updates(HasStringBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$HasString build() {
    final _$result = _$v ?? new _$HasString._(field: field);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: annotate_overrides
class _$HasDouble extends HasDouble {
  @override
  final double field;

  factory _$HasDouble([void updates(HasDoubleBuilder b)]) =>
      (new HasDoubleBuilder()..update(updates)).build();

  _$HasDouble._({this.field}) : super._() {
    if (field == null) throw new ArgumentError.notNull('field');
  }

  @override
  HasDouble rebuild(void updates(HasDoubleBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  HasDoubleBuilder toBuilder() => new HasDoubleBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! HasDouble) return false;
    return field == other.field;
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
  _$HasDouble _$v;

  double _field;
  double get field => _$this._field;
  set field(double field) => _$this._field = field;

  HasDoubleBuilder();

  HasDoubleBuilder get _$this {
    if (_$v != null) {
      _field = _$v.field;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HasDouble other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$HasDouble;
  }

  @override
  void update(void updates(HasDoubleBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$HasDouble build() {
    final _$result = _$v ?? new _$HasDouble._(field: field);
    replace(_$result);
    return _$result;
  }
}
