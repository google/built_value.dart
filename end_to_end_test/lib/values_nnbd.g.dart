// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'values_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
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
  Iterable<Object> serialize(Serializers serializers, SimpleValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.aString;
    if (value != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.$mustBeEscaped;
    if (value != null) {
      result
        ..add('\$mustBeEscaped')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SimpleValue deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SimpleValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case '\$mustBeEscaped':
          result.$mustBeEscaped = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
  Iterable<Object> serialize(Serializers serializers, CompoundValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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
  Iterable<Object> serialize(Serializers serializers, ValidatedValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.aString;
    if (value != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ValidatedValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValidatedValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final String? aString;
  @override
  final bool? $mustBeEscaped;

  factory _$SimpleValue(
          [void Function(SimpleValueBuilder) updates = emptyUpdate]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({required this.anInt, this.aString, this.$mustBeEscaped})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, 'SimpleValue', 'anInt');
  }

  @override
  SimpleValue rebuild(void Function(SimpleValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValue &&
        anInt == other.anInt &&
        aString == other.aString &&
        $mustBeEscaped == other.$mustBeEscaped;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, anInt.hashCode), aString.hashCode),
        $mustBeEscaped.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('\$mustBeEscaped', $mustBeEscaped))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  bool? _$mustBeEscaped;
  bool? get $mustBeEscaped => _$this._$mustBeEscaped;
  set $mustBeEscaped(bool? $mustBeEscaped) =>
      _$this._$mustBeEscaped = $mustBeEscaped;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$mustBeEscaped = $v.$mustBeEscaped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void Function(SimpleValueBuilder) updates) {
    updates(this);
  }

  @override
  _$SimpleValue build() {
    final _$result = _$v ??
        new _$SimpleValue._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, 'SimpleValue', 'anInt'),
            aString: aString,
            $mustBeEscaped: $mustBeEscaped);
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValue extends CompoundValue {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValue(
          [void Function(CompoundValueBuilder) updates = emptyUpdate]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, 'CompoundValue', 'simpleValue');
  }

  @override
  CompoundValue rebuild(void Function(CompoundValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValue &&
        simpleValue == other.simpleValue &&
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
  _$CompoundValue? _$v;

  SimpleValueBuilder? _simpleValue;
  SimpleValueBuilder? get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValueBuilder? _validatedValue;
  ValidatedValueBuilder? get validatedValue =>
      _$this._validatedValue ??= new ValidatedValueBuilder();
  set validatedValue(ValidatedValueBuilder? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueBuilder();

  CompoundValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue?.toBuilder();
      _validatedValue = $v.validatedValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValue;
  }

  @override
  void update(void Function(CompoundValueBuilder) updates) {
    updates(this);
  }

  @override
  _$CompoundValue build() {
    _$CompoundValue _$result;
    try {
      _$result = _$v ??
          new _$CompoundValue._(
              simpleValue: simpleValue.build(),
              validatedValue: _validatedValue?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
        _$failedField = 'validatedValue';
        _validatedValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ValidatedValue extends ValidatedValue {
  @override
  final int anInt;
  @override
  final String? aString;

  factory _$ValidatedValue(
          [void Function(ValidatedValueBuilder) updates = emptyUpdate]) =>
      (new ValidatedValueBuilder()..update(updates)).build();

  _$ValidatedValue._({required this.anInt, this.aString}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, 'ValidatedValue', 'anInt');
  }

  @override
  ValidatedValue rebuild(void Function(ValidatedValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidatedValueBuilder toBuilder() =>
      new ValidatedValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidatedValue &&
        anInt == other.anInt &&
        aString == other.aString;
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
  _$ValidatedValue? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  ValidatedValueBuilder();

  ValidatedValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidatedValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValidatedValue;
  }

  @override
  void update(void Function(ValidatedValueBuilder) updates) {
    updates(this);
  }

  @override
  _$ValidatedValue build() {
    final _$result = _$v ??
        new _$ValidatedValue._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, 'ValidatedValue', 'anInt'),
            aString: aString);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
