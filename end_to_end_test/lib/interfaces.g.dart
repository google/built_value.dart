// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'interfaces.dart';

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
      throw ArgumentError(name);
  }
}

final BuiltSet<EnumWithInt> _$values =
    BuiltSet<EnumWithInt>(const <EnumWithInt>[
  _$one,
  _$two,
  _$three,
]);

Serializer<ValueWithInt> _$valueWithIntSerializer = _$ValueWithIntSerializer();
Serializer<EnumWithInt> _$enumWithIntSerializer = _$EnumWithIntSerializer();
Serializer<ValueWithHasInt> _$valueWithHasIntSerializer =
    _$ValueWithHasIntSerializer();

class _$ValueWithIntSerializer implements StructuredSerializer<ValueWithInt> {
  @override
  final Iterable<Type> types = const [ValueWithInt, _$ValueWithInt];
  @override
  final String wireName = 'ValueWithInt';

  @override
  Iterable<Object?> serialize(Serializers serializers, ValueWithInt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ValueWithInt deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ValueWithIntBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
  Iterable<Object?> serialize(Serializers serializers, ValueWithHasInt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hasInt',
      serializers.serialize(object.hasInt,
          specifiedType: const FullType(HasInt)),
    ];

    return result;
  }

  @override
  ValueWithHasInt deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ValueWithHasIntBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hasInt':
          result.hasInt = serializers.deserialize(value,
              specifiedType: const FullType(HasInt))! as HasInt;
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

  factory _$ValueWithInt([void Function(ValueWithIntBuilder)? updates]) =>
      (ValueWithIntBuilder()..update(updates))._build();

  _$ValueWithInt._({required this.anInt, required this.note}) : super._();
  @override
  ValueWithInt rebuild(void Function(ValueWithIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithIntBuilder toBuilder() => ValueWithIntBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithInt && anInt == other.anInt && note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, anInt.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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
  _$ValueWithInt? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

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
    _$v = other as _$ValueWithInt;
  }

  @override
  void update(void Function(ValueWithIntBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithInt build() => _build();

  _$ValueWithInt _build() {
    final _$result = _$v ??
        _$ValueWithInt._(
          anInt: BuiltValueNullFieldError.checkNotNull(
              anInt, r'ValueWithInt', 'anInt'),
          note: BuiltValueNullFieldError.checkNotNull(
              note, r'ValueWithInt', 'note'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithHasInt extends ValueWithHasInt {
  @override
  final HasInt hasInt;

  factory _$ValueWithHasInt([void Function(ValueWithHasIntBuilder)? updates]) =>
      (ValueWithHasIntBuilder()..update(updates))._build();

  _$ValueWithHasInt._({required this.hasInt}) : super._();
  @override
  ValueWithHasInt rebuild(void Function(ValueWithHasIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithHasIntBuilder toBuilder() => ValueWithHasIntBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithHasInt && hasInt == other.hasInt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hasInt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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
  _$ValueWithHasInt? _$v;

  HasInt? _hasInt;
  HasInt? get hasInt => _$this._hasInt;
  set hasInt(HasInt? hasInt) => _$this._hasInt = hasInt;

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
    _$v = other as _$ValueWithHasInt;
  }

  @override
  void update(void Function(ValueWithHasIntBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithHasInt build() => _build();

  _$ValueWithHasInt _build() {
    final _$result = _$v ??
        _$ValueWithHasInt._(
          hasInt: BuiltValueNullFieldError.checkNotNull(
              hasInt, r'ValueWithHasInt', 'hasInt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
