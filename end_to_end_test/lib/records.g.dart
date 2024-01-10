// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SerializableRecordValue> _$serializableRecordValueSerializer =
    new _$SerializableRecordValueSerializer();

class _$SerializableRecordValueSerializer
    implements StructuredSerializer<SerializableRecordValue> {
  @override
  final Iterable<Type> types = const [
    SerializableRecordValue,
    _$SerializableRecordValue
  ];
  @override
  final String wireName = 'SerializableRecordValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SerializableRecordValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.record;
    if (value != null) {
      result
        ..add('record')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(RecordOfIntInt)));
    }
    value = object.intOrList;
    if (value != null) {
      result
        ..add('intOrList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(RecordOfIntOrList)));
    }
    return result;
  }

  @override
  SerializableRecordValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SerializableRecordValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'record':
          result.record = serializers.deserialize(value,
              specifiedType: const FullType(RecordOfIntInt)) as RecordOfIntInt?;
          break;
        case 'intOrList':
          result.intOrList = serializers.deserialize(value,
                  specifiedType: const FullType(RecordOfIntOrList))
              as RecordOfIntOrList?;
          break;
      }
    }

    return result.build();
  }
}

class _$SimpleRecordValue extends SimpleRecordValue {
  @override
  final (int, int) record;

  factory _$SimpleRecordValue(
          [void Function(SimpleRecordValueBuilder)? updates]) =>
      (new SimpleRecordValueBuilder()..update(updates))._build();

  _$SimpleRecordValue._({required this.record}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        record, r'SimpleRecordValue', 'record');
  }

  @override
  SimpleRecordValue rebuild(void Function(SimpleRecordValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleRecordValueBuilder toBuilder() =>
      new SimpleRecordValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is SimpleRecordValue && record == _$dynamicOther.record;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, record.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SimpleRecordValue')
          ..add('record', record))
        .toString();
  }
}

class SimpleRecordValueBuilder
    implements Builder<SimpleRecordValue, SimpleRecordValueBuilder> {
  _$SimpleRecordValue? _$v;

  (int, int)? _record;
  (int, int)? get record => _$this._record;
  set record((int, int)? record) => _$this._record = record;

  SimpleRecordValueBuilder();

  SimpleRecordValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _record = $v.record;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleRecordValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SimpleRecordValue;
  }

  @override
  void update(void Function(SimpleRecordValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SimpleRecordValue build() => _build();

  _$SimpleRecordValue _build() {
    final _$result = _$v ??
        new _$SimpleRecordValue._(
            record: BuiltValueNullFieldError.checkNotNull(
                record, r'SimpleRecordValue', 'record'));
    replace(_$result);
    return _$result;
  }
}

class _$ComplexRecordValue extends ComplexRecordValue {
  @override
  final (int, int) record2;
  @override
  final (int?, int) record2p;
  @override
  final (int, int)? record2n;
  @override
  final (int x, int y) record3;
  @override
  final (int? x, int y) record3p;
  @override
  final (int x, int y)? record3n;
  @override
  final ({int x, int y}) record4;
  @override
  final ({int? x, int y}) record4p;
  @override
  final ({int x, int y})? record4n;
  @override
  final (BuiltList<int> a, {BuiltList<ComplexRecordValue> b}) record5;
  @override
  final (BuiltList<int>? a, {BuiltList<ComplexRecordValue> b}) record5p;
  @override
  final (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? record5n;
  @override
  final (void Function() a, {void Function() b}) record6;
  @override
  final (void Function()? a, {void Function() b}) record6p;
  @override
  final (void Function() a, {void Function() b})? record6n;

  factory _$ComplexRecordValue(
          [void Function(ComplexRecordValueBuilder)? updates]) =>
      (new ComplexRecordValueBuilder()..update(updates))._build();

  _$ComplexRecordValue._(
      {required this.record2,
      required this.record2p,
      this.record2n,
      required this.record3,
      required this.record3p,
      this.record3n,
      required this.record4,
      required this.record4p,
      this.record4n,
      required this.record5,
      required this.record5p,
      this.record5n,
      required this.record6,
      required this.record6p,
      this.record6n})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        record2, r'ComplexRecordValue', 'record2');
    BuiltValueNullFieldError.checkNotNull(
        record2p, r'ComplexRecordValue', 'record2p');
    BuiltValueNullFieldError.checkNotNull(
        record3, r'ComplexRecordValue', 'record3');
    BuiltValueNullFieldError.checkNotNull(
        record3p, r'ComplexRecordValue', 'record3p');
    BuiltValueNullFieldError.checkNotNull(
        record4, r'ComplexRecordValue', 'record4');
    BuiltValueNullFieldError.checkNotNull(
        record4p, r'ComplexRecordValue', 'record4p');
    BuiltValueNullFieldError.checkNotNull(
        record5, r'ComplexRecordValue', 'record5');
    BuiltValueNullFieldError.checkNotNull(
        record5p, r'ComplexRecordValue', 'record5p');
    BuiltValueNullFieldError.checkNotNull(
        record6, r'ComplexRecordValue', 'record6');
    BuiltValueNullFieldError.checkNotNull(
        record6p, r'ComplexRecordValue', 'record6p');
  }

  @override
  ComplexRecordValue rebuild(
          void Function(ComplexRecordValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComplexRecordValueBuilder toBuilder() =>
      new ComplexRecordValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ComplexRecordValue &&
        record2 == _$dynamicOther.record2 &&
        record2p == _$dynamicOther.record2p &&
        record2n == _$dynamicOther.record2n &&
        record3 == _$dynamicOther.record3 &&
        record3p == _$dynamicOther.record3p &&
        record3n == _$dynamicOther.record3n &&
        record4 == _$dynamicOther.record4 &&
        record4p == _$dynamicOther.record4p &&
        record4n == _$dynamicOther.record4n &&
        record5 == _$dynamicOther.record5 &&
        record5p == _$dynamicOther.record5p &&
        record5n == _$dynamicOther.record5n;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, record2.hashCode);
    _$hash = $jc(_$hash, record2p.hashCode);
    _$hash = $jc(_$hash, record2n.hashCode);
    _$hash = $jc(_$hash, record3.hashCode);
    _$hash = $jc(_$hash, record3p.hashCode);
    _$hash = $jc(_$hash, record3n.hashCode);
    _$hash = $jc(_$hash, record4.hashCode);
    _$hash = $jc(_$hash, record4p.hashCode);
    _$hash = $jc(_$hash, record4n.hashCode);
    _$hash = $jc(_$hash, record5.hashCode);
    _$hash = $jc(_$hash, record5p.hashCode);
    _$hash = $jc(_$hash, record5n.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ComplexRecordValue')
          ..add('record2', record2)
          ..add('record2p', record2p)
          ..add('record2n', record2n)
          ..add('record3', record3)
          ..add('record3p', record3p)
          ..add('record3n', record3n)
          ..add('record4', record4)
          ..add('record4p', record4p)
          ..add('record4n', record4n)
          ..add('record5', record5)
          ..add('record5p', record5p)
          ..add('record5n', record5n)
          ..add('record6', record6)
          ..add('record6p', record6p)
          ..add('record6n', record6n))
        .toString();
  }
}

