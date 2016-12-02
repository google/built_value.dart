// GENERATED CODE - DO NOT MODIFY BY HAND

part of validated_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library validated_value
// **************************************************************************

Serializer<ValidatedValue> _$validatedValueSerializer =
    new _$ValidatedValueSerializer();

class _$ValidatedValueSerializer
    implements StructuredSerializer<ValidatedValue> {
  @override
  final Iterable<Type> types = const [ValidatedValue, _$ValidatedValue];
  @override
  final String wireName = 'ValidatedValue';

  @override
  Iterable serialize(Serializers serializers, ValidatedValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    if (object.aString != null) {
      result.add('aString');
      result.add(serializers.serialize(object.aString,
          specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  ValidatedValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValidatedValueBuilder();

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
                specifiedType: const FullType(int));
            break;
          case 'aString':
            result.aString = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValidatedValue
// **************************************************************************

class _$ValidatedValue extends ValidatedValue {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValidatedValue([updates(ValidatedValueBuilder b)]) =>
      (new ValidatedValueBuilder()..update(updates)).build();

  _$ValidatedValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  ValidatedValue rebuild(updates(ValidatedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidatedValueBuilder toBuilder() =>
      new ValidatedValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ValidatedValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'ValidatedValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class ValidatedValueBuilder
    implements Builder<ValidatedValue, ValidatedValueBuilder> {
  ValidatedValue _$v;

  int _anInt;
  int get anInt => _anInt;
  set anInt(int anInt) => _$writableBuilder._anInt = anInt;

  String _aString;
  String get aString => _aString;
  set aString(String aString) => _$writableBuilder._aString = aString;

  ValidatedValueBuilder();

  ValidatedValueBuilder get _$writableBuilder {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidatedValue other) {
    _$v = other;
  }

  @override
  void update(updates(ValidatedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ValidatedValue build() {
    final result =
        _$v ?? new _$ValidatedValue._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}
