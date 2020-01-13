// GENERATED CODE - DO NOT MODIFY BY HAND

part of values;

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
Serializer<SerializesNullsValue> _$serializesNullsValueSerializer =
    new _$SerializesNullsValueSerializer();
Serializer<OtherValue> _$otherValueSerializer = new _$OtherValueSerializer();
Serializer<DefaultsForFieldSettingsValue>
    _$defaultsForFieldSettingsValueSerializer =
    new _$DefaultsForFieldSettingsValueSerializer();
Serializer<ValueWithBuilderInitializer>
    _$valueWithBuilderInitializerSerializer =
    new _$ValueWithBuilderInitializerSerializer();
Serializer<ValueWithBuilderFinalizer> _$valueWithBuilderFinalizerSerializer =
    new _$ValueWithBuilderFinalizerSerializer();

class _$SimpleValueSerializer implements StructuredSerializer<SimpleValue> {
  @override
  final Iterable<Type> types = const [SimpleValue, _$SimpleValue];
  @override
  final String wireName = 'SimpleValue';

  @override
  Iterable<Object> serialize(Serializers serializers, SimpleValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    if (object.aString != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(object.aString,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SimpleValue deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SimpleValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  Iterable<Object> serialize(Serializers serializers, CompoundValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    if (object.validatedValue != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(object.validatedValue,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'validatedValue':
          result.validatedValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue);
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
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueNoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    if (object.validatedValue != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(object.validatedValue,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueNoNesting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue;
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
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueNoAutoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(NoFieldsValue)),
    ];

    return result;
  }

  @override
  CompoundValueNoAutoNesting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueNoAutoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
              specifiedType: const FullType(NoFieldsValue)) as NoFieldsValue);
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
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueComparableBuilders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    if (object.validatedValue != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(object.validatedValue,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueComparableBuilders deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueComparableBuildersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue = serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue;
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue;
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
  Iterable<Object> serialize(
      Serializers serializers, CompoundValueExplicitNoNesting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
    ];
    if (object.validatedValue != null) {
      result
        ..add('validatedValue')
        ..add(serializers.serialize(object.validatedValue,
            specifiedType: const FullType(ValidatedValue)));
    }
    return result;
  }

  @override
  CompoundValueExplicitNoNesting deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompoundValueExplicitNoNestingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'validatedValue':
          result.validatedValue = serializers.deserialize(value,
              specifiedType: const FullType(ValidatedValue)) as ValidatedValue;
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
  Iterable<Object> serialize(Serializers serializers, ValidatedValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];
    if (object.aString != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(object.aString,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ValidatedValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValidatedValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  Iterable<Object> serialize(Serializers serializers, ValueUsingImportAs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(using_import_as.TestEnum)),
    ];

    return result;
  }

  @override
  ValueUsingImportAs deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueUsingImportAsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
                  specifiedType: const FullType(using_import_as.TestEnum))
              as using_import_as.TestEnum;
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
  Iterable<Object> serialize(Serializers serializers, NoFieldsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  NoFieldsValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
  Iterable<Object> serialize(Serializers serializers, PrimitivesValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrimitivesValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'boolean':
          result.boolean = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'integer':
          result.integer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'int64':
          result.int64 = serializers.deserialize(value,
              specifiedType: const FullType(Int64)) as Int64;
          break;
        case 'dbl':
          result.dbl = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'string':
          result.string = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dateTime':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(Duration)) as Duration;
          break;
        case 'regExp':
          result.regExp = serializers.deserialize(value,
              specifiedType: const FullType(RegExp)) as RegExp;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(Uri)) as Uri;
          break;
        case 'bigInt':
          result.bigInt = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
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
  Iterable<Object> serialize(
      Serializers serializers, PartiallySerializableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PartiallySerializableValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PartiallySerializableValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(Serializers serializers, NamedFactoryValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NamedFactoryValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NamedFactoryValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(Serializers serializers, WireNameValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '\$v',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  WireNameValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WireNameValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '\$v':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(
      Serializers serializers, FieldDiscoveryValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(DiscoverableValue)),
      'values',
      serializers.serialize(object.values,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ThirdDiscoverableValue)])),
    ];
    if (object.recursiveValue != null) {
      result
        ..add('recursiveValue')
        ..add(serializers.serialize(object.recursiveValue,
            specifiedType: const FullType(FieldDiscoveryValue)));
    }
    return result;
  }

  @override
  FieldDiscoveryValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FieldDiscoveryValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DiscoverableValue))
              as DiscoverableValue);
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ThirdDiscoverableValue)
              ])) as BuiltList<ThirdDiscoverableValue>);
          break;
        case 'recursiveValue':
          result.recursiveValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FieldDiscoveryValue))
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
  Iterable<Object> serialize(Serializers serializers, DiscoverableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(SecondDiscoverableValue)),
    ];

    return result;
  }

  @override
  DiscoverableValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiscoverableValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SecondDiscoverableValue))
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
  Iterable<Object> serialize(
      Serializers serializers, SecondDiscoverableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SecondDiscoverableValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SecondDiscoverableValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(
      Serializers serializers, ThirdDiscoverableValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ThirdDiscoverableValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThirdDiscoverableValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(Serializers serializers, RecursiveValueA object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(RecursiveValueB)),
    ];

    return result;
  }

  @override
  RecursiveValueA deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecursiveValueABuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RecursiveValueB))
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
  Iterable<Object> serialize(Serializers serializers, RecursiveValueB object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(RecursiveValueA)),
    ];

    return result;
  }

  @override
  RecursiveValueB deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecursiveValueBBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RecursiveValueA))
              as RecursiveValueA);
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
  Iterable<Object> serialize(
      Serializers serializers, SerializesNullsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    result.add('value');
    if (object.value == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.value,
          specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SerializesNullsValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SerializesNullsValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      if (value == null) continue;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  Iterable<Object> serialize(Serializers serializers, OtherValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'other',
      serializers.serialize(object.other, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  OtherValue deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OtherValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'other':
          result.other = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(
      Serializers serializers, DefaultsForFieldSettingsValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'serialized',
      serializers.serialize(object.serialized,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  DefaultsForFieldSettingsValue deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DefaultsForFieldSettingsValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'serialized':
          result.serialized = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  Iterable<Object> serialize(
      Serializers serializers, ValueWithBuilderInitializer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
    if (object.nullableInt != null) {
      result
        ..add('nullableInt')
        ..add(serializers.serialize(object.nullableInt,
            specifiedType: const FullType(int)));
    }
    if (object.nullableIntWithDefault != null) {
      result
        ..add('nullableIntWithDefault')
        ..add(serializers.serialize(object.nullableIntWithDefault,
            specifiedType: const FullType(int)));
    }
    if (object.nullableNestedValue != null) {
      result
        ..add('nullableNestedValue')
        ..add(serializers.serialize(object.nullableNestedValue,
            specifiedType: const FullType(SimpleValue)));
    }
    if (object.nullableNestedValueWithDefault != null) {
      result
        ..add('nullableNestedValueWithDefault')
        ..add(serializers.serialize(object.nullableNestedValueWithDefault,
            specifiedType: const FullType(SimpleValue)));
    }
    return result;
  }

  @override
  ValueWithBuilderInitializer deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithBuilderInitializerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'anIntWithDefault':
          result.anIntWithDefault = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nullableInt':
          result.nullableInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nullableIntWithDefault':
          result.nullableIntWithDefault = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nestedValue':
          result.nestedValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'nestedValueWithDefault':
          result.nestedValueWithDefault.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'nullableNestedValue':
          result.nullableNestedValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'nullableNestedValueWithDefault':
          result.nullableNestedValueWithDefault.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
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
  Iterable<Object> serialize(
      Serializers serializers, ValueWithBuilderFinalizer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ValueWithBuilderFinalizer deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValueWithBuilderFinalizerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  final String aString;

  factory _$SimpleValue([void Function(SimpleValueBuilder) updates]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('SimpleValue', 'anInt');
    }
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
        aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void Function(SimpleValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValue build() {
    final _$result = _$v ?? new _$SimpleValue._(anInt: anInt, aString: aString);
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValue extends CompoundValue {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue validatedValue;

  factory _$CompoundValue([void Function(CompoundValueBuilder) updates]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({this.simpleValue, this.validatedValue}) : super._() {
    if (simpleValue == null) {
      throw new BuiltValueNullFieldError('CompoundValue', 'simpleValue');
    }
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
    return (newBuiltValueToStringHelper('CompoundValue')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  _$CompoundValue _$v;

  SimpleValueBuilder _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder simpleValue) =>
      _$this._simpleValue = simpleValue;

  ValidatedValueBuilder _validatedValue;
  ValidatedValueBuilder get validatedValue =>
      _$this._validatedValue ??= new ValidatedValueBuilder();
  set validatedValue(ValidatedValueBuilder validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueBuilder();

  CompoundValueBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue?.toBuilder();
      _validatedValue = _$v.validatedValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompoundValue;
  }

  @override
  void update(void Function(CompoundValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValue build() {
    _$CompoundValue _$result;
    try {
      _$result = _$v ??
          new _$CompoundValue._(
              simpleValue: simpleValue.build(),
              validatedValue: _validatedValue?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
        _$failedField = 'validatedValue';
        _validatedValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValue', _$failedField, e.toString());
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
  final ValidatedValue validatedValue;

  factory _$CompoundValueNoNesting(
          [void Function(CompoundValueNoNestingBuilder) updates]) =>
      (new CompoundValueNoNestingBuilder()..update(updates)).build();

  _$CompoundValueNoNesting._({this.simpleValue, this.validatedValue})
      : super._() {
    if (simpleValue == null) {
      throw new BuiltValueNullFieldError(
          'CompoundValueNoNesting', 'simpleValue');
    }
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
    return (newBuiltValueToStringHelper('CompoundValueNoNesting')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueNoNestingBuilder
    implements Builder<CompoundValueNoNesting, CompoundValueNoNestingBuilder> {
  _$CompoundValueNoNesting _$v;

  SimpleValue _simpleValue;
  SimpleValue get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue simpleValue) => _$this._simpleValue = simpleValue;

  ValidatedValue _validatedValue;
  ValidatedValue get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueNoNestingBuilder();

  CompoundValueNoNestingBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue;
      _validatedValue = _$v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoNesting other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompoundValueNoNesting;
  }

  @override
  void update(void Function(CompoundValueNoNestingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValueNoNesting build() {
    final _$result = _$v ??
        new _$CompoundValueNoNesting._(
            simpleValue: simpleValue, validatedValue: validatedValue);
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValueNoAutoNesting extends CompoundValueNoAutoNesting {
  @override
  final NoFieldsValue value;

  factory _$CompoundValueNoAutoNesting(
          [void Function(CompoundValueNoAutoNestingBuilder) updates]) =>
      (new CompoundValueNoAutoNestingBuilder()..update(updates)).build();

  _$CompoundValueNoAutoNesting._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('CompoundValueNoAutoNesting', 'value');
    }
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
    return (newBuiltValueToStringHelper('CompoundValueNoAutoNesting')
          ..add('value', value))
        .toString();
  }
}

class CompoundValueNoAutoNestingBuilder
    implements
        Builder<CompoundValueNoAutoNesting, CompoundValueNoAutoNestingBuilder> {
  _$CompoundValueNoAutoNesting _$v;

  NoFieldsValueBuilder _value;
  NoFieldsValueBuilder get value => _$this._value;
  set value(NoFieldsValueBuilder value) => _$this._value = value;

  CompoundValueNoAutoNestingBuilder();

  CompoundValueNoAutoNestingBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueNoAutoNesting other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompoundValueNoAutoNesting;
  }

  @override
  void update(void Function(CompoundValueNoAutoNestingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValueNoAutoNesting build() {
    _$CompoundValueNoAutoNesting _$result;
    try {
      _$result =
          _$v ?? new _$CompoundValueNoAutoNesting._(value: value.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValueNoAutoNesting', _$failedField, e.toString());
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
  final ValidatedValue validatedValue;

  factory _$CompoundValueComparableBuilders(
          [void Function(CompoundValueComparableBuildersBuilder) updates]) =>
      (new CompoundValueComparableBuildersBuilder()..update(updates)).build();

  _$CompoundValueComparableBuilders._({this.simpleValue, this.validatedValue})
      : super._() {
    if (simpleValue == null) {
      throw new BuiltValueNullFieldError(
          'CompoundValueComparableBuilders', 'simpleValue');
    }
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
    return (newBuiltValueToStringHelper('CompoundValueComparableBuilders')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class CompoundValueComparableBuildersBuilder
    implements
        Builder<CompoundValueComparableBuilders,
            CompoundValueComparableBuildersBuilder> {
  _$CompoundValueComparableBuilders _$v;

  SimpleValue _simpleValue;
  SimpleValue get simpleValue => _$this._simpleValue;
  set simpleValue(SimpleValue simpleValue) => _$this._simpleValue = simpleValue;

  ValidatedValue _validatedValue;
  ValidatedValue get validatedValue => _$this._validatedValue;
  set validatedValue(ValidatedValue validatedValue) =>
      _$this._validatedValue = validatedValue;

  CompoundValueComparableBuildersBuilder();

  CompoundValueComparableBuildersBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue;
      _validatedValue = _$v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueComparableBuilders other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompoundValueComparableBuilders;
  }

  @override
  void update(void Function(CompoundValueComparableBuildersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValueComparableBuilders build() {
    final _$result = _$v ??
        new _$CompoundValueComparableBuilders._(
            simpleValue: simpleValue, validatedValue: validatedValue);
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

class _$CompoundValueExplicitNoNesting extends CompoundValueExplicitNoNesting {
  @override
  final SimpleValue simpleValue;
  @override
  final ValidatedValue validatedValue;

  factory _$CompoundValueExplicitNoNesting(
          [void Function(CompoundValueExplicitNoNestingBuilder) updates]) =>
      (new CompoundValueExplicitNoNestingBuilder()..update(updates)).build()
          as _$CompoundValueExplicitNoNesting;

  _$CompoundValueExplicitNoNesting._({this.simpleValue, this.validatedValue})
      : super._() {
    if (simpleValue == null) {
      throw new BuiltValueNullFieldError(
          'CompoundValueExplicitNoNesting', 'simpleValue');
    }
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
    return (newBuiltValueToStringHelper('CompoundValueExplicitNoNesting')
          ..add('simpleValue', simpleValue)
          ..add('validatedValue', validatedValue))
        .toString();
  }
}

class _$CompoundValueExplicitNoNestingBuilder
    extends CompoundValueExplicitNoNestingBuilder {
  _$CompoundValueExplicitNoNesting _$v;

  @override
  SimpleValueBuilder get simpleValue {
    _$this;
    return super.simpleValue ??= new SimpleValueBuilder();
  }

  @override
  set simpleValue(SimpleValueBuilder simpleValue) {
    _$this;
    super.simpleValue = simpleValue;
  }

  @override
  ValidatedValue get validatedValue {
    _$this;
    return super.validatedValue;
  }

  @override
  set validatedValue(ValidatedValue validatedValue) {
    _$this;
    super.validatedValue = validatedValue;
  }

  _$CompoundValueExplicitNoNestingBuilder() : super._();

  CompoundValueExplicitNoNestingBuilder get _$this {
    if (_$v != null) {
      super.simpleValue = _$v.simpleValue?.toBuilder();
      super.validatedValue = _$v.validatedValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValueExplicitNoNesting other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CompoundValueExplicitNoNesting;
  }

  @override
  void update(void Function(CompoundValueExplicitNoNestingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValueExplicitNoNesting build() {
    _$CompoundValueExplicitNoNesting _$result;
    try {
      _$result = _$v ??
          new _$CompoundValueExplicitNoNesting._(
              simpleValue: simpleValue.build(), validatedValue: validatedValue);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValueExplicitNoNesting', _$failedField, e.toString());
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
          [void Function(ExplicitNestedListBuilder) updates]) =>
      (new ExplicitNestedListBuilder()..update(updates)).build()
          as _$ExplicitNestedList;

  _$ExplicitNestedList._({this.nestedList}) : super._() {
    if (nestedList == null) {
      throw new BuiltValueNullFieldError('ExplicitNestedList', 'nestedList');
    }
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
    return (newBuiltValueToStringHelper('ExplicitNestedList')
          ..add('nestedList', nestedList))
        .toString();
  }
}

class _$ExplicitNestedListBuilder extends ExplicitNestedListBuilder {
  _$ExplicitNestedList _$v;

  @override
  ListBuilder<BuiltList<int>> get nestedList {
    _$this;
    return super.nestedList ??= new ListBuilder<BuiltList<int>>();
  }

  @override
  set nestedList(ListBuilder<BuiltList<int>> nestedList) {
    _$this;
    super.nestedList = nestedList;
  }

  _$ExplicitNestedListBuilder() : super._();

  ExplicitNestedListBuilder get _$this {
    if (_$v != null) {
      super.nestedList = _$v.nestedList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplicitNestedList other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExplicitNestedList;
  }

  @override
  void update(void Function(ExplicitNestedListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExplicitNestedList build() {
    _$ExplicitNestedList _$result;
    try {
      _$result =
          _$v ?? new _$ExplicitNestedList._(nestedList: nestedList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'nestedList';
        nestedList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ExplicitNestedList', _$failedField, e.toString());
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
  int __derivedValue;
  Iterable<String> __derivedString;

  factory _$DerivedValue([void Function(DerivedValueBuilder) updates]) =>
      (new DerivedValueBuilder()..update(updates)).build();

  _$DerivedValue._({this.anInt}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('DerivedValue', 'anInt');
    }
  }

  @override
  int get derivedValue => __derivedValue ??= super.derivedValue;

  @override
  Iterable<String> get derivedString => __derivedString ??= super.derivedString;

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
    return (newBuiltValueToStringHelper('DerivedValue')..add('anInt', anInt))
        .toString();
  }
}

class DerivedValueBuilder
    implements Builder<DerivedValue, DerivedValueBuilder> {
  _$DerivedValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  DerivedValueBuilder();

  DerivedValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DerivedValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DerivedValue;
  }

  @override
  void update(void Function(DerivedValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DerivedValue build() {
    final _$result = _$v ?? new _$DerivedValue._(anInt: anInt);
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithCode extends ValueWithCode {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValueWithCode([void Function(ValueWithCodeBuilder) updates]) =>
      (new ValueWithCodeBuilder()..update(updates)).build();

  _$ValueWithCode._({this.anInt, this.aString}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('ValueWithCode', 'anInt');
    }
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
    return (newBuiltValueToStringHelper('ValueWithCode')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
  }
}

class ValueWithCodeBuilder
    implements Builder<ValueWithCode, ValueWithCodeBuilder> {
  _$ValueWithCode _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  ValueWithCodeBuilder();

  ValueWithCodeBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithCode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithCode;
  }

  @override
  void update(void Function(ValueWithCodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithCode build() {
    final _$result =
        _$v ?? new _$ValueWithCode._(anInt: anInt, aString: aString);
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithDefaults extends ValueWithDefaults {
  @override
  final int anInt;
  @override
  final String aString;
  @override
  final SimpleValue value;

  factory _$ValueWithDefaults(
          [void Function(ValueWithDefaultsBuilder) updates]) =>
      (new ValueWithDefaultsBuilder()..update(updates)).build()
          as _$ValueWithDefaults;

  _$ValueWithDefaults._({this.anInt, this.aString, this.value}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('ValueWithDefaults', 'anInt');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('ValueWithDefaults', 'value');
    }
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
    return (newBuiltValueToStringHelper('ValueWithDefaults')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('value', value))
        .toString();
  }
}

class _$ValueWithDefaultsBuilder extends ValueWithDefaultsBuilder {
  _$ValueWithDefaults _$v;

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
  String get aString {
    _$this;
    return super.aString;
  }

  @override
  set aString(String aString) {
    _$this;
    super.aString = aString;
  }

  @override
  SimpleValueBuilder get value {
    _$this;
    return super.value ??= new SimpleValueBuilder();
  }

  @override
  set value(SimpleValueBuilder value) {
    _$this;
    super.value = value;
  }

  _$ValueWithDefaultsBuilder() : super._();

  ValueWithDefaultsBuilder get _$this {
    if (_$v != null) {
      super.anInt = _$v.anInt;
      super.aString = _$v.aString;
      super.value = _$v.value?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithDefaults other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithDefaults;
  }

  @override
  void update(void Function(ValueWithDefaultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithDefaults build() {
    _$ValueWithDefaults _$result;
    try {
      _$result = _$v ??
          new _$ValueWithDefaults._(
              anInt: anInt, aString: aString, value: value.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ValueWithDefaults', _$failedField, e.toString());
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
          [void Function(ValueWithBuilderSmartsBuilder) updates]) =>
      (new ValueWithBuilderSmartsBuilder()..update(updates)).build()
          as _$ValueWithBuilderSmarts;

  _$ValueWithBuilderSmarts._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('ValueWithBuilderSmarts', 'value');
    }
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
    return (newBuiltValueToStringHelper('ValueWithBuilderSmarts')
          ..add('value', value))
        .toString();
  }
}

class _$ValueWithBuilderSmartsBuilder extends ValueWithBuilderSmartsBuilder {
  _$ValueWithBuilderSmarts _$v;

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
    if (_$v != null) {
      super.value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithBuilderSmarts other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithBuilderSmarts;
  }

  @override
  void update(void Function(ValueWithBuilderSmartsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithBuilderSmarts build() {
    final _$result = _$v ?? new _$ValueWithBuilderSmarts._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$ValidatedValue extends ValidatedValue {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValidatedValue([void Function(ValidatedValueBuilder) updates]) =>
      (new ValidatedValueBuilder()..update(updates)).build();

  _$ValidatedValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('ValidatedValue', 'anInt');
    }
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
    return (newBuiltValueToStringHelper('ValidatedValue')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
  }
}

class ValidatedValueBuilder
    implements Builder<ValidatedValue, ValidatedValueBuilder> {
  _$ValidatedValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  ValidatedValueBuilder();

  ValidatedValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidatedValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValidatedValue;
  }

  @override
  void update(void Function(ValidatedValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValidatedValue build() {
    final _$result =
        _$v ?? new _$ValidatedValue._(anInt: anInt, aString: aString);
    replace(_$result);
    return _$result;
  }
}

class _$ValueUsingImportAs extends ValueUsingImportAs {
  @override
  final using_import_as.TestEnum value;

  factory _$ValueUsingImportAs(
          [void Function(ValueUsingImportAsBuilder) updates]) =>
      (new ValueUsingImportAsBuilder()..update(updates)).build();

  _$ValueUsingImportAs._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('ValueUsingImportAs', 'value');
    }
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
    return other is ValueUsingImportAs && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueUsingImportAs')
          ..add('value', value))
        .toString();
  }
}

class ValueUsingImportAsBuilder
    implements Builder<ValueUsingImportAs, ValueUsingImportAsBuilder> {
  _$ValueUsingImportAs _$v;

  using_import_as.TestEnum _value;
  using_import_as.TestEnum get value => _$this._value;
  set value(using_import_as.TestEnum value) => _$this._value = value;

  ValueUsingImportAsBuilder();

  ValueUsingImportAsBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueUsingImportAs other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueUsingImportAs;
  }

  @override
  void update(void Function(ValueUsingImportAsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueUsingImportAs build() {
    final _$result = _$v ?? new _$ValueUsingImportAs._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$NoFieldsValue extends NoFieldsValue {
  factory _$NoFieldsValue([void Function(NoFieldsValueBuilder) updates]) =>
      (new NoFieldsValueBuilder()..update(updates)).build();

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
    return newBuiltValueToStringHelper('NoFieldsValue').toString();
  }
}

class NoFieldsValueBuilder
    implements Builder<NoFieldsValue, NoFieldsValueBuilder> {
  _$NoFieldsValue _$v;

  NoFieldsValueBuilder();

  @override
  void replace(NoFieldsValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NoFieldsValue;
  }

  @override
  void update(void Function(NoFieldsValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NoFieldsValue build() {
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

  factory _$PrimitivesValue([void Function(PrimitivesValueBuilder) updates]) =>
      (new PrimitivesValueBuilder()..update(updates)).build();

  _$PrimitivesValue._(
      {this.boolean,
      this.integer,
      this.int64,
      this.dbl,
      this.number,
      this.string,
      this.dateTime,
      this.duration,
      this.regExp,
      this.uri,
      this.bigInt})
      : super._() {
    if (boolean == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'boolean');
    }
    if (integer == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'integer');
    }
    if (int64 == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'int64');
    }
    if (dbl == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'dbl');
    }
    if (number == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'number');
    }
    if (string == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'string');
    }
    if (dateTime == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'dateTime');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'duration');
    }
    if (regExp == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'regExp');
    }
    if (uri == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'uri');
    }
    if (bigInt == null) {
      throw new BuiltValueNullFieldError('PrimitivesValue', 'bigInt');
    }
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
    return (newBuiltValueToStringHelper('PrimitivesValue')
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
  _$PrimitivesValue _$v;

  bool _boolean;
  bool get boolean => _$this._boolean;
  set boolean(bool boolean) => _$this._boolean = boolean;

  int _integer;
  int get integer => _$this._integer;
  set integer(int integer) => _$this._integer = integer;

  Int64 _int64;
  Int64 get int64 => _$this._int64;
  set int64(Int64 int64) => _$this._int64 = int64;

  double _dbl;
  double get dbl => _$this._dbl;
  set dbl(double dbl) => _$this._dbl = dbl;

  num _number;
  num get number => _$this._number;
  set number(num number) => _$this._number = number;

  String _string;
  String get string => _$this._string;
  set string(String string) => _$this._string = string;

  DateTime _dateTime;
  DateTime get dateTime => _$this._dateTime;
  set dateTime(DateTime dateTime) => _$this._dateTime = dateTime;

  Duration _duration;
  Duration get duration => _$this._duration;
  set duration(Duration duration) => _$this._duration = duration;

  RegExp _regExp;
  RegExp get regExp => _$this._regExp;
  set regExp(RegExp regExp) => _$this._regExp = regExp;

  Uri _uri;
  Uri get uri => _$this._uri;
  set uri(Uri uri) => _$this._uri = uri;

  BigInt _bigInt;
  BigInt get bigInt => _$this._bigInt;
  set bigInt(BigInt bigInt) => _$this._bigInt = bigInt;

  PrimitivesValueBuilder();

  PrimitivesValueBuilder get _$this {
    if (_$v != null) {
      _boolean = _$v.boolean;
      _integer = _$v.integer;
      _int64 = _$v.int64;
      _dbl = _$v.dbl;
      _number = _$v.number;
      _string = _$v.string;
      _dateTime = _$v.dateTime;
      _duration = _$v.duration;
      _regExp = _$v.regExp;
      _uri = _$v.uri;
      _bigInt = _$v.bigInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrimitivesValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PrimitivesValue;
  }

  @override
  void update(void Function(PrimitivesValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PrimitivesValue build() {
    final _$result = _$v ??
        new _$PrimitivesValue._(
            boolean: boolean,
            integer: integer,
            int64: int64,
            dbl: dbl,
            number: number,
            string: string,
            dateTime: dateTime,
            duration: duration,
            regExp: regExp,
            uri: uri,
            bigInt: bigInt);
    replace(_$result);
    return _$result;
  }
}

class _$FunctionValue extends FunctionValue {
  @override
  final MyFunctionType function;

  factory _$FunctionValue([void Function(FunctionValueBuilder) updates]) =>
      (new FunctionValueBuilder()..update(updates)).build();

  _$FunctionValue._({this.function}) : super._() {
    if (function == null) {
      throw new BuiltValueNullFieldError('FunctionValue', 'function');
    }
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
    return (newBuiltValueToStringHelper('FunctionValue')
          ..add('function', function))
        .toString();
  }
}

class FunctionValueBuilder
    implements Builder<FunctionValue, FunctionValueBuilder> {
  _$FunctionValue _$v;

  MyFunctionType _function;
  MyFunctionType get function => _$this._function;
  set function(MyFunctionType function) => _$this._function = function;

  FunctionValueBuilder();

  FunctionValueBuilder get _$this {
    if (_$v != null) {
      _function = _$v.function;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FunctionValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FunctionValue;
  }

  @override
  void update(void Function(FunctionValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FunctionValue build() {
    final _$result = _$v ?? new _$FunctionValue._(function: function);
    replace(_$result);
    return _$result;
  }
}

class _$ListOfFunctionValue extends ListOfFunctionValue {
  @override
  final BuiltList<MyFunctionType> functions;

  factory _$ListOfFunctionValue(
          [void Function(ListOfFunctionValueBuilder) updates]) =>
      (new ListOfFunctionValueBuilder()..update(updates)).build();

  _$ListOfFunctionValue._({this.functions}) : super._() {
    if (functions == null) {
      throw new BuiltValueNullFieldError('ListOfFunctionValue', 'functions');
    }
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
    return (newBuiltValueToStringHelper('ListOfFunctionValue')
          ..add('functions', functions))
        .toString();
  }
}

class ListOfFunctionValueBuilder
    implements Builder<ListOfFunctionValue, ListOfFunctionValueBuilder> {
  _$ListOfFunctionValue _$v;

  ListBuilder<MyFunctionType> _functions;
  ListBuilder<MyFunctionType> get functions =>
      _$this._functions ??= new ListBuilder<MyFunctionType>();
  set functions(ListBuilder<MyFunctionType> functions) =>
      _$this._functions = functions;

  ListOfFunctionValueBuilder();

  ListOfFunctionValueBuilder get _$this {
    if (_$v != null) {
      _functions = _$v.functions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListOfFunctionValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListOfFunctionValue;
  }

  @override
  void update(void Function(ListOfFunctionValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListOfFunctionValue build() {
    _$ListOfFunctionValue _$result;
    try {
      _$result =
          _$v ?? new _$ListOfFunctionValue._(functions: functions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'functions';
        functions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ListOfFunctionValue', _$failedField, e.toString());
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
  final int transientValue;

  factory _$PartiallySerializableValue(
          [void Function(PartiallySerializableValueBuilder) updates]) =>
      (new PartiallySerializableValueBuilder()..update(updates)).build();

  _$PartiallySerializableValue._({this.value, this.transientValue})
      : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('PartiallySerializableValue', 'value');
    }
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
    return (newBuiltValueToStringHelper('PartiallySerializableValue')
          ..add('value', value)
          ..add('transientValue', transientValue))
        .toString();
  }
}

class PartiallySerializableValueBuilder
    implements
        Builder<PartiallySerializableValue, PartiallySerializableValueBuilder> {
  _$PartiallySerializableValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  int _transientValue;
  int get transientValue => _$this._transientValue;
  set transientValue(int transientValue) =>
      _$this._transientValue = transientValue;

  PartiallySerializableValueBuilder();

  PartiallySerializableValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _transientValue = _$v.transientValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PartiallySerializableValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PartiallySerializableValue;
  }

  @override
  void update(void Function(PartiallySerializableValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PartiallySerializableValue build() {
    final _$result = _$v ??
        new _$PartiallySerializableValue._(
            value: value, transientValue: transientValue);
    replace(_$result);
    return _$result;
  }
}

class _$NamedFactoryValue extends NamedFactoryValue {
  @override
  final int value;

  factory _$NamedFactoryValue(
          [void Function(NamedFactoryValueBuilder) updates]) =>
      (new NamedFactoryValueBuilder()..update(updates)).build();

  _$NamedFactoryValue._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('NamedFactoryValue', 'value');
    }
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
    return (newBuiltValueToStringHelper('NamedFactoryValue')
          ..add('value', value))
        .toString();
  }
}

class NamedFactoryValueBuilder
    implements Builder<NamedFactoryValue, NamedFactoryValueBuilder> {
  _$NamedFactoryValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  NamedFactoryValueBuilder();

  NamedFactoryValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NamedFactoryValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NamedFactoryValue;
  }

  @override
  void update(void Function(NamedFactoryValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NamedFactoryValue build() {
    final _$result = _$v ?? new _$NamedFactoryValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$WireNameValue extends WireNameValue {
  @override
  final int value;

  factory _$WireNameValue([void Function(WireNameValueBuilder) updates]) =>
      (new WireNameValueBuilder()..update(updates)).build();

  _$WireNameValue._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('WireNameValue', 'value');
    }
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
    return (newBuiltValueToStringHelper('WireNameValue')..add('value', value))
        .toString();
  }
}

class WireNameValueBuilder
    implements Builder<WireNameValue, WireNameValueBuilder> {
  _$WireNameValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  WireNameValueBuilder();

  WireNameValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WireNameValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WireNameValue;
  }

  @override
  void update(void Function(WireNameValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WireNameValue build() {
    final _$result = _$v ?? new _$WireNameValue._(value: value);
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
  final FieldDiscoveryValue recursiveValue;

  factory _$FieldDiscoveryValue(
          [void Function(FieldDiscoveryValueBuilder) updates]) =>
      (new FieldDiscoveryValueBuilder()..update(updates)).build();

  _$FieldDiscoveryValue._({this.value, this.values, this.recursiveValue})
      : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('FieldDiscoveryValue', 'value');
    }
    if (values == null) {
      throw new BuiltValueNullFieldError('FieldDiscoveryValue', 'values');
    }
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
    return (newBuiltValueToStringHelper('FieldDiscoveryValue')
          ..add('value', value)
          ..add('values', values)
          ..add('recursiveValue', recursiveValue))
        .toString();
  }
}

class FieldDiscoveryValueBuilder
    implements Builder<FieldDiscoveryValue, FieldDiscoveryValueBuilder> {
  _$FieldDiscoveryValue _$v;

  DiscoverableValueBuilder _value;
  DiscoverableValueBuilder get value =>
      _$this._value ??= new DiscoverableValueBuilder();
  set value(DiscoverableValueBuilder value) => _$this._value = value;

  ListBuilder<ThirdDiscoverableValue> _values;
  ListBuilder<ThirdDiscoverableValue> get values =>
      _$this._values ??= new ListBuilder<ThirdDiscoverableValue>();
  set values(ListBuilder<ThirdDiscoverableValue> values) =>
      _$this._values = values;

  FieldDiscoveryValueBuilder _recursiveValue;
  FieldDiscoveryValueBuilder get recursiveValue =>
      _$this._recursiveValue ??= new FieldDiscoveryValueBuilder();
  set recursiveValue(FieldDiscoveryValueBuilder recursiveValue) =>
      _$this._recursiveValue = recursiveValue;

  FieldDiscoveryValueBuilder();

  FieldDiscoveryValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value?.toBuilder();
      _values = _$v.values?.toBuilder();
      _recursiveValue = _$v.recursiveValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FieldDiscoveryValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FieldDiscoveryValue;
  }

  @override
  void update(void Function(FieldDiscoveryValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FieldDiscoveryValue build() {
    _$FieldDiscoveryValue _$result;
    try {
      _$result = _$v ??
          new _$FieldDiscoveryValue._(
              value: value.build(),
              values: values.build(),
              recursiveValue: _recursiveValue?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
        _$failedField = 'values';
        values.build();
        _$failedField = 'recursiveValue';
        _recursiveValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FieldDiscoveryValue', _$failedField, e.toString());
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
          [void Function(DiscoverableValueBuilder) updates]) =>
      (new DiscoverableValueBuilder()..update(updates)).build();

  _$DiscoverableValue._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('DiscoverableValue', 'value');
    }
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
    return (newBuiltValueToStringHelper('DiscoverableValue')
          ..add('value', value))
        .toString();
  }
}

class DiscoverableValueBuilder
    implements Builder<DiscoverableValue, DiscoverableValueBuilder> {
  _$DiscoverableValue _$v;

  SecondDiscoverableValueBuilder _value;
  SecondDiscoverableValueBuilder get value =>
      _$this._value ??= new SecondDiscoverableValueBuilder();
  set value(SecondDiscoverableValueBuilder value) => _$this._value = value;

  DiscoverableValueBuilder();

  DiscoverableValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiscoverableValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DiscoverableValue;
  }

  @override
  void update(void Function(DiscoverableValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiscoverableValue build() {
    _$DiscoverableValue _$result;
    try {
      _$result = _$v ?? new _$DiscoverableValue._(value: value.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DiscoverableValue', _$failedField, e.toString());
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
          [void Function(SecondDiscoverableValueBuilder) updates]) =>
      (new SecondDiscoverableValueBuilder()..update(updates)).build();

  _$SecondDiscoverableValue._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('SecondDiscoverableValue', 'value');
    }
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
    return (newBuiltValueToStringHelper('SecondDiscoverableValue')
          ..add('value', value))
        .toString();
  }
}

class SecondDiscoverableValueBuilder
    implements
        Builder<SecondDiscoverableValue, SecondDiscoverableValueBuilder> {
  _$SecondDiscoverableValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  SecondDiscoverableValueBuilder();

  SecondDiscoverableValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SecondDiscoverableValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SecondDiscoverableValue;
  }

  @override
  void update(void Function(SecondDiscoverableValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SecondDiscoverableValue build() {
    final _$result = _$v ?? new _$SecondDiscoverableValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$ThirdDiscoverableValue extends ThirdDiscoverableValue {
  @override
  final int value;

  factory _$ThirdDiscoverableValue(
          [void Function(ThirdDiscoverableValueBuilder) updates]) =>
      (new ThirdDiscoverableValueBuilder()..update(updates)).build();

  _$ThirdDiscoverableValue._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('ThirdDiscoverableValue', 'value');
    }
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
    return (newBuiltValueToStringHelper('ThirdDiscoverableValue')
          ..add('value', value))
        .toString();
  }
}

class ThirdDiscoverableValueBuilder
    implements Builder<ThirdDiscoverableValue, ThirdDiscoverableValueBuilder> {
  _$ThirdDiscoverableValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  ThirdDiscoverableValueBuilder();

  ThirdDiscoverableValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThirdDiscoverableValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThirdDiscoverableValue;
  }

  @override
  void update(void Function(ThirdDiscoverableValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ThirdDiscoverableValue build() {
    final _$result = _$v ?? new _$ThirdDiscoverableValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$RecursiveValueA extends RecursiveValueA {
  @override
  final RecursiveValueB value;

  factory _$RecursiveValueA([void Function(RecursiveValueABuilder) updates]) =>
      (new RecursiveValueABuilder()..update(updates)).build();

  _$RecursiveValueA._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('RecursiveValueA', 'value');
    }
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
    return (newBuiltValueToStringHelper('RecursiveValueA')..add('value', value))
        .toString();
  }
}

class RecursiveValueABuilder
    implements Builder<RecursiveValueA, RecursiveValueABuilder> {
  _$RecursiveValueA _$v;

  RecursiveValueBBuilder _value;
  RecursiveValueBBuilder get value =>
      _$this._value ??= new RecursiveValueBBuilder();
  set value(RecursiveValueBBuilder value) => _$this._value = value;

  RecursiveValueABuilder();

  RecursiveValueABuilder get _$this {
    if (_$v != null) {
      _value = _$v.value?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecursiveValueA other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RecursiveValueA;
  }

  @override
  void update(void Function(RecursiveValueABuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RecursiveValueA build() {
    _$RecursiveValueA _$result;
    try {
      _$result = _$v ?? new _$RecursiveValueA._(value: value.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RecursiveValueA', _$failedField, e.toString());
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

  factory _$RecursiveValueB([void Function(RecursiveValueBBuilder) updates]) =>
      (new RecursiveValueBBuilder()..update(updates)).build();

  _$RecursiveValueB._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('RecursiveValueB', 'value');
    }
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
    return (newBuiltValueToStringHelper('RecursiveValueB')..add('value', value))
        .toString();
  }
}

class RecursiveValueBBuilder
    implements Builder<RecursiveValueB, RecursiveValueBBuilder> {
  _$RecursiveValueB _$v;

  RecursiveValueABuilder _value;
  RecursiveValueABuilder get value =>
      _$this._value ??= new RecursiveValueABuilder();
  set value(RecursiveValueABuilder value) => _$this._value = value;

  RecursiveValueBBuilder();

  RecursiveValueBBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecursiveValueB other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RecursiveValueB;
  }

  @override
  void update(void Function(RecursiveValueBBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RecursiveValueB build() {
    _$RecursiveValueB _$result;
    try {
      _$result = _$v ?? new _$RecursiveValueB._(value: value.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RecursiveValueB', _$failedField, e.toString());
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
          [void Function(ValueWithCustomSerializerBuilder) updates]) =>
      (new ValueWithCustomSerializerBuilder()..update(updates)).build();

  _$ValueWithCustomSerializer._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('ValueWithCustomSerializer', 'value');
    }
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
    return (newBuiltValueToStringHelper('ValueWithCustomSerializer')
          ..add('value', value))
        .toString();
  }
}

class ValueWithCustomSerializerBuilder
    implements
        Builder<ValueWithCustomSerializer, ValueWithCustomSerializerBuilder> {
  _$ValueWithCustomSerializer _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  ValueWithCustomSerializerBuilder();

  ValueWithCustomSerializerBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithCustomSerializer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithCustomSerializer;
  }

  @override
  void update(void Function(ValueWithCustomSerializerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithCustomSerializer build() {
    final _$result = _$v ?? new _$ValueWithCustomSerializer._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithOnSet extends ValueWithOnSet {
  @override
  final int value;

  factory _$ValueWithOnSet([void Function(ValueWithOnSetBuilder) updates]) =>
      (new ValueWithOnSetBuilder()..update(updates)).build();

  _$ValueWithOnSet._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('ValueWithOnSet', 'value');
    }
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
    return (newBuiltValueToStringHelper('ValueWithOnSet')..add('value', value))
        .toString();
  }
}

class ValueWithOnSetBuilder
    implements Builder<ValueWithOnSet, ValueWithOnSetBuilder> {
  _$ValueWithOnSet _$v;

  void Function() onSet = () {};

  int _value;
  int get value => _$this._value;
  set value(int value) {
    _$this._value = value;
    onSet();
  }

  ValueWithOnSetBuilder();

  ValueWithOnSetBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithOnSet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithOnSet;
  }

  @override
  void update(void Function(ValueWithOnSetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithOnSet build() {
    final _$result = _$v ?? new _$ValueWithOnSet._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$SerializesNullsValue extends SerializesNullsValue {
  @override
  final String value;

  factory _$SerializesNullsValue(
          [void Function(SerializesNullsValueBuilder) updates]) =>
      (new SerializesNullsValueBuilder()..update(updates)).build();

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
    return (newBuiltValueToStringHelper('SerializesNullsValue')
          ..add('value', value))
        .toString();
  }
}

class SerializesNullsValueBuilder
    implements Builder<SerializesNullsValue, SerializesNullsValueBuilder> {
  _$SerializesNullsValue _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  SerializesNullsValueBuilder();

  SerializesNullsValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializesNullsValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SerializesNullsValue;
  }

  @override
  void update(void Function(SerializesNullsValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SerializesNullsValue build() {
    final _$result = _$v ?? new _$SerializesNullsValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$CustomToStringValue extends CustomToStringValue {
  factory _$CustomToStringValue(
          [void Function(CustomToStringValueBuilder) updates]) =>
      (new CustomToStringValueBuilder()..update(updates)).build();

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
  _$CustomToStringValue _$v;

  CustomToStringValueBuilder();

  @override
  void replace(CustomToStringValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomToStringValue;
  }

  @override
  void update(void Function(CustomToStringValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomToStringValue build() {
    final _$result = _$v ?? new _$CustomToStringValue._();
    replace(_$result);
    return _$result;
  }
}

class _$OtherValue extends OtherValue {
  @override
  final int other;

  factory _$OtherValue([void Function(OtherValueBuilder) updates]) =>
      (new OtherValueBuilder()..update(updates)).build();

  _$OtherValue._({this.other}) : super._() {
    if (other == null) {
      throw new BuiltValueNullFieldError('OtherValue', 'other');
    }
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
    return (newBuiltValueToStringHelper('OtherValue')..add('other', other))
        .toString();
  }
}

class OtherValueBuilder implements Builder<OtherValue, OtherValueBuilder> {
  _$OtherValue _$v;

  int _other;
  int get other => _$this._other;
  set other(int other) => _$this._other = other;

  OtherValueBuilder();

  OtherValueBuilder get _$this {
    if (_$v != null) {
      _other = _$v.other;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OtherValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OtherValue;
  }

  @override
  void update(void Function(OtherValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OtherValue build() {
    final _$result = _$v ?? new _$OtherValue._(other: other);
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
          [void Function(DefaultsForFieldSettingsValueBuilder) updates]) =>
      (new DefaultsForFieldSettingsValueBuilder()..update(updates)).build();

  _$DefaultsForFieldSettingsValue._(
      {this.ignored, this.compared, this.serialized})
      : super._() {
    if (ignored == null) {
      throw new BuiltValueNullFieldError(
          'DefaultsForFieldSettingsValue', 'ignored');
    }
    if (compared == null) {
      throw new BuiltValueNullFieldError(
          'DefaultsForFieldSettingsValue', 'compared');
    }
    if (serialized == null) {
      throw new BuiltValueNullFieldError(
          'DefaultsForFieldSettingsValue', 'serialized');
    }
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
    return (newBuiltValueToStringHelper('DefaultsForFieldSettingsValue')
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
  _$DefaultsForFieldSettingsValue _$v;

  int _ignored;
  int get ignored => _$this._ignored;
  set ignored(int ignored) => _$this._ignored = ignored;

  int _compared;
  int get compared => _$this._compared;
  set compared(int compared) => _$this._compared = compared;

  int _serialized;
  int get serialized => _$this._serialized;
  set serialized(int serialized) => _$this._serialized = serialized;

  DefaultsForFieldSettingsValueBuilder();

  DefaultsForFieldSettingsValueBuilder get _$this {
    if (_$v != null) {
      _ignored = _$v.ignored;
      _compared = _$v.compared;
      _serialized = _$v.serialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DefaultsForFieldSettingsValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DefaultsForFieldSettingsValue;
  }

  @override
  void update(void Function(DefaultsForFieldSettingsValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DefaultsForFieldSettingsValue build() {
    final _$result = _$v ??
        new _$DefaultsForFieldSettingsValue._(
            ignored: ignored, compared: compared, serialized: serialized);
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
  final int nullableInt;
  @override
  final int nullableIntWithDefault;
  @override
  final SimpleValue nestedValue;
  @override
  final SimpleValue nestedValueWithDefault;
  @override
  final SimpleValue nullableNestedValue;
  @override
  final SimpleValue nullableNestedValueWithDefault;

  factory _$ValueWithBuilderInitializer(
          [void Function(ValueWithBuilderInitializerBuilder) updates]) =>
      (new ValueWithBuilderInitializerBuilder()..update(updates)).build();

  _$ValueWithBuilderInitializer._(
      {this.anInt,
      this.anIntWithDefault,
      this.nullableInt,
      this.nullableIntWithDefault,
      this.nestedValue,
      this.nestedValueWithDefault,
      this.nullableNestedValue,
      this.nullableNestedValueWithDefault})
      : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError(
          'ValueWithBuilderInitializer', 'anInt');
    }
    if (anIntWithDefault == null) {
      throw new BuiltValueNullFieldError(
          'ValueWithBuilderInitializer', 'anIntWithDefault');
    }
    if (nestedValue == null) {
      throw new BuiltValueNullFieldError(
          'ValueWithBuilderInitializer', 'nestedValue');
    }
    if (nestedValueWithDefault == null) {
      throw new BuiltValueNullFieldError(
          'ValueWithBuilderInitializer', 'nestedValueWithDefault');
    }
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
    return (newBuiltValueToStringHelper('ValueWithBuilderInitializer')
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
  _$ValueWithBuilderInitializer _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  int _anIntWithDefault;
  int get anIntWithDefault => _$this._anIntWithDefault;
  set anIntWithDefault(int anIntWithDefault) =>
      _$this._anIntWithDefault = anIntWithDefault;

  int _nullableInt;
  int get nullableInt => _$this._nullableInt;
  set nullableInt(int nullableInt) => _$this._nullableInt = nullableInt;

  int _nullableIntWithDefault;
  int get nullableIntWithDefault => _$this._nullableIntWithDefault;
  set nullableIntWithDefault(int nullableIntWithDefault) =>
      _$this._nullableIntWithDefault = nullableIntWithDefault;

  SimpleValueBuilder _nestedValue;
  SimpleValueBuilder get nestedValue =>
      _$this._nestedValue ??= new SimpleValueBuilder();
  set nestedValue(SimpleValueBuilder nestedValue) =>
      _$this._nestedValue = nestedValue;

  SimpleValueBuilder _nestedValueWithDefault;
  SimpleValueBuilder get nestedValueWithDefault =>
      _$this._nestedValueWithDefault ??= new SimpleValueBuilder();
  set nestedValueWithDefault(SimpleValueBuilder nestedValueWithDefault) =>
      _$this._nestedValueWithDefault = nestedValueWithDefault;

  SimpleValueBuilder _nullableNestedValue;
  SimpleValueBuilder get nullableNestedValue =>
      _$this._nullableNestedValue ??= new SimpleValueBuilder();
  set nullableNestedValue(SimpleValueBuilder nullableNestedValue) =>
      _$this._nullableNestedValue = nullableNestedValue;

  SimpleValueBuilder _nullableNestedValueWithDefault;
  SimpleValueBuilder get nullableNestedValueWithDefault =>
      _$this._nullableNestedValueWithDefault ??= new SimpleValueBuilder();
  set nullableNestedValueWithDefault(
          SimpleValueBuilder nullableNestedValueWithDefault) =>
      _$this._nullableNestedValueWithDefault = nullableNestedValueWithDefault;

  ValueWithBuilderInitializerBuilder() {
    ValueWithBuilderInitializer._initializeBuilder(this);
  }

  ValueWithBuilderInitializerBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _anIntWithDefault = _$v.anIntWithDefault;
      _nullableInt = _$v.nullableInt;
      _nullableIntWithDefault = _$v.nullableIntWithDefault;
      _nestedValue = _$v.nestedValue?.toBuilder();
      _nestedValueWithDefault = _$v.nestedValueWithDefault?.toBuilder();
      _nullableNestedValue = _$v.nullableNestedValue?.toBuilder();
      _nullableNestedValueWithDefault =
          _$v.nullableNestedValueWithDefault?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithBuilderInitializer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithBuilderInitializer;
  }

  @override
  void update(void Function(ValueWithBuilderInitializerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithBuilderInitializer build() {
    _$ValueWithBuilderInitializer _$result;
    try {
      _$result = _$v ??
          new _$ValueWithBuilderInitializer._(
              anInt: anInt,
              anIntWithDefault: anIntWithDefault,
              nullableInt: nullableInt,
              nullableIntWithDefault: nullableIntWithDefault,
              nestedValue: nestedValue.build(),
              nestedValueWithDefault: nestedValueWithDefault.build(),
              nullableNestedValue: _nullableNestedValue?.build(),
              nullableNestedValueWithDefault:
                  _nullableNestedValueWithDefault?.build());
    } catch (_) {
      String _$failedField;
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
            'ValueWithBuilderInitializer', _$failedField, e.toString());
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
          [void Function(ValueWithBuilderFinalizerBuilder) updates]) =>
      (new ValueWithBuilderFinalizerBuilder()..update(updates)).build();

  _$ValueWithBuilderFinalizer._({this.anInt}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('ValueWithBuilderFinalizer', 'anInt');
    }
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
    return (newBuiltValueToStringHelper('ValueWithBuilderFinalizer')
          ..add('anInt', anInt))
        .toString();
  }
}

class ValueWithBuilderFinalizerBuilder
    implements
        Builder<ValueWithBuilderFinalizer, ValueWithBuilderFinalizerBuilder> {
  _$ValueWithBuilderFinalizer _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  ValueWithBuilderFinalizerBuilder();

  ValueWithBuilderFinalizerBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithBuilderFinalizer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithBuilderFinalizer;
  }

  @override
  void update(void Function(ValueWithBuilderFinalizerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithBuilderFinalizer build() {
    ValueWithBuilderFinalizer._finalizeBuilder(this);
    final _$result = _$v ?? new _$ValueWithBuilderFinalizer._(anInt: anInt);
    replace(_$result);
    return _$result;
  }
}

class _$ValueWithGenericBuilderInitializer<T>
    extends ValueWithGenericBuilderInitializer<T> {
  @override
  final T value;

  factory _$ValueWithGenericBuilderInitializer(
          [void Function(ValueWithGenericBuilderInitializerBuilder<T>)
              updates]) =>
      (new ValueWithGenericBuilderInitializerBuilder<T>()..update(updates))
          .build();

  _$ValueWithGenericBuilderInitializer._({this.value}) : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          'ValueWithGenericBuilderInitializer', 'T');
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
    return (newBuiltValueToStringHelper('ValueWithGenericBuilderInitializer')
          ..add('value', value))
        .toString();
  }
}

class ValueWithGenericBuilderInitializerBuilder<T>
    implements
        Builder<ValueWithGenericBuilderInitializer<T>,
            ValueWithGenericBuilderInitializerBuilder<T>> {
  _$ValueWithGenericBuilderInitializer<T> _$v;

  T _value;
  T get value => _$this._value;
  set value(T value) => _$this._value = value;

  ValueWithGenericBuilderInitializerBuilder() {
    ValueWithGenericBuilderInitializer._initializeBuilder(this);
  }

  ValueWithGenericBuilderInitializerBuilder<T> get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithGenericBuilderInitializer<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueWithGenericBuilderInitializer<T>;
  }

  @override
  void update(
      void Function(ValueWithGenericBuilderInitializerBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueWithGenericBuilderInitializer<T> build() {
    final _$result =
        _$v ?? new _$ValueWithGenericBuilderInitializer<T>._(value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
