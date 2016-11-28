// GENERATED CODE - DO NOT MODIFY BY HAND

part of compound_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library compound_value
// **************************************************************************

Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();

class _$CompoundValueSerializer implements StructuredSerializer<CompoundValue> {
  final Iterable<Type> types = const [CompoundValue, _$CompoundValue];
  final String wireName = 'CompoundValue';

  @override
  Iterable serialize(Serializers serializers, CompoundValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    if (object.validatedValue != null) {
      result.add('validatedValue');
      result.add(serializers.serialize(object.validatedValue,
          specifiedType: const FullType(ValidatedValue)));
    }

    return result;
  }

  @override
  CompoundValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CompoundValueBuilder();

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
          case 'simpleValue':
            result.simpleValue.replace(serializers.deserialize(value,
                specifiedType: const FullType(SimpleValue)));
            break;
          case 'validatedValue':
            result.validatedValue.replace(serializers.deserialize(value,
                specifiedType: const FullType(ValidatedValue)));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

class _$CompoundValue extends CompoundValue {
  final SimpleValue simpleValue;
  final ValidatedValue validatedValue;

  _$CompoundValue._({this.simpleValue, this.validatedValue}) : super._() {
    if (simpleValue == null) throw new ArgumentError.notNull('simpleValue');
  }

  factory _$CompoundValue([updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  CompoundValue rebuild(updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! CompoundValue) return false;
    return simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  String toString() {
    return 'CompoundValue {'
        'simpleValue=${simpleValue.toString()},\n'
        'validatedValue=${validatedValue.toString()},\n'
        '}';
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  CompoundValueBuilder();
  SimpleValueBuilder simpleValue = new SimpleValueBuilder();
  ValidatedValueBuilder _validatedValue;
  set validatedValue(ValidatedValueBuilder validatedValue) =>
      _validatedValue = validatedValue;
  ValidatedValueBuilder get validatedValue {
    _validatedValue ??= new ValidatedValueBuilder();
    return _validatedValue;
  }

  void replace(CompoundValue other) {
    this.simpleValue = other.simpleValue?.toBuilder();
    this.validatedValue = other.validatedValue?.toBuilder();
  }

  void update(updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  CompoundValue build() {
    return new _$CompoundValue._(
        simpleValue: simpleValue?.build(),
        validatedValue: _validatedValue?.build());
  }
}
