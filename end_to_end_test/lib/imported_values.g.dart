// GENERATED CODE - DO NOT MODIFY BY HAND

part of imported_values;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<ImportedValue> _$importedValueSerializer =
    new _$ImportedValueSerializer();

class _$ImportedValueSerializer implements StructuredSerializer<ImportedValue> {
  @override
  final Iterable<Type> types = const [ImportedValue, _$ImportedValue];
  @override
  final String wireName = 'ImportedValue';

  @override
  Iterable serialize(Serializers serializers, ImportedValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
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
  ImportedValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ImportedValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(prefix.SimpleValue))
              as prefix.SimpleValue);
          break;
        case 'simpleValues':
          result.simpleValues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(prefix.SimpleValue)]))
              as BuiltList);
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

  factory _$ImportedValue([void updates(ImportedValueBuilder b)]) =>
      (new ImportedValueBuilder()..update(updates)).build();

  _$ImportedValue._({this.simpleValue, this.simpleValues}) : super._() {
    if (simpleValue == null)
      throw new BuiltValueNullFieldError('ImportedValue', 'simpleValue');
    if (simpleValues == null)
      throw new BuiltValueNullFieldError('ImportedValue', 'simpleValues');
  }

  @override
  ImportedValue rebuild(void updates(ImportedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ImportedValueBuilder toBuilder() => new ImportedValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ImportedValue) return false;
    return simpleValue == other.simpleValue &&
        simpleValues == other.simpleValues;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), simpleValues.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImportedValue')
          ..add('simpleValue', simpleValue)
          ..add('simpleValues', simpleValues))
        .toString();
  }
}

class ImportedValueBuilder
    implements Builder<ImportedValue, ImportedValueBuilder> {
  _$ImportedValue _$v;

  prefix.SimpleValueBuilder _simpleValue;
  prefix.SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new prefix.SimpleValueBuilder();
  set simpleValue(prefix.SimpleValueBuilder simpleValue) =>
      _$this._simpleValue = simpleValue;

  ListBuilder<prefix.SimpleValue> _simpleValues;
  ListBuilder<prefix.SimpleValue> get simpleValues =>
      _$this._simpleValues ??= new ListBuilder<prefix.SimpleValue>();
  set simpleValues(ListBuilder<prefix.SimpleValue> simpleValues) =>
      _$this._simpleValues = simpleValues;

  ImportedValueBuilder();

  ImportedValueBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue?.toBuilder();
      _simpleValues = _$v.simpleValues?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportedValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ImportedValue;
  }

  @override
  void update(void updates(ImportedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ImportedValue build() {
    _$ImportedValue _$result;
    try {
      _$result = _$v ??
          new _$ImportedValue._(
              simpleValue: simpleValue.build(),
              simpleValues: simpleValues.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
        _$failedField = 'simpleValues';
        simpleValues.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ImportedValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
