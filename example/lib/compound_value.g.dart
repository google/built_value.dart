// GENERATED CODE - DO NOT MODIFY BY HAND

part of compound_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library compound_value
// **************************************************************************

Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();

class _$CompoundValueSerializer implements StructuredSerializer<CompoundValue> {
  @override
  final Iterable<Type> types = const [CompoundValue, _$CompoundValue];
  @override
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
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue validatedValue;

  factory _$CompoundValue([updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({this.simpleValue, this.validatedValue}) : super._() {
    if (simpleValue == null) throw new ArgumentError.notNull('simpleValue');
  }

  @override
  CompoundValue rebuild(updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! CompoundValue) return false;
    return simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return 'CompoundValue {'
        'simpleValue=${simpleValue.toString()},\n'
        'validatedValue=${validatedValue.toString()},\n'
        '}';
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  CompoundValue _$v;

  SimpleValueBuilder _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$writableBuilder._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder simpleValue) =>
      _$writableBuilder._simpleValue = simpleValue;

  ValidatedValueBuilder _validatedValue;
  ValidatedValueBuilder get validatedValue =>
      _$writableBuilder._validatedValue ??= new ValidatedValueBuilder();
  set validatedValue(ValidatedValueBuilder validatedValue) =>
      _$writableBuilder._validatedValue = validatedValue;

  CompoundValueBuilder();

  CompoundValueBuilder get _$writableBuilder {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue?.toBuilder();
      _validatedValue = _$v.validatedValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    _$v = other;
  }

  @override
  void update(updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValue build() {
    final result = _$v ??
        new _$CompoundValue._(
            simpleValue: simpleValue?.build(),
            validatedValue: _validatedValue?.build());
    replace(result);
    return result;
  }
}
