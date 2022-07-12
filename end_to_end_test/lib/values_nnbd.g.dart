// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'values_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SimpleValue> _$simpleValueSerializer = new _$SimpleValueSerializer();
Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();
Serializer<CompoundValueNoNesting> _$compoundValueNoNestingSerializer =
    new _$CompoundValueNoNestingSerializer();
Serializer<CompoundValueNoAutoNesting> _$compoundValueNoAutoNestingSerializer =
    new _$CompoundValueNoAutoNestingSerializer();
Serializer<CompoundValueComparableBuilders>
    _$compoundValueComparableBuildersSerializer =
    new _$CompoundValueComparableBuildersSerializer();
Serializer<CompoundValueNoNestingField>
    _$compoundValueNoNestingFieldSerializer =
    new _$CompoundValueNoNestingFieldSerializer();
Serializer<CompoundValueNestingField> _$compoundValueNestingFieldSerializer =
    new _$CompoundValueNestingFieldSerializer();
Serializer<CompoundValueNoAutoNestingField>
    _$compoundValueNoAutoNestingFieldSerializer =
    new _$CompoundValueNoAutoNestingFieldSerializer();
Serializer<CompoundValueAutoNestingField>
    _$compoundValueAutoNestingFieldSerializer =
    new _$CompoundValueAutoNestingFieldSerializer();
Serializer<CompoundValueExplicitNoNesting>
    _$compoundValueExplicitNoNestingSerializer =
    new _$CompoundValueExplicitNoNestingSerializer();
Serializer<ValidatedValue> _$validatedValueSerializer =
    new _$ValidatedValueSerializer();
Serializer<ValueUsingImportAs> _$valueUsingImportAsSerializer =
    new _$ValueUsingImportAsSerializer();
Serializer<NoFieldsValue> _$noFieldsValueSerializer =
    new _$NoFieldsValueSerializer();
Serializer<PrimitivesValue> _$primitivesValueSerializer =
    new _$PrimitivesValueSerializer();
Serializer<PartiallySerializableValue> _$partiallySerializableValueSerializer =
    new _$PartiallySerializableValueSerializer();
Serializer<NamedFactoryValue> _$namedFactoryValueSerializer =
    new _$NamedFactoryValueSerializer();
Serializer<WireNameValue> _$wireNameValueSerializer =
    new _$WireNameValueSerializer();
Serializer<FieldDiscoveryValue> _$fieldDiscoveryValueSerializer =
    new _$FieldDiscoveryValueSerializer();
Serializer<DiscoverableValue> _$discoverableValueSerializer =
    new _$DiscoverableValueSerializer();
Serializer<SecondDiscoverableValue> _$secondDiscoverableValueSerializer =
    new _$SecondDiscoverableValueSerializer();
Serializer<ThirdDiscoverableValue> _$thirdDiscoverableValueSerializer =
    new _$ThirdDiscoverableValueSerializer();
Serializer<RecursiveValueA> _$recursiveValueASerializer =
    new _$RecursiveValueASerializer();
Serializer<RecursiveValueB> _$recursiveValueBSerializer =
    new _$RecursiveValueBSerializer();
Serializer<OtherValue> _$otherValueSerializer = new _$OtherValueSerializer();
Serializer<DefaultsForFieldSettingsValue>
    _$defaultsForFieldSettingsValueSerializer =
    new _$DefaultsForFieldSettingsValueSerializer();
Serializer<ValueWithBuilderInitializer>
    _$valueWithBuilderInitializerSerializer =
    new _$ValueWithBuilderInitializerSerializer();
Serializer<ValueWithBuilderFinalizer> _$valueWithBuilderFinalizerSerializer =
    new _$ValueWithBuilderFinalizerSerializer();
Serializer<SerializesNullsValue> _$serializesNullsValueSerializer =
    new _$SerializesNullsValueSerializer();
Serializer<NullableObjectValue> _$nullableObjectValueSerializer =
    new _$NullableObjectValueSerializer();
Serializer<ValueWithHooks> _$valueWithHooksSerializer =
    new _$ValueWithHooksSerializer();
Serializer<$ValueSpecial> _$$valueSpecialSerializer =
    new _$$ValueSpecialSerializer();

class _$SimpleValueSerializer implements StructuredSerializer<SimpleValue> {
  @override
  final Iterable<Type> types = const [SimpleValue, _$SimpleValue];
  @override
  final String wireName = 'SimpleValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, SimpleValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.aString;
    if (value != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.$mustBeEscaped;
    if (value != null) {
      result
        ..add('\$mustBeEscaped')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SimpleValue deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SimpleValueBuilder();

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
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case '\$mustBeEscaped':
          result.$mustBeEscaped = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueSerializer implements StructuredSerializer<CompoundValue> {
  @override
  final Iterable<Type> types = const [CompoundValue, _$CompoundValue];
  @override
  final String wireName = 'CompoundValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, CompoundValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'validatedValue':
          result.validatedValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ValidatedValue))!
              as ValidatedValue);
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueNoNestingSerializer
    implements StructuredSerializer<CompoundValueNoNesting> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNoNesting,
    _$CompoundValueNoNesting
  ];
  @override
  final String wireName = 'CompoundValueNoNesting';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueNoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueNoNesting deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue?;
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueNoAutoNestingSerializer
    implements StructuredSerializer<CompoundValueNoAutoNesting> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNoAutoNesting,
    _$CompoundValueNoAutoNesting
  ];
  @override
  final String wireName = 'CompoundValueNoAutoNesting';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueNoAutoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(NoFieldsValue)),
    ];

    return result;
  }

  @override
  CompoundValueNoAutoNesting deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoAutoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = (serializers.deserialize(value,
                      specifiedType: const FullType(NoFieldsValue))!
                  as NoFieldsValue)
              .toBuilder();
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueComparableBuildersSerializer
    implements StructuredSerializer<CompoundValueComparableBuilders> {
  @override
  final Iterable<Type> types = const [
    CompoundValueComparableBuilders,
    _$CompoundValueComparableBuilders
  ];
  @override
  final String wireName = 'CompoundValueComparableBuilders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueComparableBuilders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueComparableBuilders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueComparableBuildersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue?;
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueNoNestingFieldSerializer
    implements StructuredSerializer<CompoundValueNoNestingField> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNoNestingField,
    _$CompoundValueNoNestingField
  ];
  @override
  final String wireName = 'CompoundValueNoNestingField';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueNoNestingField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
      'simpleValueWithNested',
      serializers.serialize(object.simpleValueWithNested,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    value = object.validatedValueWithNested;
    if (value != null) {
      result
        ..add('validatedValueWithNested')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueNoNestingField deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoNestingFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue?;
          break;
        case 'simpleValueWithNested':
          result.simpleValueWithNested.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'validatedValueWithNested':
          result.validatedValueWithNested.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ValidatedValue))!
              as ValidatedValue);
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueNestingFieldSerializer
    implements StructuredSerializer<CompoundValueNestingField> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNestingField,
    _$CompoundValueNestingField
  ];
  @override
  final String wireName = 'CompoundValueNestingField';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueNestingField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
      'simpleValueWithNested',
      serializers.serialize(object.simpleValueWithNested,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    value = object.validatedValueWithNested;
    if (value != null) {
      result
        ..add('validatedValueWithNested')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueNestingField deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNestingFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue?;
          break;
        case 'simpleValueWithNested':
          result.simpleValueWithNested.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'validatedValueWithNested':
          result.validatedValueWithNested.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ValidatedValue))!
              as ValidatedValue);
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueNoAutoNestingFieldSerializer
    implements StructuredSerializer<CompoundValueNoAutoNestingField> {
  @override
  final Iterable<Type> types = const [
    CompoundValueNoAutoNestingField,
    _$CompoundValueNoAutoNestingField
  ];
  @override
  final String wireName = 'CompoundValueNoAutoNestingField';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueNoAutoNestingField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(NoFieldsValue)),
      'valueWithAutoCreate',
      serializers.serialize(object.valueWithAutoCreate,
          specifiedType: const FullType(NoFieldsValue)),
    ];

    return result;
  }

  @override
  CompoundValueNoAutoNestingField deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoAutoNestingFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = (serializers.deserialize(value,
                      specifiedType: const FullType(NoFieldsValue))!
                  as NoFieldsValue)
              .toBuilder();
          break;
        case 'valueWithAutoCreate':
          result.valueWithAutoCreate.replace(serializers.deserialize(value,
              specifiedType: const FullType(NoFieldsValue))! as NoFieldsValue);
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueAutoNestingFieldSerializer
    implements StructuredSerializer<CompoundValueAutoNestingField> {
  @override
  final Iterable<Type> types = const [
    CompoundValueAutoNestingField,
    _$CompoundValueAutoNestingField
  ];
  @override
  final String wireName = 'CompoundValueAutoNestingField';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueAutoNestingField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(NoFieldsValue)),
      'valueWithAutoCreate',
      serializers.serialize(object.valueWithAutoCreate,
          specifiedType: const FullType(NoFieldsValue)),
    ];

    return result;
  }

  @override
  CompoundValueAutoNestingField deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueAutoNestingFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
              specifiedType: const FullType(NoFieldsValue))! as NoFieldsValue);
          break;
        case 'valueWithAutoCreate':
          result.valueWithAutoCreate.replace(serializers.deserialize(value,
              specifiedType: const FullType(NoFieldsValue))! as NoFieldsValue);
          break;
      }
    }

    return result.build();
  }
}

class _$CompoundValueExplicitNoNestingSerializer
    implements StructuredSerializer<CompoundValueExplicitNoNesting> {
  @override
  final Iterable<Type> types = const [
    CompoundValueExplicitNoNesting,
    _$CompoundValueExplicitNoNesting
  ];
  @override
  final String wireName = 'CompoundValueExplicitNoNesting';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompoundValueExplicitNoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.validatedValue;
    if (value != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueExplicitNoNesting deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueExplicitNoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue?;
          break;
      }
    }

    return result.build();
  }
}

class _$ValidatedValueSerializer
    implements StructuredSerializer<ValidatedValue> {
  @override
  final Iterable<Type> types = const [ValidatedValue, _$ValidatedValue];
  @override
  final String wireName = 'ValidatedValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, ValidatedValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.aString;
    if (value != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ValidatedValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValidatedValueBuilder();

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
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ValueUsingImportAsSerializer
    implements StructuredSerializer<ValueUsingImportAs> {
  @override
  final Iterable<Type> types = const [ValueUsingImportAs, _$ValueUsingImportAs];
  @override
  final String wireName = 'ValueUsingImportAs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ValueUsingImportAs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(using_import_as.TestEnum)),
    ];
    Object? value;
    value = object.nullableValue;
    if (value != null) {
      result
        ..add('nullableValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(using_import_as.TestEnum)));
    }
    return result;
  }

  @override
  ValueUsingImportAs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueUsingImportAsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
                  specifiedType: const FullType(using_import_as.TestEnum))!
              as using_import_as.TestEnum;
          break;
        case 'nullableValue':
          result.nullableValue = serializers.deserialize(value,
                  specifiedType: const FullType(using_import_as.TestEnum))
              as using_import_as.TestEnum?;
          break;
      }
    }

    return result.build();
  }
}

class _$NoFieldsValueSerializer implements StructuredSerializer<NoFieldsValue> {
  @override
  final Iterable<Type> types = const [NoFieldsValue, _$NoFieldsValue];
  @override
  final String wireName = 'NoFieldsValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, NoFieldsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  NoFieldsValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new NoFieldsValueBuilder().build();
  }
}

class _$PrimitivesValueSerializer
    implements StructuredSerializer<PrimitivesValue> {
  @override
  final Iterable<Type> types = const [PrimitivesValue, _$PrimitivesValue];
  @override
  final String wireName = 'PrimitivesValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, PrimitivesValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'boolean',
      serializers.serialize(object.boolean,
          specifiedType: const FullType(bool)),
      'integer',
      serializers.serialize(object.integer, specifiedType: const FullType(int)),
      'int64',
      serializers.serialize(object.int64, specifiedType: const FullType(Int64)),
      'dbl',
      serializers.serialize(object.dbl, specifiedType: const FullType(double)),
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(num)),
      'string',
      serializers.serialize(object.string,
          specifiedType: const FullType(String)),
      'dateTime',
      serializers.serialize(object.dateTime,
          specifiedType: const FullType(DateTime)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(Duration)),
      'regExp',
      serializers.serialize(object.regExp,
          specifiedType: const FullType(RegExp)),
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(Uri)),
      'bigInt',
      serializers.serialize(object.bigInt,
          specifiedType: const FullType(BigInt)),
    ];

    return result;
  }

  @override
  PrimitivesValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrimitivesValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'boolean':
          result.boolean = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'integer':
          result.integer = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'int64':
          result.int64 = serializers.deserialize(value,
              specifiedType: const FullType(Int64))! as Int64;
          break;
        case 'dbl':
          result.dbl = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'string':
          result.string = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dateTime':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(Duration))! as Duration;
          break;
        case 'regExp':
          result.regExp = serializers.deserialize(value,
              specifiedType: const FullType(RegExp))! as RegExp;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
          break;
        case 'bigInt':
          result.bigInt = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
      }
    }

    return result.build();
  }
}

class _$PartiallySerializableValueSerializer
    implements StructuredSerializer<PartiallySerializableValue> {
  @override
  final Iterable<Type> types = const [
    PartiallySerializableValue,
    _$PartiallySerializableValue
  ];
  @override
  final String wireName = 'PartiallySerializableValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PartiallySerializableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PartiallySerializableValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PartiallySerializableValueBuilder();

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
      }
    }

    return result.build();
  }
}

class _$NamedFactoryValueSerializer
    implements StructuredSerializer<NamedFactoryValue> {
  @override
  final Iterable<Type> types = const [NamedFactoryValue, _$NamedFactoryValue];
  @override
  final String wireName = 'NamedFactoryValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, NamedFactoryValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NamedFactoryValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NamedFactoryValueBuilder();

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
      }
    }

    return result.build();
  }
}

class _$WireNameValueSerializer implements StructuredSerializer<WireNameValue> {
  @override
  final Iterable<Type> types = const [WireNameValue, _$WireNameValue];
  @override
  final String wireName = '\$V';

