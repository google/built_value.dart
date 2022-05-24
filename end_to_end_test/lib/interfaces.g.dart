// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.11

part of interfaces;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EnumWithInt _$one = const EnumWithInt._('one');
const EnumWithInt _$two = const EnumWithInt._('two');
const EnumWithInt _$three = const EnumWithInt._('three');

EnumWithInt _$valueOf(String name) {
  switch (name) {
    case 'one':
      return _$one;
    case 'two':
      return _$two;
    case 'three':
      return _$three;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EnumWithInt> _$values =
    new BuiltSet<EnumWithInt>(const <EnumWithInt>[
  _$one,
  _$two,
  _$three,
]);

Serializer<ValueWithInt> _$valueWithIntSerializer =
    new _$ValueWithIntSerializer();
Serializer<EnumWithInt> _$enumWithIntSerializer = new _$EnumWithIntSerializer();
Serializer<ValueWithHasInt> _$valueWithHasIntSerializer =
    new _$ValueWithHasIntSerializer();

class _$ValueWithIntSerializer implements StructuredSerializer<ValueWithInt> {
  @override
  final Iterable<Type> types = const [ValueWithInt, _$ValueWithInt];
  @override
  final String wireName = 'ValueWithInt';

  @override
  Iterable<Object> serialize(Serializers serializers, ValueWithInt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ValueWithInt deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithIntBuilder();

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
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EnumWithIntSerializer implements PrimitiveSerializer<EnumWithInt> {
  @override
  final Iterable<Type> types = const <Type>[EnumWithInt];
  @override
  final String wireName = 'EnumWithInt';

  @override
  Object serialize(Serializers serializers, EnumWithInt object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  EnumWithInt deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EnumWithInt.valueOf(serialized as String);
}

class _$ValueWithHasIntSerializer
    implements StructuredSerializer<ValueWithHasInt> {
  @override
  final Iterable<Type> types = const [ValueWithHasInt, _$ValueWithHasInt];
  @override
  final String wireName = 'ValueWithHasInt';

  @override
  Iterable<Object> serialize(Serializers serializers, ValueWithHasInt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hasInt',
      serializers.serialize(object.hasInt,
          specifiedType: const FullType(HasInt)),
    ];

    return result;
  }

  @override
  ValueWithHasInt deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithHasIntBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'hasInt':
          result.hasInt = serializers.deserialize(value,
              specifiedType: const FullType(HasInt)) as HasInt;
          break;
      }
    }

    return result.build();
  }
}

class _$ValueWithInt extends ValueWithInt {
  @override
  final int anInt;
  @override
  final String note;

  factory _$ValueWithInt([void Function(ValueWithIntBuilder) updates]) =>
      (new ValueWithIntBuilder()..update(updates))._build();

  _$ValueWithInt._({this.anInt, this.note}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'ValueWithInt', 'anInt');
    BuiltValueNullFieldError.checkNotNull(note, r'ValueWithInt', 'note');
  }

  @override
  ValueWithInt rebuild(void Function(ValueWithIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithIntBuilder toBuilder() => new ValueWithIntBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithInt && anInt == other.anInt && note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithInt')
          ..add('anInt', anInt)
          ..add('note', note))
        .toString();
  }
}

class ValueWithIntBuilder
    implements Builder<ValueWithInt, ValueWithIntBuilder> {
  _$ValueWithInt _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  ValueWithIntBuilder();

  ValueWithIntBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithInt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithInt;
  }

  @override
  void update(void Function(ValueWithIntBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithInt build() => _build();

  _$ValueWithInt _build() {
    final _$result = _$v ??
        new _$ValueWithInt._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'ValueWithInt', 'anInt'),
            note: BuiltValueNullFieldError.checkNotNull(
                note, r'ValueWithInt', 'note'));
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithHasInt extends ValueWithHasInt {
  @override
  final HasInt hasInt;

  factory _$ValueWithHasInt([void Function(ValueWithHasIntBuilder) updates]) =>
      (new ValueWithHasIntBuilder()..update(updates))._build();

  _$ValueWithHasInt._({this.hasInt}) : super._() {
    BuiltValueNullFieldError.checkNotNull(hasInt, r'ValueWithHasInt', 'hasInt');
  }

  @override
  ValueWithHasInt rebuild(void Function(ValueWithHasIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithHasIntBuilder toBuilder() =>
      new ValueWithHasIntBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithHasInt && hasInt == other.hasInt;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hasInt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithHasInt')
          ..add('hasInt', hasInt))
        .toString();
  }
}

class ValueWithHasIntBuilder
    implements Builder<ValueWithHasInt, ValueWithHasIntBuilder> {
  _$ValueWithHasInt _$v;

  HasInt _hasInt;
  HasInt get hasInt => _$this._hasInt;
  set hasInt(HasInt hasInt) => _$this._hasInt = hasInt;

  ValueWithHasIntBuilder();

  ValueWithHasIntBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hasInt = $v.hasInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithHasInt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithHasInt;
  }

  @override
  void update(void Function(ValueWithHasIntBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithHasInt build() => _build();

  _$ValueWithHasInt _build() {
    final _$result = _$v ??
        new _$ValueWithHasInt._(
            hasInt: BuiltValueNullFieldError.checkNotNull(
                hasInt, r'ValueWithHasInt', 'hasInt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
