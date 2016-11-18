// GENERATED CODE - DO NOT MODIFY BY HAND

part of simple_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library simple_value
// **************************************************************************

Serializer<SimpleValue> _$simpleValueSerializer = new _$SimpleValueSerializer();

class _$SimpleValueSerializer implements StructuredSerializer<SimpleValue> {
  final Iterable<Type> types = const [SimpleValue, _$SimpleValue];
  final String wireName = 'SimpleValue';

  @override
  Iterable serialize(Serializers serializers, SimpleValue object,
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
  SimpleValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new SimpleValueBuilder();

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
// Target: abstract class SimpleValue
// **************************************************************************

class _$SimpleValue extends SimpleValue {
  final int anInt;
  final String aString;

  _$SimpleValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  factory _$SimpleValue([updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  SimpleValue rebuild(updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SimpleValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  String toString() {
    return 'SimpleValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  SimpleValueBuilder();
  int anInt;
  String aString;

  void replace(SimpleValue other) {
    this.anInt = other.anInt;
    this.aString = other.aString;
  }

  void update(updates(SimpleValueBuilder b)) {
    if (updates != null) updates(this);
  }

  SimpleValue build() {
    return new _$SimpleValue._(anInt: anInt, aString: aString);
  }
}
