// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'imported_values.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImportedValue> _$importedValueSerializer =
    _$ImportedValueSerializer();
Serializer<ImportedCustomValue> _$importedCustomValueSerializer =
    _$ImportedCustomValueSerializer();
Serializer<ImportedCustomNestedValue> _$importedCustomNestedValueSerializer =
    _$ImportedCustomNestedValueSerializer();

class _$ImportedValueSerializer implements StructuredSerializer<ImportedValue> {
  @override
  final Iterable<Type> types = const [ImportedValue, _$ImportedValue];
  @override
  final String wireName = 'ImportedValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, ImportedValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(prefix.SimpleValue)),
      'simpleValues',
      serializers.serialize(object.simpleValues,
          specifiedType: const FullType(
              BuiltList, const [const FullType(prefix.SimpleValue)])),
    ];

    return result;
  }

  @override
  ImportedValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ImportedValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(prefix.SimpleValue))!
              as prefix.SimpleValue);
          break;
        case 'simpleValues':
          result.simpleValues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(prefix.SimpleValue)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ImportedCustomValueSerializer
    implements StructuredSerializer<ImportedCustomValue> {
  @override
  final Iterable<Type> types = const [
    ImportedCustomValue,
    _$ImportedCustomValue
  ];
  @override
  final String wireName = 'ImportedCustomValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ImportedCustomValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(prefix.SimpleValue)),
      'simpleValues',
      serializers.serialize(object.simpleValues,
          specifiedType: const FullType(
              BuiltList, const [const FullType(prefix.SimpleValue)])),
    ];

    return result;
  }

  @override
  ImportedCustomValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ImportedCustomValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
                  specifiedType: const FullType(prefix.SimpleValue))!
              as prefix.SimpleValue;
          break;
        case 'simpleValues':
          result.simpleValues = serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(prefix.SimpleValue)]))!
              as BuiltList<prefix.SimpleValue>;
          break;
      }
    }

    return result.build();
  }
}

class _$ImportedCustomNestedValueSerializer
    implements StructuredSerializer<ImportedCustomNestedValue> {
  @override
  final Iterable<Type> types = const [
    ImportedCustomNestedValue,
    _$ImportedCustomNestedValue
  ];
  @override
  final String wireName = 'ImportedCustomNestedValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ImportedCustomNestedValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(prefix.SimpleValue)),
      'simpleValues',
      serializers.serialize(object.simpleValues,
          specifiedType: const FullType(
              BuiltList, const [const FullType(prefix.SimpleValue)])),
    ];

    return result;
  }

  @override
  ImportedCustomNestedValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ImportedCustomNestedValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(prefix.SimpleValue))!
              as prefix.SimpleValue);
          break;
        case 'simpleValues':
          result.simpleValues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(prefix.SimpleValue)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ImportedValue extends ImportedValue {
  @override
  final prefix.SimpleValue simpleValue;
  @override
  final BuiltList<prefix.SimpleValue> simpleValues;

  factory _$ImportedValue([void Function(ImportedValueBuilder)? updates]) =>
      (ImportedValueBuilder()..update(updates))._build();

  _$ImportedValue._({required this.simpleValue, required this.simpleValues})
      : super._();
  @override
  ImportedValue rebuild(void Function(ImportedValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImportedValueBuilder toBuilder() => ImportedValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportedValue &&
        simpleValue == other.simpleValue &&
        simpleValues == other.simpleValues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, simpleValue.hashCode);
    _$hash = $jc(_$hash, simpleValues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImportedValue')
          ..add('simpleValue', simpleValue)
          ..add('simpleValues', simpleValues))
        .toString();
  }
}