class ComplexRecordValueBuilder
    implements Builder<ComplexRecordValue, ComplexRecordValueBuilder> {
  _$ComplexRecordValue? _$v;

  (int, int)? _record2;
  (int, int)? get record2 => _$this._record2;
  set record2((int, int)? record2) => _$this._record2 = record2;

  (int?, int)? _record2p;
  (int?, int)? get record2p => _$this._record2p;
  set record2p((int?, int)? record2p) => _$this._record2p = record2p;

  (int, int)? _record2n;
  (int, int)? get record2n => _$this._record2n;
  set record2n((int, int)? record2n) => _$this._record2n = record2n;

  (int x, int y)? _record3;
  (int x, int y)? get record3 => _$this._record3;
  set record3((int x, int y)? record3) => _$this._record3 = record3;

  (int? x, int y)? _record3p;
  (int? x, int y)? get record3p => _$this._record3p;
  set record3p((int? x, int y)? record3p) => _$this._record3p = record3p;

  (int x, int y)? _record3n;
  (int x, int y)? get record3n => _$this._record3n;
  set record3n((int x, int y)? record3n) => _$this._record3n = record3n;

  ({int x, int y})? _record4;
  ({int x, int y})? get record4 => _$this._record4;
  set record4(({int x, int y})? record4) => _$this._record4 = record4;

  ({int? x, int y})? _record4p;
  ({int? x, int y})? get record4p => _$this._record4p;
  set record4p(({int? x, int y})? record4p) => _$this._record4p = record4p;

  ({int x, int y})? _record4n;
  ({int x, int y})? get record4n => _$this._record4n;
  set record4n(({int x, int y})? record4n) => _$this._record4n = record4n;

  (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? _record5;
  (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? get record5 =>
      _$this._record5;
  set record5((BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? record5) =>
      _$this._record5 = record5;

  (BuiltList<int>? a, {BuiltList<ComplexRecordValue> b})? _record5p;
  (BuiltList<int>? a, {BuiltList<ComplexRecordValue> b})? get record5p =>
      _$this._record5p;
  set record5p(
          (BuiltList<int>? a, {BuiltList<ComplexRecordValue> b})? record5p) =>
      _$this._record5p = record5p;

  (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? _record5n;
  (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? get record5n =>
      _$this._record5n;
  set record5n(
          (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? record5n) =>
      _$this._record5n = record5n;

  (void Function() a, {void Function() b})? _record6;
  (void Function() a, {void Function() b})? get record6 => _$this._record6;
  set record6((void Function() a, {void Function() b})? record6) =>
      _$this._record6 = record6;

  (void Function()? a, {void Function() b})? _record6p;
  (void Function()? a, {void Function() b})? get record6p => _$this._record6p;
  set record6p((void Function()? a, {void Function() b})? record6p) =>
      _$this._record6p = record6p;

  (void Function() a, {void Function() b})? _record6n;
  (void Function() a, {void Function() b})? get record6n => _$this._record6n;
  set record6n((void Function() a, {void Function() b})? record6n) =>
      _$this._record6n = record6n;

  ComplexRecordValueBuilder();

  ComplexRecordValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _record2 = $v.record2;
      _record2p = $v.record2p;
      _record2n = $v.record2n;
      _record3 = $v.record3;
      _record3p = $v.record3p;
      _record3n = $v.record3n;
      _record4 = $v.record4;
      _record4p = $v.record4p;
      _record4n = $v.record4n;
      _record5 = $v.record5;
      _record5p = $v.record5p;
      _record5n = $v.record5n;
      _record6 = $v.record6;
      _record6p = $v.record6p;
      _record6n = $v.record6n;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComplexRecordValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComplexRecordValue;
  }

  @override
  void update(void Function(ComplexRecordValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ComplexRecordValue build() => _build();

  _$ComplexRecordValue _build() {
    final _$result = _$v ??
        new _$ComplexRecordValue._(
            record2: BuiltValueNullFieldError.checkNotNull(
                record2, r'ComplexRecordValue', 'record2'),
            record2p: BuiltValueNullFieldError.checkNotNull(
                record2p, r'ComplexRecordValue', 'record2p'),
            record2n: record2n,
            record3: BuiltValueNullFieldError.checkNotNull(
                record3, r'ComplexRecordValue', 'record3'),
            record3p: BuiltValueNullFieldError.checkNotNull(
                record3p, r'ComplexRecordValue', 'record3p'),
            record3n: record3n,
            record4: BuiltValueNullFieldError.checkNotNull(
                record4, r'ComplexRecordValue', 'record4'),
            record4p: BuiltValueNullFieldError.checkNotNull(
                record4p, r'ComplexRecordValue', 'record4p'),
            record4n: record4n,
            record5: BuiltValueNullFieldError.checkNotNull(
                record5, r'ComplexRecordValue', 'record5'),
            record5p: BuiltValueNullFieldError.checkNotNull(
                record5p, r'ComplexRecordValue', 'record5p'),
            record5n: record5n,
            record6: BuiltValueNullFieldError.checkNotNull(
                record6, r'ComplexRecordValue', 'record6'),
            record6p: BuiltValueNullFieldError.checkNotNull(record6p, r'ComplexRecordValue', 'record6p'),
            record6n: record6n);
    replace(_$result);
    return _$result;
  }
}

class _$SerializableRecordValue extends SerializableRecordValue {
  @override
  final int value;
  @override
  final RecordOfIntInt? record;
  @override
  final RecordOfIntOrList? intOrList;

  factory _$SerializableRecordValue(
          [void Function(SerializableRecordValueBuilder)? updates]) =>
      (new SerializableRecordValueBuilder()..update(updates))._build();

  _$SerializableRecordValue._(
      {required this.value, this.record, this.intOrList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'SerializableRecordValue', 'value');
  }

  @override
  SerializableRecordValue rebuild(
          void Function(SerializableRecordValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializableRecordValueBuilder toBuilder() =>
      new SerializableRecordValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is SerializableRecordValue &&
        value == other.value &&
        record == _$dynamicOther.record &&
        intOrList == _$dynamicOther.intOrList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, record.hashCode);
    _$hash = $jc(_$hash, intOrList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SerializableRecordValue')
          ..add('value', value)
          ..add('record', record)
          ..add('intOrList', intOrList))
        .toString();
  }
}

class SerializableRecordValueBuilder
    implements
        Builder<SerializableRecordValue, SerializableRecordValueBuilder> {
  _$SerializableRecordValue? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  RecordOfIntInt? _record;
  RecordOfIntInt? get record => _$this._record;
  set record(RecordOfIntInt? record) => _$this._record = record;

  RecordOfIntOrList? _intOrList;
  RecordOfIntOrList? get intOrList => _$this._intOrList;
  set intOrList(RecordOfIntOrList? intOrList) => _$this._intOrList = intOrList;

  SerializableRecordValueBuilder();

  SerializableRecordValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _record = $v.record;
      _intOrList = $v.intOrList;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializableRecordValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SerializableRecordValue;
  }

  @override
  void update(void Function(SerializableRecordValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SerializableRecordValue build() => _build();

  _$SerializableRecordValue _build() {
    final _$result = _$v ??
        new _$SerializableRecordValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'SerializableRecordValue', 'value'),
            record: record,
            intOrList: intOrList);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
