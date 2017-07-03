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
Serializer<ValueUsingImportAs> _$valueUsingImportAsSerializer =
    new _$ValueUsingImportAsSerializer();
Serializer<NoFieldsValue> _$noFieldsValueSerializer =
    new _$NoFieldsValueSerializer();
Serializer<PrimitivesValue> _$primitivesValueSerializer =
    new _$PrimitivesValueSerializer();
Serializer<NamedFactoryValue> _$namedFactoryValueSerializer =
    new _$NamedFactoryValueSerializer();

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
      result
        ..add('aString')
        ..add(serializers.serialize(object.aString,
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
      result
        ..add('validatedValue')
        ..add(serializers.serialize(object.validatedValue,
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
      result
        ..add('aString')
        ..add(serializers.serialize(object.aString,
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

class _$ValueUsingImportAsSerializer
    implements StructuredSerializer<ValueUsingImportAs> {
  @override
  final Iterable<Type> types = const [ValueUsingImportAs, _$ValueUsingImportAs];
  @override
  final String wireName = 'ValueUsingImportAs';

  @override
  Iterable serialize(Serializers serializers, ValueUsingImportAs object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(using_import_as.TestEnum)),
    ];

    return result;
  }

  @override
  ValueUsingImportAs deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueUsingImportAsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
                  specifiedType: const FullType(using_import_as.TestEnum))
              as using_import_as.TestEnum;
          break;
      }
    }

    return result.build();
  }
}

class _$NoFieldsValueSerializer implements StructuredSerializer<NoFieldsValue> {
  @override
  final Iterable<Type> types = const [NoFieldsValue, _$NoFieldsValue];
  @override
  final String wireName = 'NoFieldsValue';

  @override
  Iterable serialize(Serializers serializers, NoFieldsValue object,
      {FullType specifiedType: FullType.unspecified}) {
    return <Object>[];
  }

  @override
  NoFieldsValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return new NoFieldsValueBuilder().build();
  }
}

