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
  final Iterable<Type> types = const [ValidatedValue, _$ValidatedValue];
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
  final int anInt;
  final String aString;

  _$ValidatedValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  factory _$ValidatedValue([updates(ValidatedValueBuilder b)]) =>
      (new ValidatedValueBuilder()..update(updates)).build();

  ValidatedValue rebuild(updates(ValidatedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ValidatedValueBuilder toBuilder() =>
      new ValidatedValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ValidatedValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  String toString() {
    return 'ValidatedValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class ValidatedValueBuilder
    implements Builder<ValidatedValue, ValidatedValueBuilder> {
  ValidatedValueBuilder();
  int anInt;
  String aString;

  void replace(ValidatedValue other) {
    this.anInt = other.anInt;
    this.aString = other.aString;
  }

  void update(updates(ValidatedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  ValidatedValue build() {
    return new _$ValidatedValue._(anInt: anInt, aString: aString);
  }
}
