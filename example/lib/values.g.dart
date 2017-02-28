// GENERATED CODE - DO NOT MODIFY BY HAND

part of values;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library values
// **************************************************************************

Serializer<SimpleValue> _$simpleValueSerializer = new _$SimpleValueSerializer();
Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();
Serializer<ValidatedValue> _$validatedValueSerializer =
    new _$ValidatedValueSerializer();

class _$SimpleValueSerializer implements StructuredSerializer<SimpleValue> {
  @override
  final Iterable<Type> types = const [SimpleValue, _$SimpleValue];
  @override
  final String wireName = 'SimpleValue';

  @override
  Iterable serialize(Serializers serializers, SimpleValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    if (object.aString != null) {
      result.add('aString');
      result.add(serializers.serialize(object.aString,
          specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  SimpleValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new SimpleValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueSerializer implements StructuredSerializer<CompoundValue> {
  @override
  final Iterable<Type> types = const [CompoundValue, _$CompoundValue];
  @override
  final String wireName = 'CompoundValue';

  @override
  Iterable serialize(Serializers serializers, CompoundValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    if (object.validatedValue != null) {
      result.add('validatedValue');
      result.add(serializers.serialize(object.validatedValue,
          specifiedType: const FullType(ValidatedValue)));
    }

    return result;
  }

  @override
  CompoundValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CompoundValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'validatedValue':
          result.validatedValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue);
          break;
      }
    }

    return result.build();
  }
}

class _$ValidatedValueSerializer
    implements StructuredSerializer<ValidatedValue> {
  @override
  final Iterable<Type> types = const [ValidatedValue, _$ValidatedValue];
  @override
  final String wireName = 'ValidatedValue';

  @override
  Iterable serialize(Serializers serializers, ValidatedValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    if (object.aString != null) {
      result.add('aString');
      result.add(serializers.serialize(object.aString,
          specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  ValidatedValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValidatedValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SimpleValue
// **************************************************************************

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$SimpleValue([void updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  SimpleValue rebuild(void updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SimpleValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'SimpleValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void updates(SimpleValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValue build() {
    final result = _$v ?? new _$SimpleValue._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

class _$CompoundValue extends CompoundValue {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue validatedValue;

  factory _$CompoundValue([void updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({this.simpleValue, this.validatedValue}) : super._() {
    if (simpleValue == null) throw new ArgumentError.notNull('simpleValue');
  }

  @override
  CompoundValue rebuild(void updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CompoundValue) return false;
    return simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return 'CompoundValue {'
        'simpleValue=${simpleValue.toString()},\n'
        'validatedValue=${validatedValue.toString()},\n'
        '}';
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  _$CompoundValue _$v;

  SimpleValueBuilder _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValueBuilder _validatedValue;
  ValidatedValueBuilder get validatedValue =>
      _$this._validatedValue ??= new ValidatedValueBuilder();
  set validatedValue(ValidatedValueBuilder validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueBuilder();

  CompoundValueBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue?.toBuilder();
      _validatedValue = _$v.validatedValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$CompoundValue;
  }

  @override
  void update(void updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValue build() {
    final result = _$v ??
        new _$CompoundValue._(
            simpleValue: simpleValue?.build(),
            validatedValue: _validatedValue?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValidatedValue
// **************************************************************************

class _$ValidatedValue extends ValidatedValue {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValidatedValue([void updates(ValidatedValueBuilder b)]) =>
      (new ValidatedValueBuilder()..update(updates)).build();

  _$ValidatedValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  ValidatedValue rebuild(void updates(ValidatedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidatedValueBuilder toBuilder() =>
      new ValidatedValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ValidatedValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'ValidatedValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class ValidatedValueBuilder
    implements Builder<ValidatedValue, ValidatedValueBuilder> {
  _$ValidatedValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  ValidatedValueBuilder();

  ValidatedValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidatedValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ValidatedValue;
  }

  @override
  void update(void updates(ValidatedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValidatedValue build() {
    final result =
        _$v ?? new _$ValidatedValue._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithCode
// **************************************************************************

class _$ValueWithCode extends ValueWithCode {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValueWithCode([void updates(ValueWithCodeBuilder b)]) =>
      (new ValueWithCodeBuilder()..update(updates)).build();

  _$ValueWithCode._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  ValueWithCode rebuild(void updates(ValueWithCodeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithCodeBuilder toBuilder() => new ValueWithCodeBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ValueWithCode) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'ValueWithCode {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class ValueWithCodeBuilder
    implements Builder<ValueWithCode, ValueWithCodeBuilder> {
  _$ValueWithCode _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  ValueWithCodeBuilder();

  ValueWithCodeBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithCode other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ValueWithCode;
  }

  @override
  void update(void updates(ValueWithCodeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithCode build() {
    final result = _$v ?? new _$ValueWithCode._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithDefaults
// **************************************************************************

class _$ValueWithDefaults extends ValueWithDefaults {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValueWithDefaults([void updates(ValueWithDefaultsBuilder b)]) =>
      (new ValueWithDefaultsBuilder()..update(updates)).build()
      as _$ValueWithDefaults;

  _$ValueWithDefaults._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  ValueWithDefaults rebuild(void updates(ValueWithDefaultsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueWithDefaultsBuilder toBuilder() =>
      new _$ValueWithDefaultsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ValueWithDefaults) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'ValueWithDefaults {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class _$ValueWithDefaultsBuilder extends ValueWithDefaultsBuilder {
  _$ValueWithDefaults _$v;

  @override
  int get anInt {
    _$this;
    return super.anInt;
  }

  @override
  set anInt(int anInt) {
    _$this;
    super.anInt = anInt;
  }

  @override
  String get aString {
    _$this;
    return super.aString;
  }

  @override
  set aString(String aString) {
    _$this;
    super.aString = aString;
  }

  _$ValueWithDefaultsBuilder() : super._();

  ValueWithDefaultsBuilder get _$this {
    if (_$v != null) {
      super.anInt = _$v.anInt;
      super.aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithDefaults other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ValueWithDefaults;
  }

  @override
  void update(void updates(ValueWithDefaultsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithDefaults build() {
    final result =
        _$v ?? new _$ValueWithDefaults._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class DerivedValue
// **************************************************************************

class _$DerivedValue extends DerivedValue {
  @override
  final int anInt;
  int __derivedValue;
  Iterable<String> __derivedString;

  factory _$DerivedValue([void updates(DerivedValueBuilder b)]) =>
      (new DerivedValueBuilder()..update(updates)).build();

  _$DerivedValue._({this.anInt}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  int get derivedValue => __derivedValue ??= super.derivedValue;

  @override
  Iterable<String> get derivedString => __derivedString ??= super.derivedString;

  @override
  DerivedValue rebuild(void updates(DerivedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DerivedValueBuilder toBuilder() => new DerivedValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! DerivedValue) return false;
    return anInt == other.anInt;
  }

  @override
  int get hashCode {
    return $jf($jc(0, anInt.hashCode));
  }

  @override
  String toString() {
    return 'DerivedValue {'
        'anInt=${anInt.toString()},\n'
        '}';
  }
}

class DerivedValueBuilder
    implements Builder<DerivedValue, DerivedValueBuilder> {
  _$DerivedValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  DerivedValueBuilder();

  DerivedValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DerivedValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$DerivedValue;
  }

  @override
  void update(void updates(DerivedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DerivedValue build() {
    final result = _$v ?? new _$DerivedValue._(anInt: anInt);
    replace(result);
    return result;
  }
}
