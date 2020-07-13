// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'values_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SimpleValue> _$simpleValueSerializer = new _$SimpleValueSerializer();
Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();
Serializer<CompoundValueNoNesting> _$compoundValueNoNestingSerializer =
    new _$CompoundValueNoNestingSerializer();
Serializer<CompoundValueNoAutoNesting> _$compoundValueNoAutoNestingSerializer =
    new _$CompoundValueNoAutoNestingSerializer();
Serializer<CompoundValueComparableBuilders>
    _$compoundValueComparableBuildersSerializer =
    new _$CompoundValueComparableBuildersSerializer();
Serializer<CompoundValueExplicitNoNesting>
    _$compoundValueExplicitNoNestingSerializer =
    new _$CompoundValueExplicitNoNestingSerializer();
Serializer<ValidatedValue> _$validatedValueSerializer =
    new _$ValidatedValueSerializer();
Serializer<NoFieldsValue> _$noFieldsValueSerializer =
    new _$NoFieldsValueSerializer();

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

class _$CompoundValueNoNestingSerializer
    implements StructuredSerializer<CompoundValueNoNesting> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNoNesting,
    _$CompoundValueNoNesting
  ];
  @override
  final String wireName = 'CompoundValueNoNesting';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueNoNesting object,
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
  CompoundValueNoNesting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue;
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueNoAutoNestingSerializer
    implements StructuredSerializer<CompoundValueNoAutoNesting> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNoAutoNesting,
    _$CompoundValueNoAutoNesting
  ];
  @override
  final String wireName = 'CompoundValueNoAutoNesting';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueNoAutoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(NoFieldsValue)),
    ];

    return result;
  }

  @override
  CompoundValueNoAutoNesting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoAutoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'value':
          result.value = (serializers.deserialize(value,
                      specifiedType: const FullType(NoFieldsValue))
                  as NoFieldsValue)
              .toBuilder();
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueComparableBuildersSerializer
    implements StructuredSerializer<CompoundValueComparableBuilders> {
  @override
  final Iterable<Type> types = const [
    CompoundValueComparableBuilders,
    _$CompoundValueComparableBuilders
  ];
  @override
  final String wireName = 'CompoundValueComparableBuilders';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueComparableBuilders object,
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
  CompoundValueComparableBuilders deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueComparableBuildersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue;
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueExplicitNoNestingSerializer
    implements StructuredSerializer<CompoundValueExplicitNoNesting> {
  @override
  final Iterable<Type> types = const [
    CompoundValueExplicitNoNesting,
    _$CompoundValueExplicitNoNesting
  ];
  @override
  final String wireName = 'CompoundValueExplicitNoNesting';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueExplicitNoNesting object,
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
  CompoundValueExplicitNoNesting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueExplicitNoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = (serializers.deserialize(value,
                  specifiedType: const FullType(SimpleValue)) as SimpleValue)
              .toBuilder();
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue;
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

class _$NoFieldsValueSerializer implements StructuredSerializer<NoFieldsValue> {
  @override
  final Iterable<Type> types = const [NoFieldsValue, _$NoFieldsValue];
  @override
  final String wireName = 'NoFieldsValue';

  @override
  Iterable<Object> serialize(Serializers serializers, NoFieldsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  NoFieldsValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new NoFieldsValueBuilder().build();
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
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValueBuilder? _validatedValue;
  ValidatedValueBuilder get validatedValue =>
      _$this._validatedValue ??= new ValidatedValueBuilder();
  set validatedValue(ValidatedValueBuilder? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueBuilder();

  CompoundValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue.toBuilder();
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
      late String _$failedField;
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

class _$CompoundValueNoNesting extends CompoundValueNoNesting {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValueNoNesting(
          [void Function(CompoundValueNoNestingBuilder) updates =
              emptyUpdate]) =>
      (new CompoundValueNoNestingBuilder()..update(updates)).build();

  _$CompoundValueNoNesting._({required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, 'CompoundValueNoNesting', 'simpleValue');
  }

  @override
  CompoundValueNoNesting rebuild(
          void Function(CompoundValueNoNestingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNoNestingBuilder toBuilder() =>
      new CompoundValueNoNestingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNoNesting &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompoundValueNoNesting')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueNoNestingBuilder
    implements Builder<CompoundValueNoNesting, CompoundValueNoNestingBuilder> {
  _$CompoundValueNoNesting? _$v;

  SimpleValue? _simpleValue;
  SimpleValue? get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValue? _validatedValue;
  ValidatedValue? get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueNoNestingBuilder();

  CompoundValueNoNestingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue;
      _validatedValue = $v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoNesting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNoNesting;
  }

  @override
  void update(void Function(CompoundValueNoNestingBuilder) updates) {
    updates(this);
  }

  @override
  _$CompoundValueNoNesting build() {
    final _$result = _$v ??
        new _$CompoundValueNoNesting._(
            simpleValue: BuiltValueNullFieldError.checkNotNull(
                simpleValue, 'CompoundValueNoNesting', 'simpleValue'),
            validatedValue: validatedValue);
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueNoAutoNesting extends CompoundValueNoAutoNesting {
  @override
  final NoFieldsValue value;

  factory _$CompoundValueNoAutoNesting(
          [void Function(CompoundValueNoAutoNestingBuilder) updates =
              emptyUpdate]) =>
      (new CompoundValueNoAutoNestingBuilder()..update(updates)).build();

  _$CompoundValueNoAutoNesting._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, 'CompoundValueNoAutoNesting', 'value');
  }

  @override
  CompoundValueNoAutoNesting rebuild(
          void Function(CompoundValueNoAutoNestingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNoAutoNestingBuilder toBuilder() =>
      new CompoundValueNoAutoNestingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNoAutoNesting && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompoundValueNoAutoNesting')
          ..add('value', value))
        .toString();
  }
}

class CompoundValueNoAutoNestingBuilder
    implements
        Builder<CompoundValueNoAutoNesting, CompoundValueNoAutoNestingBuilder> {
  _$CompoundValueNoAutoNesting? _$v;

  NoFieldsValueBuilder? _value;
  NoFieldsValueBuilder? get value => _$this._value;
  set value(NoFieldsValueBuilder? value) => _$this._value = value;

  CompoundValueNoAutoNestingBuilder();

  CompoundValueNoAutoNestingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoAutoNesting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNoAutoNesting;
  }

  @override
  void update(void Function(CompoundValueNoAutoNestingBuilder) updates) {
    updates(this);
  }

  @override
  _$CompoundValueNoAutoNesting build() {
    _$CompoundValueNoAutoNesting _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueNoAutoNesting._(
              value: BuiltValueNullFieldError.checkNotNull(
                  _value?.build(), 'CompoundValueNoAutoNesting', 'value'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        _value?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValueNoAutoNesting', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueComparableBuilders
    extends CompoundValueComparableBuilders {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValueComparableBuilders(
          [void Function(CompoundValueComparableBuildersBuilder) updates =
              emptyUpdate]) =>
      (new CompoundValueComparableBuildersBuilder()..update(updates)).build();

  _$CompoundValueComparableBuilders._(
      {required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, 'CompoundValueComparableBuilders', 'simpleValue');
  }

  @override
  CompoundValueComparableBuilders rebuild(
          void Function(CompoundValueComparableBuildersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueComparableBuildersBuilder toBuilder() =>
      new CompoundValueComparableBuildersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueComparableBuilders &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompoundValueComparableBuilders')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueComparableBuildersBuilder
    implements
        Builder<CompoundValueComparableBuilders,
            CompoundValueComparableBuildersBuilder> {
  _$CompoundValueComparableBuilders? _$v;

  SimpleValue? _simpleValue;
  SimpleValue? get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValue? _validatedValue;
  ValidatedValue? get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueComparableBuildersBuilder();

  CompoundValueComparableBuildersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue;
      _validatedValue = $v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueComparableBuilders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueComparableBuilders;
  }

  @override
  void update(void Function(CompoundValueComparableBuildersBuilder) updates) {
    updates(this);
  }

  @override
  _$CompoundValueComparableBuilders build() {
    final _$result = _$v ??
        new _$CompoundValueComparableBuilders._(
            simpleValue: BuiltValueNullFieldError.checkNotNull(
                simpleValue, 'CompoundValueComparableBuilders', 'simpleValue'),
            validatedValue: validatedValue);
    replace(_$result);
    return _$result;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueComparableBuildersBuilder &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(1, simpleValue.hashCode), validatedValue.hashCode));
  }
}

class _$CompoundValueExplicitNoNesting extends CompoundValueExplicitNoNesting {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValueExplicitNoNesting(
          [void Function(CompoundValueExplicitNoNestingBuilder) updates =
              emptyUpdate]) =>
      (new CompoundValueExplicitNoNestingBuilder()..update(updates)).build()
          as _$CompoundValueExplicitNoNesting;

  _$CompoundValueExplicitNoNesting._(
      {required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, 'CompoundValueExplicitNoNesting', 'simpleValue');
  }

  @override
  CompoundValueExplicitNoNesting rebuild(
          void Function(CompoundValueExplicitNoNestingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$CompoundValueExplicitNoNestingBuilder toBuilder() =>
      new _$CompoundValueExplicitNoNestingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueExplicitNoNesting &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompoundValueExplicitNoNesting')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class _$CompoundValueExplicitNoNestingBuilder
    extends CompoundValueExplicitNoNestingBuilder {
  _$CompoundValueExplicitNoNesting? _$v;

  @override
  SimpleValueBuilder get simpleValue {
    _$this;
    return super.simpleValue;
  }

  @override
  set simpleValue(SimpleValueBuilder simpleValue) {
    _$this;
    super.simpleValue = simpleValue;
  }

  @override
  ValidatedValue? get validatedValue {
    _$this;
    return super.validatedValue;
  }

  @override
  set validatedValue(ValidatedValue? validatedValue) {
    _$this;
    super.validatedValue = validatedValue;
  }

  _$CompoundValueExplicitNoNestingBuilder() : super._();

  CompoundValueExplicitNoNestingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.simpleValue = $v.simpleValue.toBuilder();
      super.validatedValue = $v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueExplicitNoNesting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueExplicitNoNesting;
  }

  @override
  void update(void Function(CompoundValueExplicitNoNestingBuilder) updates) {
    updates(this);
  }

  @override
  _$CompoundValueExplicitNoNesting build() {
    _$CompoundValueExplicitNoNesting _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueExplicitNoNesting._(
              simpleValue: simpleValue.build(), validatedValue: validatedValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValueExplicitNoNesting', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ExplicitNestedList extends ExplicitNestedList {
  @override
  final BuiltList<BuiltList<int>> nestedList;

  factory _$ExplicitNestedList(
          [void Function(ExplicitNestedListBuilder) updates = emptyUpdate]) =>
      (new ExplicitNestedListBuilder()..update(updates)).build()
          as _$ExplicitNestedList;

  _$ExplicitNestedList._({required this.nestedList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nestedList, 'ExplicitNestedList', 'nestedList');
  }

  @override
  ExplicitNestedList rebuild(
          void Function(ExplicitNestedListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ExplicitNestedListBuilder toBuilder() =>
      new _$ExplicitNestedListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExplicitNestedList && nestedList == other.nestedList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, nestedList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExplicitNestedList')
          ..add('nestedList', nestedList))
        .toString();
  }
}

class _$ExplicitNestedListBuilder extends ExplicitNestedListBuilder {
  _$ExplicitNestedList? _$v;

  @override
  ListBuilder<BuiltList<int>> get nestedList {
    _$this;
    return super.nestedList;
  }

  @override
  set nestedList(ListBuilder<BuiltList<int>> nestedList) {
    _$this;
    super.nestedList = nestedList;
  }

  _$ExplicitNestedListBuilder() : super._();

  ExplicitNestedListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.nestedList = $v.nestedList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplicitNestedList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExplicitNestedList;
  }

  @override
  void update(void Function(ExplicitNestedListBuilder) updates) {
    updates(this);
  }

  @override
  _$ExplicitNestedList build() {
    _$ExplicitNestedList _$result;
    try {
      _$result =
          _$v ?? new _$ExplicitNestedList._(nestedList: nestedList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nestedList';
        nestedList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ExplicitNestedList', _$failedField, e.toString());
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

class _$NoFieldsValue extends NoFieldsValue {
  factory _$NoFieldsValue(
          [void Function(NoFieldsValueBuilder) updates = emptyUpdate]) =>
      (new NoFieldsValueBuilder()..update(updates)).build();

  _$NoFieldsValue._() : super._();

  @override
  NoFieldsValue rebuild(void Function(NoFieldsValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoFieldsValueBuilder toBuilder() => new NoFieldsValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoFieldsValue;
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
  _$NoFieldsValue? _$v;

  NoFieldsValueBuilder();

  @override
  void replace(NoFieldsValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NoFieldsValue;
  }

  @override
  void update(void Function(NoFieldsValueBuilder) updates) {
    updates(this);
  }

  @override
  _$NoFieldsValue build() {
    final _$result = _$v ?? new _$NoFieldsValue._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
