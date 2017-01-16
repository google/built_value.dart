// GENERATED CODE - DO NOT MODIFY BY HAND

part of interfaces;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library interfaces
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

final BuiltSet<EnumWithInt> _$values = new BuiltSet<EnumWithInt>(const [
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
  Iterable serialize(Serializers serializers, ValueWithInt object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ValueWithInt deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueWithIntBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                specifiedType: const FullType(int)) as dynamic;
            break;
          case 'note':
            result.note = serializers.deserialize(value,
                specifiedType: const FullType(String)) as dynamic;
            break;
        }
      }
    }

    return result.build();
  }
}

class _$EnumWithIntSerializer implements PrimitiveSerializer<EnumWithInt> {
  @override
  final Iterable<Type> types = const [EnumWithInt];
  @override
  final String wireName = 'EnumWithInt';

  @override
  Object serialize(Serializers serializers, EnumWithInt object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  EnumWithInt deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return EnumWithInt.valueOf(serialized);
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithInt
// **************************************************************************

class _$ValueWithInt extends ValueWithInt {
  @override
  final int anInt;
  @override
  final String note;

  factory _$ValueWithInt([updates(ValueWithIntBuilder b)]) =>
      (new ValueWithIntBuilder()..update(updates)).build();

  _$ValueWithInt._({this.anInt, this.note}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
    if (note == null) throw new ArgumentError.notNull('note');
  }

  @override
  ValueWithInt rebuild(updates(ValueWithIntBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueWithIntBuilder toBuilder() =>
      new _$ValueWithIntBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ValueWithInt) return false;
    return anInt == other.anInt && note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), note.hashCode));
  }

  @override
  String toString() {
    return 'ValueWithInt {'
        'anInt=${anInt.toString()},\n'
        'note=${note.toString()},\n'
        '}';
  }
}

class _$ValueWithIntBuilder extends ValueWithIntBuilder {
  ValueWithInt _$v;

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
    if (_$v != null) {
      super.anInt = _$v.anInt;
      super.note = _$v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithInt other) {
    _$v = other;
  }

  @override
  void update(updates(ValueWithIntBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithInt build() {
    final result = _$v ?? new _$ValueWithInt._(anInt: anInt, note: note);
    replace(result);
    return result;
  }
}