class _$PrimitivesValueSerializer
    implements StructuredSerializer<PrimitivesValue> {
  @override
  final Iterable<Type> types = const [PrimitivesValue, _$PrimitivesValue];
  @override
  final String wireName = 'PrimitivesValue';

  @override
  Iterable serialize(Serializers serializers, PrimitivesValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'boolean',
      serializers.serialize(object.boolean,
          specifiedType: const FullType(bool)),
      'integer',
      serializers.serialize(object.integer, specifiedType: const FullType(int)),
      'dbl',
      serializers.serialize(object.dbl, specifiedType: const FullType(double)),
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(num)),
      'string',
      serializers.serialize(object.string,
          specifiedType: const FullType(String)),
      'dateTime',
      serializers.serialize(object.dateTime,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  PrimitivesValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new PrimitivesValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'boolean':
          result.boolean = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'integer':
          result.integer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dbl':
          result.dbl = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'string':
          result.string = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dateTime':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$NamedFactoryValueSerializer
    implements StructuredSerializer<NamedFactoryValue> {
  @override
  final Iterable<Type> types = const [NamedFactoryValue, _$NamedFactoryValue];
  @override
  final String wireName = 'NamedFactoryValue';

  @override
  Iterable serialize(Serializers serializers, NamedFactoryValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NamedFactoryValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new NamedFactoryValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

// ignore_for_file: annotate_overrides
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
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
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

// ignore_for_file: annotate_overrides
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
    return (newBuiltValueToStringHelper('CompoundValue')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
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
// Target: abstract class DerivedValue
// **************************************************************************

// ignore_for_file: annotate_overrides
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
    return (newBuiltValueToStringHelper('DerivedValue')..add('anInt', anInt))
        .toString();
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

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithCode
// **************************************************************************

// ignore_for_file: annotate_overrides
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
    return (newBuiltValueToStringHelper('ValueWithCode')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
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

// ignore_for_file: annotate_overrides
class _$ValueWithDefaults extends ValueWithDefaults {
  @override
  final int anInt;
  @override
  final String aString;
  @override
  final SimpleValue value;

  factory _$ValueWithDefaults([void updates(ValueWithDefaultsBuilder b)]) =>
      (new ValueWithDefaultsBuilder()..update(updates)).build()
          as _$ValueWithDefaults;

  _$ValueWithDefaults._({this.anInt, this.aString, this.value}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
    if (value == null) throw new ArgumentError.notNull('value');
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
    return anInt == other.anInt &&
        aString == other.aString &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, anInt.hashCode), aString.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueWithDefaults')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('value', value))
        .toString();
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

  @override
  SimpleValueBuilder get value {
    _$this;
    return super.value ??= new SimpleValueBuilder();
  }

  @override
  set value(SimpleValueBuilder value) {
    _$this;
    super.value = value;
  }

  _$ValueWithDefaultsBuilder() : super._();

  ValueWithDefaultsBuilder get _$this {
    if (_$v != null) {
      super.anInt = _$v.anInt;
      super.aString = _$v.aString;
      super.value = _$v.value?.toBuilder();
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
    final result = _$v ??
        new _$ValueWithDefaults._(
            anInt: anInt, aString: aString, value: value?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValidatedValue
// **************************************************************************

// ignore_for_file: annotate_overrides
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
    return (newBuiltValueToStringHelper('ValidatedValue')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
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
// Target: abstract class ValueUsingImportAs
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$ValueUsingImportAs extends ValueUsingImportAs {
  @override
  final using_import_as.TestEnum value;

  factory _$ValueUsingImportAs([void updates(ValueUsingImportAsBuilder b)]) =>
      (new ValueUsingImportAsBuilder()..update(updates)).build();

  _$ValueUsingImportAs._({this.value}) : super._() {
    if (value == null) throw new ArgumentError.notNull('value');
  }

  @override
  ValueUsingImportAs rebuild(void updates(ValueUsingImportAsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueUsingImportAsBuilder toBuilder() =>
      new ValueUsingImportAsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ValueUsingImportAs) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueUsingImportAs')
          ..add('value', value))
        .toString();
  }
}

class ValueUsingImportAsBuilder
    implements Builder<ValueUsingImportAs, ValueUsingImportAsBuilder> {
  _$ValueUsingImportAs _$v;

  using_import_as.TestEnum _value;
  using_import_as.TestEnum get value => _$this._value;
  set value(using_import_as.TestEnum value) => _$this._value = value;

  ValueUsingImportAsBuilder();

  ValueUsingImportAsBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueUsingImportAs other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ValueUsingImportAs;
  }

  @override
  void update(void updates(ValueUsingImportAsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueUsingImportAs build() {
    final result = _$v ?? new _$ValueUsingImportAs._(value: value);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class NoFieldsValue
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$NoFieldsValue extends NoFieldsValue {
  factory _$NoFieldsValue([void updates(NoFieldsValueBuilder b)]) =>
      (new NoFieldsValueBuilder()..update(updates)).build();

  _$NoFieldsValue._() : super._();

  @override
  NoFieldsValue rebuild(void updates(NoFieldsValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NoFieldsValueBuilder toBuilder() => new NoFieldsValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NoFieldsValue) return false;
    return true;
  }

  @override
  int get hashCode {
    return 601485316;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NoFieldsValue').toString();
  }
}

class NoFieldsValueBuilder
    implements Builder<NoFieldsValue, NoFieldsValueBuilder> {
  _$NoFieldsValue _$v;

  NoFieldsValueBuilder();

  @override
  void replace(NoFieldsValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$NoFieldsValue;
  }

  @override
  void update(void updates(NoFieldsValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NoFieldsValue build() {
    final result = _$v ?? new _$NoFieldsValue._();
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class PrimitivesValue
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$PrimitivesValue extends PrimitivesValue {
  @override
  final bool boolean;
  @override
  final int integer;
  @override
  final double dbl;
  @override
  final num number;
  @override
  final String string;
  @override
  final DateTime dateTime;

  factory _$PrimitivesValue([void updates(PrimitivesValueBuilder b)]) =>
      (new PrimitivesValueBuilder()..update(updates)).build();

  _$PrimitivesValue._(
      {this.boolean,
      this.integer,
      this.dbl,
      this.number,
      this.string,
      this.dateTime})
      : super._() {
    if (boolean == null) throw new ArgumentError.notNull('boolean');
    if (integer == null) throw new ArgumentError.notNull('integer');
    if (dbl == null) throw new ArgumentError.notNull('dbl');
    if (number == null) throw new ArgumentError.notNull('number');
    if (string == null) throw new ArgumentError.notNull('string');
    if (dateTime == null) throw new ArgumentError.notNull('dateTime');
  }

  @override
  PrimitivesValue rebuild(void updates(PrimitivesValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PrimitivesValueBuilder toBuilder() =>
      new PrimitivesValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! PrimitivesValue) return false;
    return boolean == other.boolean &&
        integer == other.integer &&
        dbl == other.dbl &&
        number == other.number &&
        string == other.string &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, boolean.hashCode), integer.hashCode),
                    dbl.hashCode),
                number.hashCode),
            string.hashCode),
        dateTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PrimitivesValue')
          ..add('boolean', boolean)
          ..add('integer', integer)
          ..add('dbl', dbl)
          ..add('number', number)
          ..add('string', string)
          ..add('dateTime', dateTime))
        .toString();
  }
}

class PrimitivesValueBuilder
    implements Builder<PrimitivesValue, PrimitivesValueBuilder> {
  _$PrimitivesValue _$v;

  bool _boolean;
  bool get boolean => _$this._boolean;
  set boolean(bool boolean) => _$this._boolean = boolean;

  int _integer;
  int get integer => _$this._integer;
  set integer(int integer) => _$this._integer = integer;

  double _dbl;
  double get dbl => _$this._dbl;
  set dbl(double dbl) => _$this._dbl = dbl;

  num _number;
  num get number => _$this._number;
  set number(num number) => _$this._number = number;

  String _string;
  String get string => _$this._string;
  set string(String string) => _$this._string = string;

  DateTime _dateTime;
  DateTime get dateTime => _$this._dateTime;
  set dateTime(DateTime dateTime) => _$this._dateTime = dateTime;

  PrimitivesValueBuilder();

  PrimitivesValueBuilder get _$this {
    if (_$v != null) {
      _boolean = _$v.boolean;
      _integer = _$v.integer;
      _dbl = _$v.dbl;
      _number = _$v.number;
      _string = _$v.string;
      _dateTime = _$v.dateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrimitivesValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$PrimitivesValue;
  }

  @override
  void update(void updates(PrimitivesValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PrimitivesValue build() {
    final result = _$v ??
        new _$PrimitivesValue._(
            boolean: boolean,
            integer: integer,
            dbl: dbl,
            number: number,
            string: string,
            dateTime: dateTime);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class NamedFactoryValue
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$NamedFactoryValue extends NamedFactoryValue {
  @override
  final int value;

  factory _$NamedFactoryValue([void updates(NamedFactoryValueBuilder b)]) =>
      (new NamedFactoryValueBuilder()..update(updates)).build();

  _$NamedFactoryValue._({this.value}) : super._() {
    if (value == null) throw new ArgumentError.notNull('value');
  }

  @override
  NamedFactoryValue rebuild(void updates(NamedFactoryValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NamedFactoryValueBuilder toBuilder() =>
      new NamedFactoryValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NamedFactoryValue) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NamedFactoryValue')
          ..add('value', value))
        .toString();
  }
}

class NamedFactoryValueBuilder
    implements Builder<NamedFactoryValue, NamedFactoryValueBuilder> {
  _$NamedFactoryValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  NamedFactoryValueBuilder();

  NamedFactoryValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NamedFactoryValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$NamedFactoryValue;
  }

  @override
  void update(void updates(NamedFactoryValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NamedFactoryValue build() {
    final result = _$v ?? new _$NamedFactoryValue._(value: value);
    replace(result);
    return result;
  }
}
