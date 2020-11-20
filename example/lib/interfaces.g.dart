// GENERATED CODE - DO NOT MODIFY BY HAND

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

class _$ValueWithInt extends ValueWithInt {
  @override
  final int anInt;
  @override
  final String note;

  factory _$ValueWithInt([void Function(ValueWithIntBuilder) updates]) =>
      (new ValueWithIntBuilder()..update(updates)).build() as _$ValueWithInt;

  _$ValueWithInt._({this.anInt, this.note}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, 'ValueWithInt', 'anInt');
    BuiltValueNullFieldError.checkNotNull(note, 'ValueWithInt', 'note');
  }

  @override
  ValueWithInt rebuild(void Function(ValueWithIntBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueWithIntBuilder toBuilder() =>
      new _$ValueWithIntBuilder()..replace(this);

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
    return (newBuiltValueToStringHelper('ValueWithInt')
          ..add('anInt', anInt)
          ..add('note', note))
        .toString();
  }
}

class _$ValueWithIntBuilder extends ValueWithIntBuilder {
  _$ValueWithInt _$v;

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
  String get note {
    _$this;
    return super.note;
  }

  @override
  set note(String note) {
    _$this;
    super.note = note;
  }

  _$ValueWithIntBuilder() : super._();

  ValueWithIntBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.anInt = $v.anInt;
      super.note = $v.note;
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
  _$ValueWithInt build() {
    final _$result = _$v ??
        new _$ValueWithInt._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, 'ValueWithInt', 'anInt'),
            note: BuiltValueNullFieldError.checkNotNull(
                note, 'ValueWithInt', 'note'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