class ImportedValueBuilder
    implements Builder<ImportedValue, ImportedValueBuilder> {
  _$ImportedValue? _$v;

  prefix.SimpleValueBuilder? _simpleValue;
  prefix.SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= prefix.SimpleValueBuilder();
  set simpleValue(prefix.SimpleValueBuilder? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ListBuilder<prefix.SimpleValue>? _simpleValues;
  ListBuilder<prefix.SimpleValue> get simpleValues =>
      _$this._simpleValues ??= ListBuilder<prefix.SimpleValue>();
  set simpleValues(ListBuilder<prefix.SimpleValue>? simpleValues) =>
      _$this._simpleValues = simpleValues;

  ImportedValueBuilder();

  ImportedValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue.toBuilder();
      _simpleValues = $v.simpleValues.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportedValue other) {
    _$v = other as _$ImportedValue;
  }

  @override
  void update(void Function(ImportedValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImportedValue build() => _build();

  _$ImportedValue _build() {
    _$ImportedValue _$result;
    try {
      _$result = _$v ??
          _$ImportedValue._(
            simpleValue: simpleValue.build(),
            simpleValues: simpleValues.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
        _$failedField = 'simpleValues';
        simpleValues.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ImportedValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ImportedCustomValue extends ImportedCustomValue {
  @override
  final prefix.SimpleValue simpleValue;
  @override
  final BuiltList<prefix.SimpleValue> simpleValues;

  factory _$ImportedCustomValue(
          [void Function(ImportedCustomValueBuilder)? updates]) =>
      (ImportedCustomValueBuilder()..update(updates)).build()
          as _$ImportedCustomValue;

  _$ImportedCustomValue._(
      {required this.simpleValue, required this.simpleValues})
      : super._();
  @override
  ImportedCustomValue rebuild(
          void Function(ImportedCustomValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ImportedCustomValueBuilder toBuilder() =>
      _$ImportedCustomValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportedCustomValue &&
        simpleValue == other.simpleValue &&
        simpleValues == other.simpleValues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, simpleValue.hashCode);
    _$hash = $jc(_$hash, simpleValues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImportedCustomValue')
          ..add('simpleValue', simpleValue)
          ..add('simpleValues', simpleValues))
        .toString();
  }
}

class _$ImportedCustomValueBuilder extends ImportedCustomValueBuilder {
  _$ImportedCustomValue? _$v;

  @override
  prefix.SimpleValue? get simpleValue {
    _$this;
    return super.simpleValue;
  }

  @override
  set simpleValue(prefix.SimpleValue? simpleValue) {
    _$this;
    super.simpleValue = simpleValue;
  }

  @override
  BuiltList<prefix.SimpleValue>? get simpleValues {
    _$this;
    return super.simpleValues;
  }

  @override
  set simpleValues(BuiltList<prefix.SimpleValue>? simpleValues) {
    _$this;
    super.simpleValues = simpleValues;
  }

  _$ImportedCustomValueBuilder() : super._();

  ImportedCustomValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.simpleValue = $v.simpleValue;
      super.simpleValues = $v.simpleValues;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportedCustomValue other) {
    _$v = other as _$ImportedCustomValue;
  }

  @override
  void update(void Function(ImportedCustomValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImportedCustomValue build() => _build();

  _$ImportedCustomValue _build() {
    final _$result = _$v ??
        _$ImportedCustomValue._(
          simpleValue: BuiltValueNullFieldError.checkNotNull(
              simpleValue, r'ImportedCustomValue', 'simpleValue'),
          simpleValues: BuiltValueNullFieldError.checkNotNull(
              simpleValues, r'ImportedCustomValue', 'simpleValues'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ImportedCustomNestedValue extends ImportedCustomNestedValue {
  @override
  final prefix.SimpleValue simpleValue;
  @override
  final BuiltList<prefix.SimpleValue> simpleValues;

  factory _$ImportedCustomNestedValue(
          [void Function(ImportedCustomNestedValueBuilder)? updates]) =>
      (ImportedCustomNestedValueBuilder()..update(updates)).build()
          as _$ImportedCustomNestedValue;

  _$ImportedCustomNestedValue._(
      {required this.simpleValue, required this.simpleValues})
      : super._();
  @override
  ImportedCustomNestedValue rebuild(
          void Function(ImportedCustomNestedValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ImportedCustomNestedValueBuilder toBuilder() =>
      _$ImportedCustomNestedValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportedCustomNestedValue &&
        simpleValue == other.simpleValue &&
        simpleValues == other.simpleValues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, simpleValue.hashCode);
    _$hash = $jc(_$hash, simpleValues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImportedCustomNestedValue')
          ..add('simpleValue', simpleValue)
          ..add('simpleValues', simpleValues))
        .toString();
  }
}

class _$ImportedCustomNestedValueBuilder
    extends ImportedCustomNestedValueBuilder {
  _$ImportedCustomNestedValue? _$v;

  @override
  prefix.SimpleValueBuilder get simpleValue {
    _$this;
    return super.simpleValue;
  }

  @override
  set simpleValue(prefix.SimpleValueBuilder simpleValue) {
    _$this;
    super.simpleValue = simpleValue;
  }

  @override
  ListBuilder<prefix.SimpleValue> get simpleValues {
    _$this;
    return super.simpleValues;
  }

  @override
  set simpleValues(ListBuilder<prefix.SimpleValue> simpleValues) {
    _$this;
    super.simpleValues = simpleValues;
  }

  _$ImportedCustomNestedValueBuilder() : super._();

  ImportedCustomNestedValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.simpleValue = $v.simpleValue.toBuilder();
      super.simpleValues = $v.simpleValues.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportedCustomNestedValue other) {
    _$v = other as _$ImportedCustomNestedValue;
  }

  @override
  void update(void Function(ImportedCustomNestedValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImportedCustomNestedValue build() => _build();

  _$ImportedCustomNestedValue _build() {
    _$ImportedCustomNestedValue _$result;
    try {
      _$result = _$v ??
          _$ImportedCustomNestedValue._(
            simpleValue: simpleValue.build(),
            simpleValues: simpleValues.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
        _$failedField = 'simpleValues';
        simpleValues.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ImportedCustomNestedValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