  @override
  Iterable<Object?> serialize(Serializers serializers, WireNameValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '\$v',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  WireNameValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WireNameValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '\$v':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$FieldDiscoveryValueSerializer
    implements StructuredSerializer<FieldDiscoveryValue> {
  @override
  final Iterable<Type> types = const [
    FieldDiscoveryValue,
    _$FieldDiscoveryValue
  ];
  @override
  final String wireName = 'FieldDiscoveryValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FieldDiscoveryValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(DiscoverableValue)),
      'values',
      serializers.serialize(object.values,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ThirdDiscoverableValue)])),
    ];
    Object? value;
    value = object.recursiveValue;
    if (value != null) {
      result
        ..add('recursiveValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(FieldDiscoveryValue)));
    }
    return result;
  }

  @override
  FieldDiscoveryValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FieldDiscoveryValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DiscoverableValue))!
              as DiscoverableValue);
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ThirdDiscoverableValue)
              ]))! as BuiltList<Object?>);
          break;
        case 'recursiveValue':
          result.recursiveValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FieldDiscoveryValue))!
              as FieldDiscoveryValue);
          break;
      }
    }

    return result.build();
  }
}

class _$DiscoverableValueSerializer
    implements StructuredSerializer<DiscoverableValue> {
  @override
  final Iterable<Type> types = const [DiscoverableValue, _$DiscoverableValue];
  @override
  final String wireName = 'DiscoverableValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, DiscoverableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(SecondDiscoverableValue)),
    ];

    return result;
  }

  @override
  DiscoverableValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiscoverableValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SecondDiscoverableValue))!
              as SecondDiscoverableValue);
          break;
      }
    }

    return result.build();
  }
}

class _$SecondDiscoverableValueSerializer
    implements StructuredSerializer<SecondDiscoverableValue> {
  @override
  final Iterable<Type> types = const [
    SecondDiscoverableValue,
    _$SecondDiscoverableValue
  ];
  @override
  final String wireName = 'SecondDiscoverableValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SecondDiscoverableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SecondDiscoverableValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SecondDiscoverableValueBuilder();

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
      }
    }

    return result.build();
  }
}

class _$ThirdDiscoverableValueSerializer
    implements StructuredSerializer<ThirdDiscoverableValue> {
  @override
  final Iterable<Type> types = const [
    ThirdDiscoverableValue,
    _$ThirdDiscoverableValue
  ];
  @override
  final String wireName = 'ThirdDiscoverableValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThirdDiscoverableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ThirdDiscoverableValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThirdDiscoverableValueBuilder();

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
      }
    }

    return result.build();
  }
}

class _$RecursiveValueASerializer
    implements StructuredSerializer<RecursiveValueA> {
  @override
  final Iterable<Type> types = const [RecursiveValueA, _$RecursiveValueA];
  @override
  final String wireName = 'RecursiveValueA';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecursiveValueA object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(RecursiveValueB)),
    ];

    return result;
  }

  @override
  RecursiveValueA deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecursiveValueABuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RecursiveValueB))!
              as RecursiveValueB);
          break;
      }
    }

    return result.build();
  }
}

class _$RecursiveValueBSerializer
    implements StructuredSerializer<RecursiveValueB> {
  @override
  final Iterable<Type> types = const [RecursiveValueB, _$RecursiveValueB];
  @override
  final String wireName = 'RecursiveValueB';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecursiveValueB object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(RecursiveValueA)),
    ];

    return result;
  }

  @override
  RecursiveValueB deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecursiveValueBBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RecursiveValueA))!
              as RecursiveValueA);
          break;
      }
    }

    return result.build();
  }
}

class _$OtherValueSerializer implements StructuredSerializer<OtherValue> {
  @override
  final Iterable<Type> types = const [OtherValue, _$OtherValue];
  @override
  final String wireName = 'OtherValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, OtherValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'other',
      serializers.serialize(object.other, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  OtherValue deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OtherValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'other':
          result.other = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DefaultsForFieldSettingsValueSerializer
    implements StructuredSerializer<DefaultsForFieldSettingsValue> {
  @override
  final Iterable<Type> types = const [
    DefaultsForFieldSettingsValue,
    _$DefaultsForFieldSettingsValue
  ];
  @override
  final String wireName = 'DefaultsForFieldSettingsValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DefaultsForFieldSettingsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'serialized',
      serializers.serialize(object.serialized,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  DefaultsForFieldSettingsValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DefaultsForFieldSettingsValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serialized':
          result.serialized = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ValueWithBuilderInitializerSerializer
    implements StructuredSerializer<ValueWithBuilderInitializer> {
  @override
  final Iterable<Type> types = const [
    ValueWithBuilderInitializer,
    _$ValueWithBuilderInitializer
  ];
  @override
  final String wireName = 'ValueWithBuilderInitializer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ValueWithBuilderInitializer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'anIntWithDefault',
      serializers.serialize(object.anIntWithDefault,
          specifiedType: const FullType(int)),
      'nestedValue',
      serializers.serialize(object.nestedValue,
          specifiedType: const FullType(SimpleValue)),
      'nestedValueWithDefault',
      serializers.serialize(object.nestedValueWithDefault,
          specifiedType: const FullType(SimpleValue)),
    ];
    Object? value;
    value = object.nullableInt;
    if (value != null) {
      result
        ..add('nullableInt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nullableIntWithDefault;
    if (value != null) {
      result
        ..add('nullableIntWithDefault')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nullableNestedValue;
    if (value != null) {
      result
        ..add('nullableNestedValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SimpleValue)));
    }
    value = object.nullableNestedValueWithDefault;
    if (value != null) {
      result
        ..add('nullableNestedValueWithDefault')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SimpleValue)));
    }
    return result;
  }

  @override
  ValueWithBuilderInitializer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithBuilderInitializerBuilder();

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
        case 'anIntWithDefault':
          result.anIntWithDefault = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'nullableInt':
          result.nullableInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nullableIntWithDefault':
          result.nullableIntWithDefault = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nestedValue':
          result.nestedValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'nestedValueWithDefault':
          result.nestedValueWithDefault.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'nullableNestedValue':
          result.nullableNestedValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
        case 'nullableNestedValueWithDefault':
          result.nullableNestedValueWithDefault.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(SimpleValue))! as SimpleValue);
          break;
      }
    }

    return result.build();
  }
}

class _$ValueWithBuilderFinalizerSerializer
    implements StructuredSerializer<ValueWithBuilderFinalizer> {
  @override
  final Iterable<Type> types = const [
    ValueWithBuilderFinalizer,
    _$ValueWithBuilderFinalizer
  ];
  @override
  final String wireName = 'ValueWithBuilderFinalizer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ValueWithBuilderFinalizer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ValueWithBuilderFinalizer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithBuilderFinalizerBuilder();

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
      }
    }

    return result.build();
  }
}

class _$SerializesNullsValueSerializer
    implements StructuredSerializer<SerializesNullsValue> {
  @override
  final Iterable<Type> types = const [
    SerializesNullsValue,
    _$SerializesNullsValue
  ];
  @override
  final String wireName = 'SerializesNullsValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SerializesNullsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.value;

    result
      ..add('value')
      ..add(
          serializers.serialize(value, specifiedType: const FullType(String)));

    return result;
  }

  @override
  SerializesNullsValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SerializesNullsValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NullableObjectValueSerializer
    implements StructuredSerializer<NullableObjectValue> {
  @override
  final Iterable<Type> types = const [
    NullableObjectValue,
    _$NullableObjectValue
  ];
  @override
  final String wireName = 'NullableObjectValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NullableObjectValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Object)));
    }
    return result;
  }

  @override
  NullableObjectValue deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NullableObjectValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
      }
    }

    return result.build();
  }
}

