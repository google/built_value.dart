// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.8

part of standard_json;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StandardJsonValue> _$standardJsonValueSerializer =
    new _$StandardJsonValueSerializer();

class _$StandardJsonValueSerializer
    implements StructuredSerializer<StandardJsonValue> {
  @override
  final Iterable<Type> types = const [StandardJsonValue, _$StandardJsonValue];
  @override
  final String wireName = 'StandardJsonValue';

  @override
  Iterable<Object> serialize(Serializers serializers, StandardJsonValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(num)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'keyValues',
      serializers.serialize(object.keyValues,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)])),
      'zoo',
      serializers.serialize(object.zoo,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Animal)])),
      'uniqueZoo',
      serializers.serialize(object.uniqueZoo,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(Animal)])),
    ];
    Object value;
    value = object.strings;
    if (value != null) {
      result
        ..add('strings')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  StandardJsonValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StandardJsonValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'keyValues':
          result.keyValues.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(JsonObject)])));
          break;
        case 'zoo':
          result.zoo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Animal)]))
              as BuiltList<Object>);
          break;
        case 'uniqueZoo':
          result.uniqueZoo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(Animal)]))
              as BuiltSet<Object>);
          break;
        case 'strings':
          result.strings.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$StandardJsonValue extends StandardJsonValue {
  @override
  final num number;
  @override
  final String text;
  @override
  final BuiltMap<String, JsonObject> keyValues;
  @override
  final BuiltList<Animal> zoo;
  @override
  final BuiltSet<Animal> uniqueZoo;
  @override
  final BuiltList<String> strings;

  factory _$StandardJsonValue(
          [void Function(StandardJsonValueBuilder) updates = emptyUpdate]) =>
      (new StandardJsonValueBuilder()..update(updates)).build();

  _$StandardJsonValue._(
      {this.number,
      this.text,
      this.keyValues,
      this.zoo,
      this.uniqueZoo,
      this.strings})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        number, 'StandardJsonValue', 'number');
    BuiltValueNullFieldError.checkNotNull(text, 'StandardJsonValue', 'text');
    BuiltValueNullFieldError.checkNotNull(
        keyValues, 'StandardJsonValue', 'keyValues');
    BuiltValueNullFieldError.checkNotNull(zoo, 'StandardJsonValue', 'zoo');
    BuiltValueNullFieldError.checkNotNull(
        uniqueZoo, 'StandardJsonValue', 'uniqueZoo');
  }

  @override
  StandardJsonValue rebuild(void Function(StandardJsonValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StandardJsonValueBuilder toBuilder() =>
      new StandardJsonValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StandardJsonValue &&
        number == other.number &&
        text == other.text &&
        keyValues == other.keyValues &&
        zoo == other.zoo &&
        uniqueZoo == other.uniqueZoo &&
        strings == other.strings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, number.hashCode), text.hashCode),
                    keyValues.hashCode),
                zoo.hashCode),
            uniqueZoo.hashCode),
        strings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StandardJsonValue')
          ..add('number', number)
          ..add('text', text)
          ..add('keyValues', keyValues)
          ..add('zoo', zoo)
          ..add('uniqueZoo', uniqueZoo)
          ..add('strings', strings))
        .toString();
  }
}

class StandardJsonValueBuilder
    implements Builder<StandardJsonValue, StandardJsonValueBuilder> {
  _$StandardJsonValue _$v;

  num _number;
  num get number => _$this._number;
  set number(num number) => _$this._number = number;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  MapBuilder<String, JsonObject> _keyValues;
  MapBuilder<String, JsonObject> get keyValues =>
      _$this._keyValues ??= new MapBuilder<String, JsonObject>();
  set keyValues(MapBuilder<String, JsonObject> keyValues) =>
      _$this._keyValues = keyValues;

  ListBuilder<Animal> _zoo;
  ListBuilder<Animal> get zoo => _$this._zoo ??= new ListBuilder<Animal>();
  set zoo(ListBuilder<Animal> zoo) => _$this._zoo = zoo;

  SetBuilder<Animal> _uniqueZoo;
  SetBuilder<Animal> get uniqueZoo =>
      _$this._uniqueZoo ??= new SetBuilder<Animal>();
  set uniqueZoo(SetBuilder<Animal> uniqueZoo) => _$this._uniqueZoo = uniqueZoo;

  ListBuilder<String> _strings;
  ListBuilder<String> get strings =>
      _$this._strings ??= new ListBuilder<String>();
  set strings(ListBuilder<String> strings) => _$this._strings = strings;

  StandardJsonValueBuilder();

  StandardJsonValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _number = $v.number;
      _text = $v.text;
      _keyValues = $v.keyValues.toBuilder();
      _zoo = $v.zoo.toBuilder();
      _uniqueZoo = $v.uniqueZoo.toBuilder();
      _strings = $v.strings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StandardJsonValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StandardJsonValue;
  }

  @override
  void update(void Function(StandardJsonValueBuilder) updates) {
    updates(this);
  }

  @override
  _$StandardJsonValue build() {
    _$StandardJsonValue _$result;
    try {
      _$result = _$v ??
          new _$StandardJsonValue._(
              number: BuiltValueNullFieldError.checkNotNull(
                  number, 'StandardJsonValue', 'number'),
              text: BuiltValueNullFieldError.checkNotNull(
                  text, 'StandardJsonValue', 'text'),
              keyValues: keyValues.build(),
              zoo: zoo.build(),
              uniqueZoo: uniqueZoo.build(),
              strings: _strings?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'keyValues';
        keyValues.build();
        _$failedField = 'zoo';
        zoo.build();
        _$failedField = 'uniqueZoo';
        uniqueZoo.build();
        _$failedField = 'strings';
        _strings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StandardJsonValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