class _$ValueWithHooksSerializer
    implements StructuredSerializer<ValueWithHooks> {
  @override
  final Iterable<Type> types = const [ValueWithHooks, _$ValueWithHooks];
  @override
  final String wireName = 'ValueWithHooks';

  @override
  Iterable<Object?> serialize(Serializers serializers, ValueWithHooks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hook1Count',
      serializers.serialize(object.hook1Count,
          specifiedType: const FullType(int)),
      'hook2Count',
      serializers.serialize(object.hook2Count,
          specifiedType: const FullType(int)),
      'hookOrdering',
      serializers.serialize(object.hookOrdering,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ValueWithHooks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithHooksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hook1Count':
          result.hook1Count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'hook2Count':
          result.hook2Count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'hookOrdering':
          result.hookOrdering.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$$ValueSpecialSerializer implements StructuredSerializer<$ValueSpecial> {
  @override
  final Iterable<Type> types = const [$ValueSpecial, _$$ValueSpecial];
  @override
  final String wireName = '\$ValueSpecial';

  @override
  Iterable<Object?> serialize(Serializers serializers, $ValueSpecial object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.aString;
    if (value != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.$mustBeEscaped;
    if (value != null) {
      result
        ..add('\$mustBeEscaped')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  $ValueSpecial deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new $ValueSpecialBuilder();

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
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case '\$mustBeEscaped':
          result.$mustBeEscaped = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final String? aString;
  @override
  final bool? $mustBeEscaped;

  factory _$SimpleValue([void Function(SimpleValueBuilder)? updates]) =>
      (new SimpleValueBuilder()..update(updates))._build();

  _$SimpleValue._({required this.anInt, this.aString, this.$mustBeEscaped})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'SimpleValue', 'anInt');
  }

  @override
  SimpleValue rebuild(void Function(SimpleValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValue &&
        anInt == other.anInt &&
        aString == other.aString &&
        $mustBeEscaped == other.$mustBeEscaped;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, anInt.hashCode), aString.hashCode),
        $mustBeEscaped.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SimpleValue')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('\$mustBeEscaped', $mustBeEscaped))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  bool? _$mustBeEscaped;
  bool? get $mustBeEscaped => _$this._$mustBeEscaped;
  set $mustBeEscaped(bool? $mustBeEscaped) =>
      _$this._$mustBeEscaped = $mustBeEscaped;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$mustBeEscaped = $v.$mustBeEscaped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void Function(SimpleValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SimpleValue build() => _build();

  _$SimpleValue _build() {
    final _$result = _$v ??
        new _$SimpleValue._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'SimpleValue', 'anInt'),
            aString: aString,
            $mustBeEscaped: $mustBeEscaped);
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValue extends CompoundValue {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValue([void Function(CompoundValueBuilder)? updates]) =>
      (new CompoundValueBuilder()..update(updates))._build();

  _$CompoundValue._({required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValue', 'simpleValue');
  }

  @override
  CompoundValue rebuild(void Function(CompoundValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValue &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValue')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  _$CompoundValue? _$v;

  SimpleValueBuilder? _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValueBuilder? _validatedValue;
  ValidatedValueBuilder get validatedValue =>
      _$this._validatedValue ??= new ValidatedValueBuilder();
  set validatedValue(ValidatedValueBuilder? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueBuilder();

  CompoundValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue.toBuilder();
      _validatedValue = $v.validatedValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValue;
  }

  @override
  void update(void Function(CompoundValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValue build() => _build();

  _$CompoundValue _build() {
    _$CompoundValue _$result;
    try {
      _$result = _$v ??
          new _$CompoundValue._(
              simpleValue: simpleValue.build(),
              validatedValue: _validatedValue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
        _$failedField = 'validatedValue';
        _validatedValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueNoNesting extends CompoundValueNoNesting {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValueNoNesting(
          [void Function(CompoundValueNoNestingBuilder)? updates]) =>
      (new CompoundValueNoNestingBuilder()..update(updates))._build();

  _$CompoundValueNoNesting._({required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValueNoNesting', 'simpleValue');
  }

  @override
  CompoundValueNoNesting rebuild(
          void Function(CompoundValueNoNestingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNoNestingBuilder toBuilder() =>
      new CompoundValueNoNestingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNoNesting &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueNoNesting')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueNoNestingBuilder
    implements Builder<CompoundValueNoNesting, CompoundValueNoNestingBuilder> {
  _$CompoundValueNoNesting? _$v;

  SimpleValue? _simpleValue;
  SimpleValue? get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValue? _validatedValue;
  ValidatedValue? get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueNoNestingBuilder();

  CompoundValueNoNestingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue;
      _validatedValue = $v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoNesting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNoNesting;
  }

  @override
  void update(void Function(CompoundValueNoNestingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueNoNesting build() => _build();

  _$CompoundValueNoNesting _build() {
    final _$result = _$v ??
        new _$CompoundValueNoNesting._(
            simpleValue: BuiltValueNullFieldError.checkNotNull(
                simpleValue, r'CompoundValueNoNesting', 'simpleValue'),
            validatedValue: validatedValue);
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueNoAutoNesting extends CompoundValueNoAutoNesting {
  @override
  final NoFieldsValue value;

  factory _$CompoundValueNoAutoNesting(
          [void Function(CompoundValueNoAutoNestingBuilder)? updates]) =>
      (new CompoundValueNoAutoNestingBuilder()..update(updates))._build();

  _$CompoundValueNoAutoNesting._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'CompoundValueNoAutoNesting', 'value');
  }

  @override
  CompoundValueNoAutoNesting rebuild(
          void Function(CompoundValueNoAutoNestingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNoAutoNestingBuilder toBuilder() =>
      new CompoundValueNoAutoNestingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNoAutoNesting && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueNoAutoNesting')
          ..add('value', value))
        .toString();
  }
}

class CompoundValueNoAutoNestingBuilder
    implements
        Builder<CompoundValueNoAutoNesting, CompoundValueNoAutoNestingBuilder> {
  _$CompoundValueNoAutoNesting? _$v;

  NoFieldsValueBuilder? _value;
  NoFieldsValueBuilder? get value => _$this._value;
  set value(NoFieldsValueBuilder? value) => _$this._value = value;

  CompoundValueNoAutoNestingBuilder();

  CompoundValueNoAutoNestingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoAutoNesting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNoAutoNesting;
  }

  @override
  void update(void Function(CompoundValueNoAutoNestingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueNoAutoNesting build() => _build();

  _$CompoundValueNoAutoNesting _build() {
    _$CompoundValueNoAutoNesting _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueNoAutoNesting._(
              value: BuiltValueNullFieldError.checkNotNull(
                  _value?.build(), r'CompoundValueNoAutoNesting', 'value'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        _value?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValueNoAutoNesting', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueComparableBuilders
    extends CompoundValueComparableBuilders {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValueComparableBuilders(
          [void Function(CompoundValueComparableBuildersBuilder)? updates]) =>
      (new CompoundValueComparableBuildersBuilder()..update(updates))._build();

  _$CompoundValueComparableBuilders._(
      {required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValueComparableBuilders', 'simpleValue');
  }

  @override
  CompoundValueComparableBuilders rebuild(
          void Function(CompoundValueComparableBuildersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueComparableBuildersBuilder toBuilder() =>
      new CompoundValueComparableBuildersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueComparableBuilders &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueComparableBuilders')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueComparableBuildersBuilder
    implements
        Builder<CompoundValueComparableBuilders,
            CompoundValueComparableBuildersBuilder> {
  _$CompoundValueComparableBuilders? _$v;

  SimpleValue? _simpleValue;
  SimpleValue? get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValue? _validatedValue;
  ValidatedValue? get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue? validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueComparableBuildersBuilder();

  CompoundValueComparableBuildersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue;
      _validatedValue = $v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueComparableBuilders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueComparableBuilders;
  }

  @override
  void update(void Function(CompoundValueComparableBuildersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueComparableBuilders build() => _build();

  _$CompoundValueComparableBuilders _build() {
    final _$result = _$v ??
        new _$CompoundValueComparableBuilders._(
            simpleValue: BuiltValueNullFieldError.checkNotNull(
                simpleValue, r'CompoundValueComparableBuilders', 'simpleValue'),
            validatedValue: validatedValue);
    replace(_$result);
    return _$result;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueComparableBuildersBuilder &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(1, simpleValue.hashCode), validatedValue.hashCode));
  }
}

class _$CompoundValueNoNestingField extends CompoundValueNoNestingField {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;
  @override
  final SimpleValue simpleValueWithNested;
  @override
  final ValidatedValue? validatedValueWithNested;

  factory _$CompoundValueNoNestingField(
          [void Function(CompoundValueNoNestingFieldBuilder)? updates]) =>
      (new CompoundValueNoNestingFieldBuilder()..update(updates))._build();

  _$CompoundValueNoNestingField._(
      {required this.simpleValue,
      this.validatedValue,
      required this.simpleValueWithNested,
      this.validatedValueWithNested})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValueNoNestingField', 'simpleValue');
    BuiltValueNullFieldError.checkNotNull(simpleValueWithNested,
        r'CompoundValueNoNestingField', 'simpleValueWithNested');
  }

  @override
  CompoundValueNoNestingField rebuild(
          void Function(CompoundValueNoNestingFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNoNestingFieldBuilder toBuilder() =>
      new CompoundValueNoNestingFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNoNestingField &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue &&
        simpleValueWithNested == other.simpleValueWithNested &&
        validatedValueWithNested == other.validatedValueWithNested;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode),
            simpleValueWithNested.hashCode),
        validatedValueWithNested.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueNoNestingField')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue)
          ..add('simpleValueWithNested', simpleValueWithNested)
          ..add('validatedValueWithNested', validatedValueWithNested))
        .toString();
  }
}

class CompoundValueNoNestingFieldBuilder
    implements
        Builder<CompoundValueNoNestingField,
            CompoundValueNoNestingFieldBuilder> {
  _$CompoundValueNoNestingField? _$v;

  SimpleValue? _simpleValue;
  SimpleValue? get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValue? _validatedValue;
  ValidatedValue? get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue? validatedValue) =>
      _$this._validatedValue = validatedValue;

  SimpleValueBuilder? _simpleValueWithNested;
  SimpleValueBuilder get simpleValueWithNested =>
      _$this._simpleValueWithNested ??= new SimpleValueBuilder();
  set simpleValueWithNested(SimpleValueBuilder? simpleValueWithNested) =>
      _$this._simpleValueWithNested = simpleValueWithNested;

  ValidatedValueBuilder? _validatedValueWithNested;
  ValidatedValueBuilder get validatedValueWithNested =>
      _$this._validatedValueWithNested ??= new ValidatedValueBuilder();
  set validatedValueWithNested(
          ValidatedValueBuilder? validatedValueWithNested) =>
      _$this._validatedValueWithNested = validatedValueWithNested;

  CompoundValueNoNestingFieldBuilder();

  CompoundValueNoNestingFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue;
      _validatedValue = $v.validatedValue;
      _simpleValueWithNested = $v.simpleValueWithNested.toBuilder();
      _validatedValueWithNested = $v.validatedValueWithNested?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoNestingField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNoNestingField;
  }

  @override
  void update(void Function(CompoundValueNoNestingFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueNoNestingField build() => _build();

  _$CompoundValueNoNestingField _build() {
    _$CompoundValueNoNestingField _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueNoNestingField._(
              simpleValue: BuiltValueNullFieldError.checkNotNull(
                  simpleValue, r'CompoundValueNoNestingField', 'simpleValue'),
              validatedValue: validatedValue,
              simpleValueWithNested: simpleValueWithNested.build(),
              validatedValueWithNested: _validatedValueWithNested?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValueWithNested';
        simpleValueWithNested.build();
        _$failedField = 'validatedValueWithNested';
        _validatedValueWithNested?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValueNoNestingField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueNestingField extends CompoundValueNestingField {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;
  @override
  final SimpleValue simpleValueWithNested;
  @override
  final ValidatedValue? validatedValueWithNested;

  factory _$CompoundValueNestingField(
          [void Function(CompoundValueNestingFieldBuilder)? updates]) =>
      (new CompoundValueNestingFieldBuilder()..update(updates))._build();

  _$CompoundValueNestingField._(
      {required this.simpleValue,
      this.validatedValue,
      required this.simpleValueWithNested,
      this.validatedValueWithNested})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValueNestingField', 'simpleValue');
    BuiltValueNullFieldError.checkNotNull(simpleValueWithNested,
        r'CompoundValueNestingField', 'simpleValueWithNested');
  }

  @override
  CompoundValueNestingField rebuild(
          void Function(CompoundValueNestingFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNestingFieldBuilder toBuilder() =>
      new CompoundValueNestingFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNestingField &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue &&
        simpleValueWithNested == other.simpleValueWithNested &&
        validatedValueWithNested == other.validatedValueWithNested;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode),
            simpleValueWithNested.hashCode),
        validatedValueWithNested.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueNestingField')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue)
          ..add('simpleValueWithNested', simpleValueWithNested)
          ..add('validatedValueWithNested', validatedValueWithNested))
        .toString();
  }
}

class CompoundValueNestingFieldBuilder
    implements
        Builder<CompoundValueNestingField, CompoundValueNestingFieldBuilder> {
  _$CompoundValueNestingField? _$v;

  SimpleValue? _simpleValue;
  SimpleValue? get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue? simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValue? _validatedValue;
  ValidatedValue? get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue? validatedValue) =>
      _$this._validatedValue = validatedValue;

  SimpleValueBuilder? _simpleValueWithNested;
  SimpleValueBuilder get simpleValueWithNested =>
      _$this._simpleValueWithNested ??= new SimpleValueBuilder();
  set simpleValueWithNested(SimpleValueBuilder? simpleValueWithNested) =>
      _$this._simpleValueWithNested = simpleValueWithNested;

  ValidatedValueBuilder? _validatedValueWithNested;
  ValidatedValueBuilder get validatedValueWithNested =>
      _$this._validatedValueWithNested ??= new ValidatedValueBuilder();
  set validatedValueWithNested(
          ValidatedValueBuilder? validatedValueWithNested) =>
      _$this._validatedValueWithNested = validatedValueWithNested;

  CompoundValueNestingFieldBuilder();

  CompoundValueNestingFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue;
      _validatedValue = $v.validatedValue;
      _simpleValueWithNested = $v.simpleValueWithNested.toBuilder();
      _validatedValueWithNested = $v.validatedValueWithNested?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNestingField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNestingField;
  }

  @override
  void update(void Function(CompoundValueNestingFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueNestingField build() => _build();

  _$CompoundValueNestingField _build() {
    _$CompoundValueNestingField _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueNestingField._(
              simpleValue: BuiltValueNullFieldError.checkNotNull(
                  simpleValue, r'CompoundValueNestingField', 'simpleValue'),
              validatedValue: validatedValue,
              simpleValueWithNested: simpleValueWithNested.build(),
              validatedValueWithNested: _validatedValueWithNested?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValueWithNested';
        simpleValueWithNested.build();
        _$failedField = 'validatedValueWithNested';
        _validatedValueWithNested?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValueNestingField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueNoAutoNestingField
    extends CompoundValueNoAutoNestingField {
  @override
  final NoFieldsValue value;
  @override
  final NoFieldsValue valueWithAutoCreate;

  factory _$CompoundValueNoAutoNestingField(
          [void Function(CompoundValueNoAutoNestingFieldBuilder)? updates]) =>
      (new CompoundValueNoAutoNestingFieldBuilder()..update(updates))._build();

  _$CompoundValueNoAutoNestingField._(
      {required this.value, required this.valueWithAutoCreate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'CompoundValueNoAutoNestingField', 'value');
    BuiltValueNullFieldError.checkNotNull(valueWithAutoCreate,
        r'CompoundValueNoAutoNestingField', 'valueWithAutoCreate');
  }

  @override
  CompoundValueNoAutoNestingField rebuild(
          void Function(CompoundValueNoAutoNestingFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueNoAutoNestingFieldBuilder toBuilder() =>
      new CompoundValueNoAutoNestingFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueNoAutoNestingField &&
        value == other.value &&
        valueWithAutoCreate == other.valueWithAutoCreate;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), valueWithAutoCreate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueNoAutoNestingField')
          ..add('value', value)
          ..add('valueWithAutoCreate', valueWithAutoCreate))
        .toString();
  }
}

class CompoundValueNoAutoNestingFieldBuilder
    implements
        Builder<CompoundValueNoAutoNestingField,
            CompoundValueNoAutoNestingFieldBuilder> {
  _$CompoundValueNoAutoNestingField? _$v;

  NoFieldsValueBuilder? _value;
  NoFieldsValueBuilder? get value => _$this._value;
  set value(NoFieldsValueBuilder? value) => _$this._value = value;

  NoFieldsValueBuilder? _valueWithAutoCreate;
  NoFieldsValueBuilder get valueWithAutoCreate =>
      _$this._valueWithAutoCreate ??= new NoFieldsValueBuilder();
  set valueWithAutoCreate(NoFieldsValueBuilder? valueWithAutoCreate) =>
      _$this._valueWithAutoCreate = valueWithAutoCreate;

  CompoundValueNoAutoNestingFieldBuilder();

  CompoundValueNoAutoNestingFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _valueWithAutoCreate = $v.valueWithAutoCreate.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoAutoNestingField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueNoAutoNestingField;
  }

  @override
  void update(void Function(CompoundValueNoAutoNestingFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueNoAutoNestingField build() => _build();

  _$CompoundValueNoAutoNestingField _build() {
    _$CompoundValueNoAutoNestingField _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueNoAutoNestingField._(
              value: BuiltValueNullFieldError.checkNotNull(
                  _value?.build(), r'CompoundValueNoAutoNestingField', 'value'),
              valueWithAutoCreate: valueWithAutoCreate.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        _value?.build();
        _$failedField = 'valueWithAutoCreate';
        valueWithAutoCreate.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValueNoAutoNestingField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueAutoNestingField extends CompoundValueAutoNestingField {
  @override
  final NoFieldsValue value;
  @override
  final NoFieldsValue valueWithAutoCreate;

  factory _$CompoundValueAutoNestingField(
          [void Function(CompoundValueAutoNestingFieldBuilder)? updates]) =>
      (new CompoundValueAutoNestingFieldBuilder()..update(updates))._build();

  _$CompoundValueAutoNestingField._(
      {required this.value, required this.valueWithAutoCreate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'CompoundValueAutoNestingField', 'value');
    BuiltValueNullFieldError.checkNotNull(valueWithAutoCreate,
        r'CompoundValueAutoNestingField', 'valueWithAutoCreate');
  }

  @override
  CompoundValueAutoNestingField rebuild(
          void Function(CompoundValueAutoNestingFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueAutoNestingFieldBuilder toBuilder() =>
      new CompoundValueAutoNestingFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueAutoNestingField &&
        value == other.value &&
        valueWithAutoCreate == other.valueWithAutoCreate;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), valueWithAutoCreate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueAutoNestingField')
          ..add('value', value)
          ..add('valueWithAutoCreate', valueWithAutoCreate))
        .toString();
  }
}

class CompoundValueAutoNestingFieldBuilder
    implements
        Builder<CompoundValueAutoNestingField,
            CompoundValueAutoNestingFieldBuilder> {
  _$CompoundValueAutoNestingField? _$v;

  NoFieldsValueBuilder? _value;
  NoFieldsValueBuilder get value =>
      _$this._value ??= new NoFieldsValueBuilder();
  set value(NoFieldsValueBuilder? value) => _$this._value = value;

  NoFieldsValueBuilder? _valueWithAutoCreate;
  NoFieldsValueBuilder get valueWithAutoCreate =>
      _$this._valueWithAutoCreate ??= new NoFieldsValueBuilder();
  set valueWithAutoCreate(NoFieldsValueBuilder? valueWithAutoCreate) =>
      _$this._valueWithAutoCreate = valueWithAutoCreate;

  CompoundValueAutoNestingFieldBuilder();

  CompoundValueAutoNestingFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _valueWithAutoCreate = $v.valueWithAutoCreate.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueAutoNestingField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueAutoNestingField;
  }

  @override
  void update(void Function(CompoundValueAutoNestingFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueAutoNestingField build() => _build();

  _$CompoundValueAutoNestingField _build() {
    _$CompoundValueAutoNestingField _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueAutoNestingField._(
              value: value.build(),
              valueWithAutoCreate: valueWithAutoCreate.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
        _$failedField = 'valueWithAutoCreate';
        valueWithAutoCreate.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValueAutoNestingField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueExplicitNoNesting extends CompoundValueExplicitNoNesting {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue? validatedValue;

  factory _$CompoundValueExplicitNoNesting(
          [void Function(CompoundValueExplicitNoNestingBuilder)? updates]) =>
      (new CompoundValueExplicitNoNestingBuilder()..update(updates)).build()
          as _$CompoundValueExplicitNoNesting;

  _$CompoundValueExplicitNoNesting._(
      {required this.simpleValue, this.validatedValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValueExplicitNoNesting', 'simpleValue');
  }

  @override
  CompoundValueExplicitNoNesting rebuild(
          void Function(CompoundValueExplicitNoNestingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$CompoundValueExplicitNoNestingBuilder toBuilder() =>
      new _$CompoundValueExplicitNoNestingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValueExplicitNoNesting &&
        simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), validatedValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValueExplicitNoNesting')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class _$CompoundValueExplicitNoNestingBuilder
    extends CompoundValueExplicitNoNestingBuilder {
  _$CompoundValueExplicitNoNesting? _$v;

  @override
  SimpleValueBuilder get simpleValue {
    _$this;
    return super.simpleValue;
  }

  @override
  set simpleValue(SimpleValueBuilder simpleValue) {
    _$this;
    super.simpleValue = simpleValue;
  }

  @override
  ValidatedValue? get validatedValue {
    _$this;
    return super.validatedValue;
  }

  @override
  set validatedValue(ValidatedValue? validatedValue) {
    _$this;
    super.validatedValue = validatedValue;
  }

  _$CompoundValueExplicitNoNestingBuilder() : super._();

  CompoundValueExplicitNoNestingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.simpleValue = $v.simpleValue.toBuilder();
      super.validatedValue = $v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueExplicitNoNesting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValueExplicitNoNesting;
  }

  @override
  void update(void Function(CompoundValueExplicitNoNestingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValueExplicitNoNesting build() => _build();

  _$CompoundValueExplicitNoNesting _build() {
    _$CompoundValueExplicitNoNesting _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueExplicitNoNesting._(
              simpleValue: simpleValue.build(), validatedValue: validatedValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValueExplicitNoNesting', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ExplicitNestedList extends ExplicitNestedList {
  @override
  final BuiltList<BuiltList<int>> nestedList;

  factory _$ExplicitNestedList(
          [void Function(ExplicitNestedListBuilder)? updates]) =>
      (new ExplicitNestedListBuilder()..update(updates)).build()
          as _$ExplicitNestedList;

  _$ExplicitNestedList._({required this.nestedList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nestedList, r'ExplicitNestedList', 'nestedList');
  }

  @override
  ExplicitNestedList rebuild(
          void Function(ExplicitNestedListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ExplicitNestedListBuilder toBuilder() =>
      new _$ExplicitNestedListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExplicitNestedList && nestedList == other.nestedList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, nestedList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExplicitNestedList')
          ..add('nestedList', nestedList))
        .toString();
  }
}

class _$ExplicitNestedListBuilder extends ExplicitNestedListBuilder {
  _$ExplicitNestedList? _$v;

  @override
  ListBuilder<BuiltList<int>> get nestedList {
    _$this;
    return super.nestedList;
  }

  @override
  set nestedList(ListBuilder<BuiltList<int>> nestedList) {
    _$this;
    super.nestedList = nestedList;
  }

  _$ExplicitNestedListBuilder() : super._();

  ExplicitNestedListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.nestedList = $v.nestedList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplicitNestedList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExplicitNestedList;
  }

  @override
  void update(void Function(ExplicitNestedListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExplicitNestedList build() => _build();

  _$ExplicitNestedList _build() {
    _$ExplicitNestedList _$result;
    try {
      _$result =
          _$v ?? new _$ExplicitNestedList._(nestedList: nestedList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nestedList';
        nestedList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExplicitNestedList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ExplicitNonNullBuilderNullableSetter
    extends ExplicitNonNullBuilderNullableSetter {
  @override
  final SimpleValue? simpleValue;

  factory _$ExplicitNonNullBuilderNullableSetter(
          [void Function(ExplicitNonNullBuilderNullableSetterBuilder)?
              updates]) =>
      (new ExplicitNonNullBuilderNullableSetterBuilder()..update(updates))
          .build() as _$ExplicitNonNullBuilderNullableSetter;

  _$ExplicitNonNullBuilderNullableSetter._({this.simpleValue}) : super._();

  @override
  ExplicitNonNullBuilderNullableSetter rebuild(
          void Function(ExplicitNonNullBuilderNullableSetterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ExplicitNonNullBuilderNullableSetterBuilder toBuilder() =>
      new _$ExplicitNonNullBuilderNullableSetterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExplicitNonNullBuilderNullableSetter &&
        simpleValue == other.simpleValue;
  }

  @override
  int get hashCode {
    return $jf($jc(0, simpleValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExplicitNonNullBuilderNullableSetter')
          ..add('simpleValue', simpleValue))
        .toString();
  }
}

class _$ExplicitNonNullBuilderNullableSetterBuilder
    extends ExplicitNonNullBuilderNullableSetterBuilder {
  _$ExplicitNonNullBuilderNullableSetter? _$v;

  SimpleValueBuilder? _simpleValue;
  @override
  SimpleValueBuilder get simpleValue {
    _$this;
    return _simpleValue ??= new SimpleValueBuilder();
  }

  @override
  set simpleValue(SimpleValueBuilder? simpleValue) {
    _$this;
    _simpleValue = simpleValue;
  }

  _$ExplicitNonNullBuilderNullableSetterBuilder() : super._();

  ExplicitNonNullBuilderNullableSetterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplicitNonNullBuilderNullableSetter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExplicitNonNullBuilderNullableSetter;
  }

  @override
  void update(
      void Function(ExplicitNonNullBuilderNullableSetterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExplicitNonNullBuilderNullableSetter build() => _build();

  _$ExplicitNonNullBuilderNullableSetter _build() {
    _$ExplicitNonNullBuilderNullableSetter _$result;
    try {
      _$result = _$v ??
          new _$ExplicitNonNullBuilderNullableSetter._(
              simpleValue: _simpleValue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        _simpleValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExplicitNonNullBuilderNullableSetter',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ExplicitNonNullBuilderNullableField
    extends ExplicitNonNullBuilderNullableField {
  @override
  final SimpleValue? simpleValue;

  factory _$ExplicitNonNullBuilderNullableField(
          [void Function(ExplicitNonNullBuilderNullableFieldBuilder)?
              updates]) =>
      (new ExplicitNonNullBuilderNullableFieldBuilder()..update(updates))
          .build() as _$ExplicitNonNullBuilderNullableField;

  _$ExplicitNonNullBuilderNullableField._({this.simpleValue}) : super._();

  @override
  ExplicitNonNullBuilderNullableField rebuild(
          void Function(ExplicitNonNullBuilderNullableFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ExplicitNonNullBuilderNullableFieldBuilder toBuilder() =>
      new _$ExplicitNonNullBuilderNullableFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExplicitNonNullBuilderNullableField &&
        simpleValue == other.simpleValue;
  }

  @override
  int get hashCode {
    return $jf($jc(0, simpleValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExplicitNonNullBuilderNullableField')
          ..add('simpleValue', simpleValue))
        .toString();
  }
}

class _$ExplicitNonNullBuilderNullableFieldBuilder
    extends ExplicitNonNullBuilderNullableFieldBuilder {
  _$ExplicitNonNullBuilderNullableField? _$v;

  @override
  SimpleValueBuilder get simpleValue {
    _$this;
    return super.simpleValue ??= new SimpleValueBuilder();
  }

  @override
  set simpleValue(SimpleValueBuilder? simpleValue) {
    _$this;
    super.simpleValue = simpleValue;
  }

  _$ExplicitNonNullBuilderNullableFieldBuilder() : super._();

  ExplicitNonNullBuilderNullableFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.simpleValue = $v.simpleValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplicitNonNullBuilderNullableField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExplicitNonNullBuilderNullableField;
  }

  @override
  void update(
      void Function(ExplicitNonNullBuilderNullableFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExplicitNonNullBuilderNullableField build() => _build();

  _$ExplicitNonNullBuilderNullableField _build() {
    _$ExplicitNonNullBuilderNullableField _$result;
    try {
      _$result = _$v ??
          new _$ExplicitNonNullBuilderNullableField._(
              simpleValue: super.simpleValue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        super.simpleValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExplicitNonNullBuilderNullableField',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DerivedValue extends DerivedValue {
  @override
  final int anInt;
  int? __derivedValue;
  Iterable<String>? __derivedString;
  int? __nullableDerivedValue;
  bool ___nullableDerivedValue = false;

  factory _$DerivedValue([void Function(DerivedValueBuilder)? updates]) =>
      (new DerivedValueBuilder()..update(updates))._build();

  _$DerivedValue._({required this.anInt}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'DerivedValue', 'anInt');
  }

  @override
  int get derivedValue => __derivedValue ??= super.derivedValue;

  @override
  Iterable<String> get derivedString => __derivedString ??= super.derivedString;

  @override
  int? get nullableDerivedValue {
    if (!___nullableDerivedValue) {
      __nullableDerivedValue = super.nullableDerivedValue;
      ___nullableDerivedValue = true;
    }
    return __nullableDerivedValue;
  }

  @override
  DerivedValue rebuild(void Function(DerivedValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DerivedValueBuilder toBuilder() => new DerivedValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DerivedValue && anInt == other.anInt;
  }

  @override
  int get hashCode {
    return $jf($jc(0, anInt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DerivedValue')..add('anInt', anInt))
        .toString();
  }
}

class DerivedValueBuilder
    implements Builder<DerivedValue, DerivedValueBuilder> {
  _$DerivedValue? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  DerivedValueBuilder();

  DerivedValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DerivedValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DerivedValue;
  }

  @override
  void update(void Function(DerivedValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DerivedValue build() => _build();

  _$DerivedValue _build() {
    final _$result = _$v ??
        new _$DerivedValue._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'DerivedValue', 'anInt'));
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithCode extends ValueWithCode {
  @override
  final int anInt;
  @override
  final String? aString;

  factory _$ValueWithCode([void Function(ValueWithCodeBuilder)? updates]) =>
      (new ValueWithCodeBuilder()..update(updates))._build();

  _$ValueWithCode._({required this.anInt, this.aString}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'ValueWithCode', 'anInt');
  }

  @override
  ValueWithCode rebuild(void Function(ValueWithCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithCodeBuilder toBuilder() => new ValueWithCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithCode &&
        anInt == other.anInt &&
        aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithCode')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
  }
}

class ValueWithCodeBuilder
    implements Builder<ValueWithCode, ValueWithCodeBuilder> {
  _$ValueWithCode? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  ValueWithCodeBuilder();

  ValueWithCodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithCode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithCode;
  }

  @override
  void update(void Function(ValueWithCodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithCode build() => _build();

  _$ValueWithCode _build() {
    final _$result = _$v ??
        new _$ValueWithCode._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'ValueWithCode', 'anInt'),
            aString: aString);
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithDefaults extends ValueWithDefaults {
  @override
  final int anInt;
  @override
  final String? aString;
  @override
  final SimpleValue value;

  factory _$ValueWithDefaults(
          [void Function(ValueWithDefaultsBuilder)? updates]) =>
      (new ValueWithDefaultsBuilder()..update(updates)).build()
          as _$ValueWithDefaults;

  _$ValueWithDefaults._(
      {required this.anInt, this.aString, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'ValueWithDefaults', 'anInt');
    BuiltValueNullFieldError.checkNotNull(value, r'ValueWithDefaults', 'value');
  }

  @override
  ValueWithDefaults rebuild(void Function(ValueWithDefaultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueWithDefaultsBuilder toBuilder() =>
      new _$ValueWithDefaultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithDefaults &&
        anInt == other.anInt &&
        aString == other.aString &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, anInt.hashCode), aString.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithDefaults')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('value', value))
        .toString();
  }
}

class _$ValueWithDefaultsBuilder extends ValueWithDefaultsBuilder {
  _$ValueWithDefaults? _$v;

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
  String? get aString {
    _$this;
    return super.aString;
  }

  @override
  set aString(String? aString) {
    _$this;
    super.aString = aString;
  }

  @override
  SimpleValueBuilder get value {
    _$this;
    return super.value;
  }

  @override
  set value(SimpleValueBuilder value) {
    _$this;
    super.value = value;
  }

  _$ValueWithDefaultsBuilder() : super._();

  ValueWithDefaultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.anInt = $v.anInt;
      super.aString = $v.aString;
      super.value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithDefaults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithDefaults;
  }

  @override
  void update(void Function(ValueWithDefaultsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithDefaults build() => _build();

  _$ValueWithDefaults _build() {
    _$ValueWithDefaults _$result;
    try {
      _$result = _$v ??
          new _$ValueWithDefaults._(
              anInt: BuiltValueNullFieldError.checkNotNull(
                  anInt, r'ValueWithDefaults', 'anInt'),
              aString: aString,
              value: value.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ValueWithDefaults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithBuilderSmarts extends ValueWithBuilderSmarts {
  @override
  final String value;

  factory _$ValueWithBuilderSmarts(
          [void Function(ValueWithBuilderSmartsBuilder)? updates]) =>
      (new ValueWithBuilderSmartsBuilder()..update(updates)).build()
          as _$ValueWithBuilderSmarts;

  _$ValueWithBuilderSmarts._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'ValueWithBuilderSmarts', 'value');
  }

  @override
  ValueWithBuilderSmarts rebuild(
          void Function(ValueWithBuilderSmartsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueWithBuilderSmartsBuilder toBuilder() =>
      new _$ValueWithBuilderSmartsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithBuilderSmarts && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithBuilderSmarts')
          ..add('value', value))
        .toString();
  }
}

class _$ValueWithBuilderSmartsBuilder extends ValueWithBuilderSmartsBuilder {
  _$ValueWithBuilderSmarts? _$v;

  @override
  String get value {
    _$this;
    return super.value;
  }

  @override
  set value(String value) {
    _$this;
    super.value = value;
  }

  _$ValueWithBuilderSmartsBuilder() : super._();

  ValueWithBuilderSmartsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithBuilderSmarts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithBuilderSmarts;
  }

  @override
  void update(void Function(ValueWithBuilderSmartsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithBuilderSmarts build() => _build();

  _$ValueWithBuilderSmarts _build() {
    final _$result = _$v ??
        new _$ValueWithBuilderSmarts._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ValueWithBuilderSmarts', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$ValidatedValue extends ValidatedValue {
  @override
  final int anInt;
  @override
  final String? aString;

  factory _$ValidatedValue([void Function(ValidatedValueBuilder)? updates]) =>
      (new ValidatedValueBuilder()..update(updates))._build();

  _$ValidatedValue._({required this.anInt, this.aString}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'ValidatedValue', 'anInt');
  }

  @override
  ValidatedValue rebuild(void Function(ValidatedValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidatedValueBuilder toBuilder() =>
      new ValidatedValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidatedValue &&
        anInt == other.anInt &&
        aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValidatedValue')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
  }
}

class ValidatedValueBuilder
    implements Builder<ValidatedValue, ValidatedValueBuilder> {
  _$ValidatedValue? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  ValidatedValueBuilder();

  ValidatedValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidatedValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValidatedValue;
  }

  @override
  void update(void Function(ValidatedValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValidatedValue build() => _build();

  _$ValidatedValue _build() {
    final _$result = _$v ??
        new _$ValidatedValue._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'ValidatedValue', 'anInt'),
            aString: aString);
    replace(_$result);
    return _$result;
  }
}

class _$ValueUsingImportAs extends ValueUsingImportAs {
  @override
  final using_import_as.TestEnum value;
  @override
  final using_import_as.TestEnum? nullableValue;

  factory _$ValueUsingImportAs(
          [void Function(ValueUsingImportAsBuilder)? updates]) =>
      (new ValueUsingImportAsBuilder()..update(updates))._build();

  _$ValueUsingImportAs._({required this.value, this.nullableValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'ValueUsingImportAs', 'value');
  }

  @override
  ValueUsingImportAs rebuild(
          void Function(ValueUsingImportAsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueUsingImportAsBuilder toBuilder() =>
      new ValueUsingImportAsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueUsingImportAs &&
        value == other.value &&
        nullableValue == other.nullableValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), nullableValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueUsingImportAs')
          ..add('value', value)
          ..add('nullableValue', nullableValue))
        .toString();
  }
}

class ValueUsingImportAsBuilder
    implements Builder<ValueUsingImportAs, ValueUsingImportAsBuilder> {
  _$ValueUsingImportAs? _$v;

  using_import_as.TestEnum? _value;
  using_import_as.TestEnum? get value => _$this._value;
  set value(using_import_as.TestEnum? value) => _$this._value = value;

  using_import_as.TestEnum? _nullableValue;
  using_import_as.TestEnum? get nullableValue => _$this._nullableValue;
  set nullableValue(using_import_as.TestEnum? nullableValue) =>
      _$this._nullableValue = nullableValue;

  ValueUsingImportAsBuilder();

  ValueUsingImportAsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _nullableValue = $v.nullableValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueUsingImportAs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueUsingImportAs;
  }

  @override
  void update(void Function(ValueUsingImportAsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueUsingImportAs build() => _build();

  _$ValueUsingImportAs _build() {
    final _$result = _$v ??
        new _$ValueUsingImportAs._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ValueUsingImportAs', 'value'),
            nullableValue: nullableValue);
    replace(_$result);
    return _$result;
  }
}

class _$NoFieldsValue extends NoFieldsValue {
  factory _$NoFieldsValue([void Function(NoFieldsValueBuilder)? updates]) =>
      (new NoFieldsValueBuilder()..update(updates))._build();

  _$NoFieldsValue._() : super._();

  @override
  NoFieldsValue rebuild(void Function(NoFieldsValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoFieldsValueBuilder toBuilder() => new NoFieldsValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoFieldsValue;
  }

  @override
  int get hashCode {
    return 601485316;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'NoFieldsValue').toString();
  }
}

class NoFieldsValueBuilder
    implements Builder<NoFieldsValue, NoFieldsValueBuilder> {
  _$NoFieldsValue? _$v;

  NoFieldsValueBuilder();

  @override
  void replace(NoFieldsValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NoFieldsValue;
  }

  @override
  void update(void Function(NoFieldsValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NoFieldsValue build() => _build();

  _$NoFieldsValue _build() {
    final _$result = _$v ?? new _$NoFieldsValue._();
    replace(_$result);
    return _$result;
  }
}

class _$PrimitivesValue extends PrimitivesValue {
  @override
  final bool boolean;
  @override
  final int integer;
  @override
  final Int64 int64;
  @override
  final double dbl;
  @override
  final num number;
  @override
  final String string;
  @override
  final DateTime dateTime;
  @override
  final Duration duration;
  @override
  final RegExp regExp;
  @override
  final Uri uri;
  @override
  final BigInt bigInt;

  factory _$PrimitivesValue([void Function(PrimitivesValueBuilder)? updates]) =>
      (new PrimitivesValueBuilder()..update(updates))._build();

  _$PrimitivesValue._(
      {required this.boolean,
      required this.integer,
      required this.int64,
      required this.dbl,
      required this.number,
      required this.string,
      required this.dateTime,
      required this.duration,
      required this.regExp,
      required this.uri,
      required this.bigInt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        boolean, r'PrimitivesValue', 'boolean');
    BuiltValueNullFieldError.checkNotNull(
        integer, r'PrimitivesValue', 'integer');
    BuiltValueNullFieldError.checkNotNull(int64, r'PrimitivesValue', 'int64');
    BuiltValueNullFieldError.checkNotNull(dbl, r'PrimitivesValue', 'dbl');
    BuiltValueNullFieldError.checkNotNull(number, r'PrimitivesValue', 'number');
    BuiltValueNullFieldError.checkNotNull(string, r'PrimitivesValue', 'string');
    BuiltValueNullFieldError.checkNotNull(
        dateTime, r'PrimitivesValue', 'dateTime');
    BuiltValueNullFieldError.checkNotNull(
        duration, r'PrimitivesValue', 'duration');
    BuiltValueNullFieldError.checkNotNull(regExp, r'PrimitivesValue', 'regExp');
    BuiltValueNullFieldError.checkNotNull(uri, r'PrimitivesValue', 'uri');
    BuiltValueNullFieldError.checkNotNull(bigInt, r'PrimitivesValue', 'bigInt');
  }

  @override
  PrimitivesValue rebuild(void Function(PrimitivesValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrimitivesValueBuilder toBuilder() =>
      new PrimitivesValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrimitivesValue &&
        boolean == other.boolean &&
        integer == other.integer &&
        int64 == other.int64 &&
        dbl == other.dbl &&
        number == other.number &&
        string == other.string &&
        dateTime == other.dateTime &&
        duration == other.duration &&
        regExp == other.regExp &&
        uri == other.uri &&
        bigInt == other.bigInt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, boolean.hashCode),
                                            integer.hashCode),
                                        int64.hashCode),
                                    dbl.hashCode),
                                number.hashCode),
                            string.hashCode),
                        dateTime.hashCode),
                    duration.hashCode),
                regExp.hashCode),
            uri.hashCode),
        bigInt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PrimitivesValue')
          ..add('boolean', boolean)
          ..add('integer', integer)
          ..add('int64', int64)
          ..add('dbl', dbl)
          ..add('number', number)
          ..add('string', string)
          ..add('dateTime', dateTime)
          ..add('duration', duration)
          ..add('regExp', regExp)
          ..add('uri', uri)
          ..add('bigInt', bigInt))
        .toString();
  }
}

class PrimitivesValueBuilder
    implements Builder<PrimitivesValue, PrimitivesValueBuilder> {
  _$PrimitivesValue? _$v;

  bool? _boolean;
  bool? get boolean => _$this._boolean;
  set boolean(bool? boolean) => _$this._boolean = boolean;

  int? _integer;
  int? get integer => _$this._integer;
  set integer(int? integer) => _$this._integer = integer;

  Int64? _int64;
  Int64? get int64 => _$this._int64;
  set int64(Int64? int64) => _$this._int64 = int64;

  double? _dbl;
  double? get dbl => _$this._dbl;
  set dbl(double? dbl) => _$this._dbl = dbl;

  num? _number;
  num? get number => _$this._number;
  set number(num? number) => _$this._number = number;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  DateTime? _dateTime;
  DateTime? get dateTime => _$this._dateTime;
  set dateTime(DateTime? dateTime) => _$this._dateTime = dateTime;

  Duration? _duration;
  Duration? get duration => _$this._duration;
  set duration(Duration? duration) => _$this._duration = duration;

  RegExp? _regExp;
  RegExp? get regExp => _$this._regExp;
  set regExp(RegExp? regExp) => _$this._regExp = regExp;

  Uri? _uri;
  Uri? get uri => _$this._uri;
  set uri(Uri? uri) => _$this._uri = uri;

  BigInt? _bigInt;
  BigInt? get bigInt => _$this._bigInt;
  set bigInt(BigInt? bigInt) => _$this._bigInt = bigInt;

  PrimitivesValueBuilder();

  PrimitivesValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _boolean = $v.boolean;
      _integer = $v.integer;
      _int64 = $v.int64;
      _dbl = $v.dbl;
      _number = $v.number;
      _string = $v.string;
      _dateTime = $v.dateTime;
      _duration = $v.duration;
      _regExp = $v.regExp;
      _uri = $v.uri;
      _bigInt = $v.bigInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrimitivesValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrimitivesValue;
  }

  @override
  void update(void Function(PrimitivesValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PrimitivesValue build() => _build();

  _$PrimitivesValue _build() {
    final _$result = _$v ??
        new _$PrimitivesValue._(
            boolean: BuiltValueNullFieldError.checkNotNull(
                boolean, r'PrimitivesValue', 'boolean'),
            integer: BuiltValueNullFieldError.checkNotNull(
                integer, r'PrimitivesValue', 'integer'),
            int64: BuiltValueNullFieldError.checkNotNull(
                int64, r'PrimitivesValue', 'int64'),
            dbl: BuiltValueNullFieldError.checkNotNull(
                dbl, r'PrimitivesValue', 'dbl'),
            number: BuiltValueNullFieldError.checkNotNull(
                number, r'PrimitivesValue', 'number'),
            string: BuiltValueNullFieldError.checkNotNull(
                string, r'PrimitivesValue', 'string'),
            dateTime: BuiltValueNullFieldError.checkNotNull(
                dateTime, r'PrimitivesValue', 'dateTime'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'PrimitivesValue', 'duration'),
            regExp: BuiltValueNullFieldError.checkNotNull(
                regExp, r'PrimitivesValue', 'regExp'),
            uri:
                BuiltValueNullFieldError.checkNotNull(uri, r'PrimitivesValue', 'uri'),
            bigInt: BuiltValueNullFieldError.checkNotNull(bigInt, r'PrimitivesValue', 'bigInt'));
    replace(_$result);
    return _$result;
  }
}

class _$FunctionValue extends FunctionValue {
  @override
  final MyFunctionType function;

  factory _$FunctionValue([void Function(FunctionValueBuilder)? updates]) =>
      (new FunctionValueBuilder()..update(updates))._build();

  _$FunctionValue._({required this.function}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        function, r'FunctionValue', 'function');
  }

  @override
  FunctionValue rebuild(void Function(FunctionValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FunctionValueBuilder toBuilder() => new FunctionValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is FunctionValue && function == _$dynamicOther.function;
  }

  @override
  int get hashCode {
    return $jf($jc(0, function.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FunctionValue')
          ..add('function', function))
        .toString();
  }
}

class FunctionValueBuilder
    implements Builder<FunctionValue, FunctionValueBuilder> {
  _$FunctionValue? _$v;

  MyFunctionType? _function;
  MyFunctionType? get function => _$this._function;
  set function(MyFunctionType? function) => _$this._function = function;

  FunctionValueBuilder();

  FunctionValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _function = $v.function;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FunctionValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FunctionValue;
  }

  @override
  void update(void Function(FunctionValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FunctionValue build() => _build();

  _$FunctionValue _build() {
    final _$result = _$v ??
        new _$FunctionValue._(
            function: BuiltValueNullFieldError.checkNotNull(
                function, r'FunctionValue', 'function'));
    replace(_$result);
    return _$result;
  }
}

class _$ListOfFunctionValue extends ListOfFunctionValue {
  @override
  final BuiltList<MyFunctionType> functions;

  factory _$ListOfFunctionValue(
          [void Function(ListOfFunctionValueBuilder)? updates]) =>
      (new ListOfFunctionValueBuilder()..update(updates))._build();

  _$ListOfFunctionValue._({required this.functions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        functions, r'ListOfFunctionValue', 'functions');
  }

  @override
  ListOfFunctionValue rebuild(
          void Function(ListOfFunctionValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListOfFunctionValueBuilder toBuilder() =>
      new ListOfFunctionValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ListOfFunctionValue &&
        functions == _$dynamicOther.functions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, functions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListOfFunctionValue')
          ..add('functions', functions))
        .toString();
  }
}

class ListOfFunctionValueBuilder
    implements Builder<ListOfFunctionValue, ListOfFunctionValueBuilder> {
  _$ListOfFunctionValue? _$v;

  ListBuilder<MyFunctionType>? _functions;
  ListBuilder<MyFunctionType> get functions =>
      _$this._functions ??= new ListBuilder<MyFunctionType>();
  set functions(ListBuilder<MyFunctionType>? functions) =>
      _$this._functions = functions;

  ListOfFunctionValueBuilder();

  ListOfFunctionValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _functions = $v.functions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListOfFunctionValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListOfFunctionValue;
  }

  @override
  void update(void Function(ListOfFunctionValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListOfFunctionValue build() => _build();

  _$ListOfFunctionValue _build() {
    _$ListOfFunctionValue _$result;
    try {
      _$result =
          _$v ?? new _$ListOfFunctionValue._(functions: functions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'functions';
        functions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListOfFunctionValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PartiallySerializableValue extends PartiallySerializableValue {
  @override
  final int value;
  @override
  final int? transientValue;

  factory _$PartiallySerializableValue(
          [void Function(PartiallySerializableValueBuilder)? updates]) =>
      (new PartiallySerializableValueBuilder()..update(updates))._build();

  _$PartiallySerializableValue._({required this.value, this.transientValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'PartiallySerializableValue', 'value');
  }

  @override
  PartiallySerializableValue rebuild(
          void Function(PartiallySerializableValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PartiallySerializableValueBuilder toBuilder() =>
      new PartiallySerializableValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PartiallySerializableValue &&
        value == other.value &&
        transientValue == other.transientValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), transientValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PartiallySerializableValue')
          ..add('value', value)
          ..add('transientValue', transientValue))
        .toString();
  }
}

class PartiallySerializableValueBuilder
    implements
        Builder<PartiallySerializableValue, PartiallySerializableValueBuilder> {
  _$PartiallySerializableValue? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  int? _transientValue;
  int? get transientValue => _$this._transientValue;
  set transientValue(int? transientValue) =>
      _$this._transientValue = transientValue;

  PartiallySerializableValueBuilder();

  PartiallySerializableValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _transientValue = $v.transientValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PartiallySerializableValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PartiallySerializableValue;
  }

  @override
  void update(void Function(PartiallySerializableValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PartiallySerializableValue build() => _build();

  _$PartiallySerializableValue _build() {
    final _$result = _$v ??
        new _$PartiallySerializableValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'PartiallySerializableValue', 'value'),
            transientValue: transientValue);
    replace(_$result);
    return _$result;
  }
}

class _$NamedFactoryValue extends NamedFactoryValue {
  @override
  final int value;

  factory _$NamedFactoryValue(
          [void Function(NamedFactoryValueBuilder)? updates]) =>
      (new NamedFactoryValueBuilder()..update(updates))._build();

  _$NamedFactoryValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'NamedFactoryValue', 'value');
  }

  @override
  NamedFactoryValue rebuild(void Function(NamedFactoryValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NamedFactoryValueBuilder toBuilder() =>
      new NamedFactoryValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NamedFactoryValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NamedFactoryValue')
          ..add('value', value))
        .toString();
  }
}

class NamedFactoryValueBuilder
    implements Builder<NamedFactoryValue, NamedFactoryValueBuilder> {
  _$NamedFactoryValue? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  NamedFactoryValueBuilder();

  NamedFactoryValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NamedFactoryValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NamedFactoryValue;
  }

  @override
  void update(void Function(NamedFactoryValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NamedFactoryValue build() => _build();

  _$NamedFactoryValue _build() {
    final _$result = _$v ??
        new _$NamedFactoryValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'NamedFactoryValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$WireNameValue extends WireNameValue {
  @override
  final int value;

  factory _$WireNameValue([void Function(WireNameValueBuilder)? updates]) =>
      (new WireNameValueBuilder()..update(updates))._build();

  _$WireNameValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'WireNameValue', 'value');
  }

  @override
  WireNameValue rebuild(void Function(WireNameValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WireNameValueBuilder toBuilder() => new WireNameValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WireNameValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WireNameValue')..add('value', value))
        .toString();
  }
}

class WireNameValueBuilder
    implements Builder<WireNameValue, WireNameValueBuilder> {
  _$WireNameValue? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  WireNameValueBuilder();

  WireNameValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WireNameValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WireNameValue;
  }

  @override
  void update(void Function(WireNameValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WireNameValue build() => _build();

  _$WireNameValue _build() {
    final _$result = _$v ??
        new _$WireNameValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'WireNameValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$FieldDiscoveryValue extends FieldDiscoveryValue {
  @override
  final DiscoverableValue value;
  @override
  final BuiltList<ThirdDiscoverableValue> values;
  @override
  final FieldDiscoveryValue? recursiveValue;

  factory _$FieldDiscoveryValue(
          [void Function(FieldDiscoveryValueBuilder)? updates]) =>
      (new FieldDiscoveryValueBuilder()..update(updates))._build();

  _$FieldDiscoveryValue._(
      {required this.value, required this.values, this.recursiveValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'FieldDiscoveryValue', 'value');
    BuiltValueNullFieldError.checkNotNull(
        values, r'FieldDiscoveryValue', 'values');
  }

  @override
  FieldDiscoveryValue rebuild(
          void Function(FieldDiscoveryValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FieldDiscoveryValueBuilder toBuilder() =>
      new FieldDiscoveryValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FieldDiscoveryValue &&
        value == other.value &&
        values == other.values &&
        recursiveValue == other.recursiveValue;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, value.hashCode), values.hashCode), recursiveValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FieldDiscoveryValue')
          ..add('value', value)
          ..add('values', values)
          ..add('recursiveValue', recursiveValue))
        .toString();
  }
}

class FieldDiscoveryValueBuilder
    implements Builder<FieldDiscoveryValue, FieldDiscoveryValueBuilder> {
  _$FieldDiscoveryValue? _$v;

  DiscoverableValueBuilder? _value;
  DiscoverableValueBuilder get value =>
      _$this._value ??= new DiscoverableValueBuilder();
  set value(DiscoverableValueBuilder? value) => _$this._value = value;

  ListBuilder<ThirdDiscoverableValue>? _values;
  ListBuilder<ThirdDiscoverableValue> get values =>
      _$this._values ??= new ListBuilder<ThirdDiscoverableValue>();
  set values(ListBuilder<ThirdDiscoverableValue>? values) =>
      _$this._values = values;

  FieldDiscoveryValueBuilder? _recursiveValue;
  FieldDiscoveryValueBuilder get recursiveValue =>
      _$this._recursiveValue ??= new FieldDiscoveryValueBuilder();
  set recursiveValue(FieldDiscoveryValueBuilder? recursiveValue) =>
      _$this._recursiveValue = recursiveValue;

  FieldDiscoveryValueBuilder();

  FieldDiscoveryValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _values = $v.values.toBuilder();
      _recursiveValue = $v.recursiveValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FieldDiscoveryValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FieldDiscoveryValue;
  }

  @override
  void update(void Function(FieldDiscoveryValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FieldDiscoveryValue build() => _build();

  _$FieldDiscoveryValue _build() {
    _$FieldDiscoveryValue _$result;
    try {
      _$result = _$v ??
          new _$FieldDiscoveryValue._(
              value: value.build(),
              values: values.build(),
              recursiveValue: _recursiveValue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
        _$failedField = 'values';
        values.build();
        _$failedField = 'recursiveValue';
        _recursiveValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FieldDiscoveryValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DiscoverableValue extends DiscoverableValue {
  @override
  final SecondDiscoverableValue value;

  factory _$DiscoverableValue(
          [void Function(DiscoverableValueBuilder)? updates]) =>
      (new DiscoverableValueBuilder()..update(updates))._build();

  _$DiscoverableValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'DiscoverableValue', 'value');
  }

  @override
  DiscoverableValue rebuild(void Function(DiscoverableValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscoverableValueBuilder toBuilder() =>
      new DiscoverableValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiscoverableValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DiscoverableValue')
          ..add('value', value))
        .toString();
  }
}

class DiscoverableValueBuilder
    implements Builder<DiscoverableValue, DiscoverableValueBuilder> {
  _$DiscoverableValue? _$v;

  SecondDiscoverableValueBuilder? _value;
  SecondDiscoverableValueBuilder get value =>
      _$this._value ??= new SecondDiscoverableValueBuilder();
  set value(SecondDiscoverableValueBuilder? value) => _$this._value = value;

  DiscoverableValueBuilder();

  DiscoverableValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiscoverableValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiscoverableValue;
  }

  @override
  void update(void Function(DiscoverableValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DiscoverableValue build() => _build();

  _$DiscoverableValue _build() {
    _$DiscoverableValue _$result;
    try {
      _$result = _$v ?? new _$DiscoverableValue._(value: value.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DiscoverableValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SecondDiscoverableValue extends SecondDiscoverableValue {
  @override
  final int value;

  factory _$SecondDiscoverableValue(
          [void Function(SecondDiscoverableValueBuilder)? updates]) =>
      (new SecondDiscoverableValueBuilder()..update(updates))._build();

  _$SecondDiscoverableValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'SecondDiscoverableValue', 'value');
  }

  @override
  SecondDiscoverableValue rebuild(
          void Function(SecondDiscoverableValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SecondDiscoverableValueBuilder toBuilder() =>
      new SecondDiscoverableValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SecondDiscoverableValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SecondDiscoverableValue')
          ..add('value', value))
        .toString();
  }
}

class SecondDiscoverableValueBuilder
    implements
        Builder<SecondDiscoverableValue, SecondDiscoverableValueBuilder> {
  _$SecondDiscoverableValue? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  SecondDiscoverableValueBuilder();

  SecondDiscoverableValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SecondDiscoverableValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SecondDiscoverableValue;
  }

  @override
  void update(void Function(SecondDiscoverableValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SecondDiscoverableValue build() => _build();

  _$SecondDiscoverableValue _build() {
    final _$result = _$v ??
        new _$SecondDiscoverableValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'SecondDiscoverableValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$ThirdDiscoverableValue extends ThirdDiscoverableValue {
  @override
  final int value;

  factory _$ThirdDiscoverableValue(
          [void Function(ThirdDiscoverableValueBuilder)? updates]) =>
      (new ThirdDiscoverableValueBuilder()..update(updates))._build();

  _$ThirdDiscoverableValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'ThirdDiscoverableValue', 'value');
  }

  @override
  ThirdDiscoverableValue rebuild(
          void Function(ThirdDiscoverableValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThirdDiscoverableValueBuilder toBuilder() =>
      new ThirdDiscoverableValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThirdDiscoverableValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThirdDiscoverableValue')
          ..add('value', value))
        .toString();
  }
}

class ThirdDiscoverableValueBuilder
    implements Builder<ThirdDiscoverableValue, ThirdDiscoverableValueBuilder> {
  _$ThirdDiscoverableValue? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  ThirdDiscoverableValueBuilder();

  ThirdDiscoverableValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdDiscoverableValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThirdDiscoverableValue;
  }

  @override
  void update(void Function(ThirdDiscoverableValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThirdDiscoverableValue build() => _build();

  _$ThirdDiscoverableValue _build() {
    final _$result = _$v ??
        new _$ThirdDiscoverableValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ThirdDiscoverableValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$RecursiveValueA extends RecursiveValueA {
  @override
  final RecursiveValueB value;

  factory _$RecursiveValueA([void Function(RecursiveValueABuilder)? updates]) =>
      (new RecursiveValueABuilder()..update(updates))._build();

  _$RecursiveValueA._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'RecursiveValueA', 'value');
  }

  @override
  RecursiveValueA rebuild(void Function(RecursiveValueABuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecursiveValueABuilder toBuilder() =>
      new RecursiveValueABuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecursiveValueA && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecursiveValueA')
          ..add('value', value))
        .toString();
  }
}

class RecursiveValueABuilder
    implements Builder<RecursiveValueA, RecursiveValueABuilder> {
  _$RecursiveValueA? _$v;

  RecursiveValueBBuilder? _value;
  RecursiveValueBBuilder get value =>
      _$this._value ??= new RecursiveValueBBuilder();
  set value(RecursiveValueBBuilder? value) => _$this._value = value;

  RecursiveValueABuilder();

  RecursiveValueABuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecursiveValueA other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecursiveValueA;
  }

  @override
  void update(void Function(RecursiveValueABuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecursiveValueA build() => _build();

  _$RecursiveValueA _build() {
    _$RecursiveValueA _$result;
    try {
      _$result = _$v ?? new _$RecursiveValueA._(value: value.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecursiveValueA', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RecursiveValueB extends RecursiveValueB {
  @override
  final RecursiveValueA value;

  factory _$RecursiveValueB([void Function(RecursiveValueBBuilder)? updates]) =>
      (new RecursiveValueBBuilder()..update(updates))._build();

  _$RecursiveValueB._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'RecursiveValueB', 'value');
  }

  @override
  RecursiveValueB rebuild(void Function(RecursiveValueBBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecursiveValueBBuilder toBuilder() =>
      new RecursiveValueBBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecursiveValueB && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecursiveValueB')
          ..add('value', value))
        .toString();
  }
}

class RecursiveValueBBuilder
    implements Builder<RecursiveValueB, RecursiveValueBBuilder> {
  _$RecursiveValueB? _$v;

  RecursiveValueABuilder? _value;
  RecursiveValueABuilder get value =>
      _$this._value ??= new RecursiveValueABuilder();
  set value(RecursiveValueABuilder? value) => _$this._value = value;

  RecursiveValueBBuilder();

  RecursiveValueBBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecursiveValueB other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecursiveValueB;
  }

  @override
  void update(void Function(RecursiveValueBBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecursiveValueB build() => _build();

  _$RecursiveValueB _build() {
    _$RecursiveValueB _$result;
    try {
      _$result = _$v ?? new _$RecursiveValueB._(value: value.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecursiveValueB', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithCustomSerializer extends ValueWithCustomSerializer {
  @override
  final int value;

  factory _$ValueWithCustomSerializer(
          [void Function(ValueWithCustomSerializerBuilder)? updates]) =>
      (new ValueWithCustomSerializerBuilder()..update(updates))._build();

  _$ValueWithCustomSerializer._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'ValueWithCustomSerializer', 'value');
  }

  @override
  ValueWithCustomSerializer rebuild(
          void Function(ValueWithCustomSerializerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithCustomSerializerBuilder toBuilder() =>
      new ValueWithCustomSerializerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithCustomSerializer && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithCustomSerializer')
          ..add('value', value))
        .toString();
  }
}

class ValueWithCustomSerializerBuilder
    implements
        Builder<ValueWithCustomSerializer, ValueWithCustomSerializerBuilder> {
  _$ValueWithCustomSerializer? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  ValueWithCustomSerializerBuilder();

  ValueWithCustomSerializerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithCustomSerializer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithCustomSerializer;
  }

  @override
  void update(void Function(ValueWithCustomSerializerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithCustomSerializer build() => _build();

  _$ValueWithCustomSerializer _build() {
    final _$result = _$v ??
        new _$ValueWithCustomSerializer._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ValueWithCustomSerializer', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithOnSet extends ValueWithOnSet {
  @override
  final int value;

  factory _$ValueWithOnSet([void Function(ValueWithOnSetBuilder)? updates]) =>
      (new ValueWithOnSetBuilder()..update(updates))._build();

  _$ValueWithOnSet._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'ValueWithOnSet', 'value');
  }

  @override
  ValueWithOnSet rebuild(void Function(ValueWithOnSetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithOnSetBuilder toBuilder() =>
      new ValueWithOnSetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithOnSet && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithOnSet')..add('value', value))
        .toString();
  }
}

class ValueWithOnSetBuilder
    implements Builder<ValueWithOnSet, ValueWithOnSetBuilder> {
  _$ValueWithOnSet? _$v;

  int? _value;
  int? get value => _$this._value;
  void Function() onSet = () {};

  set value(int? value) {
    _$this._value = value;
    onSet();
  }

  ValueWithOnSetBuilder();

  ValueWithOnSetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithOnSet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithOnSet;
  }

  @override
  void update(void Function(ValueWithOnSetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithOnSet build() => _build();

  _$ValueWithOnSet _build() {
    final _$result = _$v ??
        new _$ValueWithOnSet._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ValueWithOnSet', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$CustomToStringValue extends CustomToStringValue {
  factory _$CustomToStringValue(
          [void Function(CustomToStringValueBuilder)? updates]) =>
      (new CustomToStringValueBuilder()..update(updates))._build();

  _$CustomToStringValue._() : super._();

  @override
  CustomToStringValue rebuild(
          void Function(CustomToStringValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomToStringValueBuilder toBuilder() =>
      new CustomToStringValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomToStringValue;
  }

  @override
  int get hashCode {
    return 617836932;
  }
}

class CustomToStringValueBuilder
    implements Builder<CustomToStringValue, CustomToStringValueBuilder> {
  _$CustomToStringValue? _$v;

  CustomToStringValueBuilder();

  @override
  void replace(CustomToStringValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomToStringValue;
  }

  @override
  void update(void Function(CustomToStringValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomToStringValue build() => _build();

  _$CustomToStringValue _build() {
    final _$result = _$v ?? new _$CustomToStringValue._();
    replace(_$result);
    return _$result;
  }
}

class _$OtherValue extends OtherValue {
  @override
  final int other;

  factory _$OtherValue([void Function(OtherValueBuilder)? updates]) =>
      (new OtherValueBuilder()..update(updates))._build();

  _$OtherValue._({required this.other}) : super._() {
    BuiltValueNullFieldError.checkNotNull(other, r'OtherValue', 'other');
  }

  @override
  OtherValue rebuild(void Function(OtherValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OtherValueBuilder toBuilder() => new OtherValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OtherValue && this.other == other.other;
  }

  @override
  int get hashCode {
    return $jf($jc(0, other.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OtherValue')..add('other', other))
        .toString();
  }
}

class OtherValueBuilder implements Builder<OtherValue, OtherValueBuilder> {
  _$OtherValue? _$v;

  int? _other;
  int? get other => _$this._other;
  set other(int? other) => _$this._other = other;

  OtherValueBuilder();

  OtherValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _other = $v.other;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OtherValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OtherValue;
  }

  @override
  void update(void Function(OtherValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OtherValue build() => _build();

  _$OtherValue _build() {
    final _$result = _$v ??
        new _$OtherValue._(
            other: BuiltValueNullFieldError.checkNotNull(
                other, r'OtherValue', 'other'));
    replace(_$result);
    return _$result;
  }
}

class _$DefaultsForFieldSettingsValue extends DefaultsForFieldSettingsValue {
  @override
  final int ignored;
  @override
  final int compared;
  @override
  final int serialized;

  factory _$DefaultsForFieldSettingsValue(
          [void Function(DefaultsForFieldSettingsValueBuilder)? updates]) =>
      (new DefaultsForFieldSettingsValueBuilder()..update(updates))._build();

  _$DefaultsForFieldSettingsValue._(
      {required this.ignored, required this.compared, required this.serialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ignored, r'DefaultsForFieldSettingsValue', 'ignored');
    BuiltValueNullFieldError.checkNotNull(
        compared, r'DefaultsForFieldSettingsValue', 'compared');
    BuiltValueNullFieldError.checkNotNull(
        serialized, r'DefaultsForFieldSettingsValue', 'serialized');
  }

  @override
  DefaultsForFieldSettingsValue rebuild(
          void Function(DefaultsForFieldSettingsValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DefaultsForFieldSettingsValueBuilder toBuilder() =>
      new DefaultsForFieldSettingsValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DefaultsForFieldSettingsValue && compared == other.compared;
  }

  @override
  int get hashCode {
    return $jf($jc(0, compared.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DefaultsForFieldSettingsValue')
          ..add('ignored', ignored)
          ..add('compared', compared)
          ..add('serialized', serialized))
        .toString();
  }
}

class DefaultsForFieldSettingsValueBuilder
    implements
        Builder<DefaultsForFieldSettingsValue,
            DefaultsForFieldSettingsValueBuilder> {
  _$DefaultsForFieldSettingsValue? _$v;

  int? _ignored;
  int? get ignored => _$this._ignored;
  set ignored(int? ignored) => _$this._ignored = ignored;

  int? _compared;
  int? get compared => _$this._compared;
  set compared(int? compared) => _$this._compared = compared;

  int? _serialized;
  int? get serialized => _$this._serialized;
  set serialized(int? serialized) => _$this._serialized = serialized;

  DefaultsForFieldSettingsValueBuilder();

  DefaultsForFieldSettingsValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ignored = $v.ignored;
      _compared = $v.compared;
      _serialized = $v.serialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DefaultsForFieldSettingsValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DefaultsForFieldSettingsValue;
  }

  @override
  void update(void Function(DefaultsForFieldSettingsValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DefaultsForFieldSettingsValue build() => _build();

  _$DefaultsForFieldSettingsValue _build() {
    final _$result = _$v ??
        new _$DefaultsForFieldSettingsValue._(
            ignored: BuiltValueNullFieldError.checkNotNull(
                ignored, r'DefaultsForFieldSettingsValue', 'ignored'),
            compared: BuiltValueNullFieldError.checkNotNull(
                compared, r'DefaultsForFieldSettingsValue', 'compared'),
            serialized: BuiltValueNullFieldError.checkNotNull(
                serialized, r'DefaultsForFieldSettingsValue', 'serialized'));
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithBuilderInitializer extends ValueWithBuilderInitializer {
  @override
  final int anInt;
  @override
  final int anIntWithDefault;
  @override
  final int? nullableInt;
  @override
  final int? nullableIntWithDefault;
  @override
  final SimpleValue nestedValue;
  @override
  final SimpleValue nestedValueWithDefault;
  @override
  final SimpleValue? nullableNestedValue;
  @override
  final SimpleValue? nullableNestedValueWithDefault;

  factory _$ValueWithBuilderInitializer(
          [void Function(ValueWithBuilderInitializerBuilder)? updates]) =>
      (new ValueWithBuilderInitializerBuilder()..update(updates))._build();

  _$ValueWithBuilderInitializer._(
      {required this.anInt,
      required this.anIntWithDefault,
      this.nullableInt,
      this.nullableIntWithDefault,
      required this.nestedValue,
      required this.nestedValueWithDefault,
      this.nullableNestedValue,
      this.nullableNestedValueWithDefault})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        anInt, r'ValueWithBuilderInitializer', 'anInt');
    BuiltValueNullFieldError.checkNotNull(
        anIntWithDefault, r'ValueWithBuilderInitializer', 'anIntWithDefault');
    BuiltValueNullFieldError.checkNotNull(
        nestedValue, r'ValueWithBuilderInitializer', 'nestedValue');
    BuiltValueNullFieldError.checkNotNull(nestedValueWithDefault,
        r'ValueWithBuilderInitializer', 'nestedValueWithDefault');
  }

  @override
  ValueWithBuilderInitializer rebuild(
          void Function(ValueWithBuilderInitializerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithBuilderInitializerBuilder toBuilder() =>
      new ValueWithBuilderInitializerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithBuilderInitializer &&
        anInt == other.anInt &&
        anIntWithDefault == other.anIntWithDefault &&
        nullableInt == other.nullableInt &&
        nullableIntWithDefault == other.nullableIntWithDefault &&
        nestedValue == other.nestedValue &&
        nestedValueWithDefault == other.nestedValueWithDefault &&
        nullableNestedValue == other.nullableNestedValue &&
        nullableNestedValueWithDefault == other.nullableNestedValueWithDefault;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, anInt.hashCode),
                                anIntWithDefault.hashCode),
                            nullableInt.hashCode),
                        nullableIntWithDefault.hashCode),
                    nestedValue.hashCode),
                nestedValueWithDefault.hashCode),
            nullableNestedValue.hashCode),
        nullableNestedValueWithDefault.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithBuilderInitializer')
          ..add('anInt', anInt)
          ..add('anIntWithDefault', anIntWithDefault)
          ..add('nullableInt', nullableInt)
          ..add('nullableIntWithDefault', nullableIntWithDefault)
          ..add('nestedValue', nestedValue)
          ..add('nestedValueWithDefault', nestedValueWithDefault)
          ..add('nullableNestedValue', nullableNestedValue)
          ..add(
              'nullableNestedValueWithDefault', nullableNestedValueWithDefault))
        .toString();
  }
}

class ValueWithBuilderInitializerBuilder
    implements
        Builder<ValueWithBuilderInitializer,
            ValueWithBuilderInitializerBuilder> {
  _$ValueWithBuilderInitializer? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  int? _anIntWithDefault;
  int? get anIntWithDefault => _$this._anIntWithDefault;
  set anIntWithDefault(int? anIntWithDefault) =>
      _$this._anIntWithDefault = anIntWithDefault;

  int? _nullableInt;
  int? get nullableInt => _$this._nullableInt;
  set nullableInt(int? nullableInt) => _$this._nullableInt = nullableInt;

  int? _nullableIntWithDefault;
  int? get nullableIntWithDefault => _$this._nullableIntWithDefault;
  set nullableIntWithDefault(int? nullableIntWithDefault) =>
      _$this._nullableIntWithDefault = nullableIntWithDefault;

  SimpleValueBuilder? _nestedValue;
  SimpleValueBuilder get nestedValue =>
      _$this._nestedValue ??= new SimpleValueBuilder();
  set nestedValue(SimpleValueBuilder? nestedValue) =>
      _$this._nestedValue = nestedValue;

  SimpleValueBuilder? _nestedValueWithDefault;
  SimpleValueBuilder get nestedValueWithDefault =>
      _$this._nestedValueWithDefault ??= new SimpleValueBuilder();
  set nestedValueWithDefault(SimpleValueBuilder? nestedValueWithDefault) =>
      _$this._nestedValueWithDefault = nestedValueWithDefault;

  SimpleValueBuilder? _nullableNestedValue;
  SimpleValueBuilder get nullableNestedValue =>
      _$this._nullableNestedValue ??= new SimpleValueBuilder();
  set nullableNestedValue(SimpleValueBuilder? nullableNestedValue) =>
      _$this._nullableNestedValue = nullableNestedValue;

  SimpleValueBuilder? _nullableNestedValueWithDefault;
  SimpleValueBuilder get nullableNestedValueWithDefault =>
      _$this._nullableNestedValueWithDefault ??= new SimpleValueBuilder();
  set nullableNestedValueWithDefault(
          SimpleValueBuilder? nullableNestedValueWithDefault) =>
      _$this._nullableNestedValueWithDefault = nullableNestedValueWithDefault;

  ValueWithBuilderInitializerBuilder() {
    ValueWithBuilderInitializer._initializeBuilder(this);
  }

  ValueWithBuilderInitializerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _anIntWithDefault = $v.anIntWithDefault;
      _nullableInt = $v.nullableInt;
      _nullableIntWithDefault = $v.nullableIntWithDefault;
      _nestedValue = $v.nestedValue.toBuilder();
      _nestedValueWithDefault = $v.nestedValueWithDefault.toBuilder();
      _nullableNestedValue = $v.nullableNestedValue?.toBuilder();
      _nullableNestedValueWithDefault =
          $v.nullableNestedValueWithDefault?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithBuilderInitializer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithBuilderInitializer;
  }

  @override
  void update(void Function(ValueWithBuilderInitializerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithBuilderInitializer build() => _build();

  _$ValueWithBuilderInitializer _build() {
    _$ValueWithBuilderInitializer _$result;
    try {
      _$result = _$v ??
          new _$ValueWithBuilderInitializer._(
              anInt: BuiltValueNullFieldError.checkNotNull(
                  anInt, r'ValueWithBuilderInitializer', 'anInt'),
              anIntWithDefault: BuiltValueNullFieldError.checkNotNull(
                  anIntWithDefault,
                  r'ValueWithBuilderInitializer',
                  'anIntWithDefault'),
              nullableInt: nullableInt,
              nullableIntWithDefault: nullableIntWithDefault,
              nestedValue: nestedValue.build(),
              nestedValueWithDefault: nestedValueWithDefault.build(),
              nullableNestedValue: _nullableNestedValue?.build(),
              nullableNestedValueWithDefault:
                  _nullableNestedValueWithDefault?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nestedValue';
        nestedValue.build();
        _$failedField = 'nestedValueWithDefault';
        nestedValueWithDefault.build();
        _$failedField = 'nullableNestedValue';
        _nullableNestedValue?.build();
        _$failedField = 'nullableNestedValueWithDefault';
        _nullableNestedValueWithDefault?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ValueWithBuilderInitializer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithBuilderFinalizer extends ValueWithBuilderFinalizer {
  @override
  final int anInt;

  factory _$ValueWithBuilderFinalizer(
          [void Function(ValueWithBuilderFinalizerBuilder)? updates]) =>
      (new ValueWithBuilderFinalizerBuilder()..update(updates))._build();

  _$ValueWithBuilderFinalizer._({required this.anInt}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        anInt, r'ValueWithBuilderFinalizer', 'anInt');
  }

  @override
  ValueWithBuilderFinalizer rebuild(
          void Function(ValueWithBuilderFinalizerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithBuilderFinalizerBuilder toBuilder() =>
      new ValueWithBuilderFinalizerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithBuilderFinalizer && anInt == other.anInt;
  }

  @override
  int get hashCode {
    return $jf($jc(0, anInt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithBuilderFinalizer')
          ..add('anInt', anInt))
        .toString();
  }
}

class ValueWithBuilderFinalizerBuilder
    implements
        Builder<ValueWithBuilderFinalizer, ValueWithBuilderFinalizerBuilder> {
  _$ValueWithBuilderFinalizer? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  ValueWithBuilderFinalizerBuilder();

  ValueWithBuilderFinalizerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithBuilderFinalizer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithBuilderFinalizer;
  }

  @override
  void update(void Function(ValueWithBuilderFinalizerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithBuilderFinalizer build() => _build();

  _$ValueWithBuilderFinalizer _build() {
    ValueWithBuilderFinalizer._finalizeBuilder(this);
    final _$result = _$v ??
        new _$ValueWithBuilderFinalizer._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'ValueWithBuilderFinalizer', 'anInt'));
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithGenericBuilderInitializer<T>
    extends ValueWithGenericBuilderInitializer<T> {
  @override
  final T? value;

  factory _$ValueWithGenericBuilderInitializer(
          [void Function(ValueWithGenericBuilderInitializerBuilder<T>)?
              updates]) =>
      (new ValueWithGenericBuilderInitializerBuilder<T>()..update(updates))
          ._build();

  _$ValueWithGenericBuilderInitializer._({this.value}) : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          r'ValueWithGenericBuilderInitializer', 'T');
    }
  }

  @override
  ValueWithGenericBuilderInitializer<T> rebuild(
          void Function(ValueWithGenericBuilderInitializerBuilder<T>)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithGenericBuilderInitializerBuilder<T> toBuilder() =>
      new ValueWithGenericBuilderInitializerBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithGenericBuilderInitializer && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithGenericBuilderInitializer')
          ..add('value', value))
        .toString();
  }
}

class ValueWithGenericBuilderInitializerBuilder<T>
    implements
        Builder<ValueWithGenericBuilderInitializer<T>,
            ValueWithGenericBuilderInitializerBuilder<T>> {
  _$ValueWithGenericBuilderInitializer<T>? _$v;

  T? _value;
  T? get value => _$this._value;
  set value(T? value) => _$this._value = value;

  ValueWithGenericBuilderInitializerBuilder() {
    ValueWithGenericBuilderInitializer._initializeBuilder(this);
  }

  ValueWithGenericBuilderInitializerBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithGenericBuilderInitializer<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithGenericBuilderInitializer<T>;
  }

  @override
  void update(
      void Function(ValueWithGenericBuilderInitializerBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithGenericBuilderInitializer<T> build() => _build();

  _$ValueWithGenericBuilderInitializer<T> _build() {
    final _$result =
        _$v ?? new _$ValueWithGenericBuilderInitializer<T>._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$HashcodeValue extends HashcodeValue {
  @override
  final int x;
  @override
  final int y;

  factory _$HashcodeValue([void Function(HashcodeValueBuilder)? updates]) =>
      (new HashcodeValueBuilder()..update(updates))._build();

  _$HashcodeValue._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'HashcodeValue', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'HashcodeValue', 'y');
  }

  @override
  HashcodeValue rebuild(void Function(HashcodeValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HashcodeValueBuilder toBuilder() => new HashcodeValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HashcodeValue && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HashcodeValue')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class HashcodeValueBuilder
    implements Builder<HashcodeValue, HashcodeValueBuilder> {
  _$HashcodeValue? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  HashcodeValueBuilder();

  HashcodeValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HashcodeValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HashcodeValue;
  }

  @override
  void update(void Function(HashcodeValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HashcodeValue build() => _build();

  _$HashcodeValue _build() {
    final _$result = _$v ??
        new _$HashcodeValue._(
            x: BuiltValueNullFieldError.checkNotNull(x, r'HashcodeValue', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, r'HashcodeValue', 'y'));
    replace(_$result);
    return _$result;
  }
}

class _$MemoizedHashcodeValue extends MemoizedHashcodeValue {
  @override
  final int x;
  @override
  final int y;

  factory _$MemoizedHashcodeValue(
          [void Function(MemoizedHashcodeValueBuilder)? updates]) =>
      (new MemoizedHashcodeValueBuilder()..update(updates))._build();

  _$MemoizedHashcodeValue._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'MemoizedHashcodeValue', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'MemoizedHashcodeValue', 'y');
  }

  @override
  MemoizedHashcodeValue rebuild(
          void Function(MemoizedHashcodeValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoizedHashcodeValueBuilder toBuilder() =>
      new MemoizedHashcodeValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemoizedHashcodeValue && x == other.x && y == other.y;
  }

  int? __hashCode;
  @override
  int get hashCode {
    return __hashCode ??= $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MemoizedHashcodeValue')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class MemoizedHashcodeValueBuilder
    implements Builder<MemoizedHashcodeValue, MemoizedHashcodeValueBuilder> {
  _$MemoizedHashcodeValue? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  MemoizedHashcodeValueBuilder();

  MemoizedHashcodeValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemoizedHashcodeValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MemoizedHashcodeValue;
  }

  @override
  void update(void Function(MemoizedHashcodeValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MemoizedHashcodeValue build() => _build();

  _$MemoizedHashcodeValue _build() {
    final _$result = _$v ??
        new _$MemoizedHashcodeValue._(
            x: BuiltValueNullFieldError.checkNotNull(
                x, r'MemoizedHashcodeValue', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, r'MemoizedHashcodeValue', 'y'));
    replace(_$result);
    return _$result;
  }
}

class _$PrivateValue extends _PrivateValue {
  factory _$PrivateValue([void Function(_PrivateValueBuilder)? updates]) =>
      (new _PrivateValueBuilder()..update(updates))._build();

  _$PrivateValue._() : super._();

  @override
  _PrivateValue rebuild(void Function(_PrivateValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _PrivateValueBuilder toBuilder() => new _PrivateValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is _PrivateValue;
  }

  @override
  int get hashCode {
    return 75608033;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'_PrivateValue').toString();
  }
}

class _PrivateValueBuilder
    implements Builder<_PrivateValue, _PrivateValueBuilder> {
  _$PrivateValue? _$v;

  _PrivateValueBuilder();

  @override
  void replace(_PrivateValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrivateValue;
  }

  @override
  void update(void Function(_PrivateValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _PrivateValue build() => _build();

  _$PrivateValue _build() {
    final _$result = _$v ?? new _$PrivateValue._();
    replace(_$result);
    return _$result;
  }
}

class _$SerializesNullsValue extends SerializesNullsValue {
  @override
  final String? value;

  factory _$SerializesNullsValue(
          [void Function(SerializesNullsValueBuilder)? updates]) =>
      (new SerializesNullsValueBuilder()..update(updates))._build();

  _$SerializesNullsValue._({this.value}) : super._();

  @override
  SerializesNullsValue rebuild(
          void Function(SerializesNullsValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializesNullsValueBuilder toBuilder() =>
      new SerializesNullsValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializesNullsValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SerializesNullsValue')
          ..add('value', value))
        .toString();
  }
}

class SerializesNullsValueBuilder
    implements Builder<SerializesNullsValue, SerializesNullsValueBuilder> {
  _$SerializesNullsValue? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  SerializesNullsValueBuilder();

  SerializesNullsValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializesNullsValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SerializesNullsValue;
  }

  @override
  void update(void Function(SerializesNullsValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SerializesNullsValue build() => _build();

  _$SerializesNullsValue _build() {
    final _$result = _$v ?? new _$SerializesNullsValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$NullableObjectValue extends NullableObjectValue {
  @override
  final Object? value;

  factory _$NullableObjectValue(
          [void Function(NullableObjectValueBuilder)? updates]) =>
      (new NullableObjectValueBuilder()..update(updates))._build();

  _$NullableObjectValue._({this.value}) : super._();

  @override
  NullableObjectValue rebuild(
          void Function(NullableObjectValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NullableObjectValueBuilder toBuilder() =>
      new NullableObjectValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NullableObjectValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NullableObjectValue')
          ..add('value', value))
        .toString();
  }
}

class NullableObjectValueBuilder
    implements Builder<NullableObjectValue, NullableObjectValueBuilder> {
  _$NullableObjectValue? _$v;

  Object? _value;
  Object? get value => _$this._value;
  set value(Object? value) => _$this._value = value;

  NullableObjectValueBuilder();

  NullableObjectValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NullableObjectValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NullableObjectValue;
  }

  @override
  void update(void Function(NullableObjectValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NullableObjectValue build() => _build();

  _$NullableObjectValue _build() {
    final _$result = _$v ?? new _$NullableObjectValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithHooks extends ValueWithHooks {
  @override
  final int hook1Count;
  @override
  final int hook2Count;
  @override
  final BuiltList<String> hookOrdering;

  factory _$ValueWithHooks([void Function(ValueWithHooksBuilder)? updates]) =>
      (new ValueWithHooksBuilder()..update(updates))._build();

  _$ValueWithHooks._(
      {required this.hook1Count,
      required this.hook2Count,
      required this.hookOrdering})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        hook1Count, r'ValueWithHooks', 'hook1Count');
    BuiltValueNullFieldError.checkNotNull(
        hook2Count, r'ValueWithHooks', 'hook2Count');
    BuiltValueNullFieldError.checkNotNull(
        hookOrdering, r'ValueWithHooks', 'hookOrdering');
  }

  @override
  ValueWithHooks rebuild(void Function(ValueWithHooksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueWithHooksBuilder toBuilder() =>
      new ValueWithHooksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueWithHooks &&
        hook1Count == other.hook1Count &&
        hook2Count == other.hook2Count &&
        hookOrdering == other.hookOrdering;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, hook1Count.hashCode), hook2Count.hashCode),
        hookOrdering.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueWithHooks')
          ..add('hook1Count', hook1Count)
          ..add('hook2Count', hook2Count)
          ..add('hookOrdering', hookOrdering))
        .toString();
  }
}

class ValueWithHooksBuilder
    implements Builder<ValueWithHooks, ValueWithHooksBuilder> {
  _$ValueWithHooks? _$v;

  int? _hook1Count;
  int? get hook1Count => _$this._hook1Count;
  set hook1Count(int? hook1Count) => _$this._hook1Count = hook1Count;

  int? _hook2Count;
  int? get hook2Count => _$this._hook2Count;
  set hook2Count(int? hook2Count) => _$this._hook2Count = hook2Count;

  ListBuilder<String>? _hookOrdering;
  ListBuilder<String> get hookOrdering =>
      _$this._hookOrdering ??= new ListBuilder<String>();
  set hookOrdering(ListBuilder<String>? hookOrdering) =>
      _$this._hookOrdering = hookOrdering;

  ValueWithHooksBuilder() {
    ValueWithHooks.hook1(this);
    ValueWithHooks.justInitialize(this);
    ValueWithHooks.both(this);
    ValueWithHooks.moreJustInitialize(this);
    ValueWithHooks.moreBoth(this);
  }

  ValueWithHooksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hook1Count = $v.hook1Count;
      _hook2Count = $v.hook2Count;
      _hookOrdering = $v.hookOrdering.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithHooks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueWithHooks;
  }

  @override
  void update(void Function(ValueWithHooksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithHooks build() => _build();

  _$ValueWithHooks _build() {
    ValueWithHooks.hook2(this);
    ValueWithHooks.justFinalize(this);
    ValueWithHooks.both(this);
    ValueWithHooks.moreJustFinalize(this);
    ValueWithHooks.moreBoth(this);
    _$ValueWithHooks _$result;
    try {
      _$result = _$v ??
          new _$ValueWithHooks._(
              hook1Count: BuiltValueNullFieldError.checkNotNull(
                  hook1Count, r'ValueWithHooks', 'hook1Count'),
              hook2Count: BuiltValueNullFieldError.checkNotNull(
                  hook2Count, r'ValueWithHooks', 'hook2Count'),
              hookOrdering: hookOrdering.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hookOrdering';
        hookOrdering.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ValueWithHooks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$$ValueSpecial extends $ValueSpecial {
  @override
  final int anInt;
  @override
  final String? aString;
  @override
  final bool? $mustBeEscaped;

  factory _$$ValueSpecial([void Function($ValueSpecialBuilder)? updates]) =>
      (new $ValueSpecialBuilder()..update(updates))._build();

  _$$ValueSpecial._({required this.anInt, this.aString, this.$mustBeEscaped})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'$ValueSpecial', 'anInt');
  }

  @override
  $ValueSpecial rebuild(void Function($ValueSpecialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ValueSpecialBuilder toBuilder() => new $ValueSpecialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ValueSpecial &&
        anInt == other.anInt &&
        aString == other.aString &&
        $mustBeEscaped == other.$mustBeEscaped;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, anInt.hashCode), aString.hashCode),
        $mustBeEscaped.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$ValueSpecial')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('\$mustBeEscaped', $mustBeEscaped))
        .toString();
  }
}

class $ValueSpecialBuilder
    implements Builder<$ValueSpecial, $ValueSpecialBuilder> {
  _$$ValueSpecial? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  bool? _$mustBeEscaped;
  bool? get $mustBeEscaped => _$this._$mustBeEscaped;
  set $mustBeEscaped(bool? $mustBeEscaped) =>
      _$this._$mustBeEscaped = $mustBeEscaped;

  $ValueSpecialBuilder();

  $ValueSpecialBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$mustBeEscaped = $v.$mustBeEscaped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace($ValueSpecial other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$ValueSpecial;
  }

  @override
  void update(void Function($ValueSpecialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ValueSpecial build() => _build();

  _$$ValueSpecial _build() {
    final _$result = _$v ??
        new _$$ValueSpecial._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, r'$ValueSpecial', 'anInt'),
            aString: aString,
            $mustBeEscaped: $mustBeEscaped);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
