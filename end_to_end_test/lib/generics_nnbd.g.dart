// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'generics_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GenericValue<Object?>> _$genericValueSerializer =
    new _$GenericValueSerializer();
Serializer<BoundGenericValue<num>> _$boundGenericValueSerializer =
    new _$BoundGenericValueSerializer();
Serializer<BoundNullableGenericValue<num>>
    _$boundNullableGenericValueSerializer =
    new _$BoundNullableGenericValueSerializer();
Serializer<CollectionGenericValue<Object?>> _$collectionGenericValueSerializer =
    new _$CollectionGenericValueSerializer();
Serializer<GenericContainer> _$genericContainerSerializer =
    new _$GenericContainerSerializer();
Serializer<PassthroughGenericContainer<Object?>>
    _$passthroughGenericContainerSerializer =
    new _$PassthroughGenericContainerSerializer();
Serializer<NestedGenericContainer> _$nestedGenericContainerSerializer =
    new _$NestedGenericContainerSerializer();
Serializer<ConcreteGeneric> _$concreteGenericSerializer =
    new _$ConcreteGenericSerializer();
Serializer<NonBuiltGeneric> _$nonBuiltGenericSerializer =
    new _$NonBuiltGenericSerializer();
Serializer<EmptyGeneric<Object?, Object?>> _$emptyGenericSerializer =
    new _$EmptyGenericSerializer();
Serializer<ConstAndGeneric<Object?>> _$constAndGenericSerializer =
    new _$ConstAndGenericSerializer();

class _$GenericValueSerializer
    implements StructuredSerializer<GenericValue<Object?>> {
  @override
  final Iterable<Type> types = const [GenericValue, _$GenericValue];
  @override
  final String wireName = 'GenericValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GenericValue<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: parameterT),
    ];

    return result;
  }

  @override
  GenericValue<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new GenericValueBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as GenericValueBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
      }
    }

    return result.build();
  }
}

class _$BoundGenericValueSerializer
    implements StructuredSerializer<BoundGenericValue<num>> {
  @override
  final Iterable<Type> types = const [BoundGenericValue, _$BoundGenericValue];
  @override
  final String wireName = 'BoundGenericValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BoundGenericValue<num> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: parameterT),
    ];
    Object? value;
    value = object.nullableValue;
    if (value != null) {
      result
        ..add('nullableValue')
        ..add(serializers.serialize(value, specifiedType: parameterT));
    }
    return result;
  }

  @override
  BoundGenericValue<num> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new BoundGenericValueBuilder<num>()
        : serializers.newBuilder(specifiedType)
            as BoundGenericValueBuilder<num>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(value, specifiedType: parameterT)! as num;
          break;
        case 'nullableValue':
          result.nullableValue =
              serializers.deserialize(value, specifiedType: parameterT) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$BoundNullableGenericValueSerializer
    implements StructuredSerializer<BoundNullableGenericValue<num>> {
  @override
  final Iterable<Type> types = const [
    BoundNullableGenericValue,
    _$BoundNullableGenericValue
  ];
  @override
  final String wireName = 'BoundNullableGenericValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BoundNullableGenericValue<num> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: parameterT),
    ];
    Object? value;
    value = object.nullableValue;
    if (value != null) {
      result
        ..add('nullableValue')
        ..add(serializers.serialize(value, specifiedType: parameterT));
    }
    return result;
  }

  @override
  BoundNullableGenericValue<num> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new BoundNullableGenericValueBuilder<num>()
        : serializers.newBuilder(specifiedType)
            as BoundNullableGenericValueBuilder<num>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(value, specifiedType: parameterT)! as num;
          break;
        case 'nullableValue':
          result.nullableValue =
              serializers.deserialize(value, specifiedType: parameterT) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$CollectionGenericValueSerializer
    implements StructuredSerializer<CollectionGenericValue<Object?>> {
  @override
  final Iterable<Type> types = const [
    CollectionGenericValue,
    _$CollectionGenericValue
  ];
  @override
  final String wireName = 'CollectionGenericValue';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CollectionGenericValue<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'values',
      serializers.serialize(object.values,
          specifiedType: new FullType(BuiltList, [parameterT])),
    ];

    return result;
  }

  @override
  CollectionGenericValue<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new CollectionGenericValueBuilder<Object?>()
        : serializers.newBuilder(specifiedType)
            as CollectionGenericValueBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType: new FullType(BuiltList, [parameterT]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GenericContainerSerializer
    implements StructuredSerializer<GenericContainer> {
  @override
  final Iterable<Type> types = const [GenericContainer, _$GenericContainer];
  @override
  final String wireName = 'GenericContainer';

  @override
  Iterable<Object?> serialize(Serializers serializers, GenericContainer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'genericValue',
      serializers.serialize(object.genericValue,
          specifiedType:
              const FullType(GenericValue, const [const FullType(String)])),
      'boundGenericValue',
      serializers.serialize(object.boundGenericValue,
          specifiedType: const FullType(
              BoundGenericValue, const [const FullType(double)])),
      'collectionGenericValue',
      serializers.serialize(object.collectionGenericValue,
          specifiedType: const FullType(
              CollectionGenericValue, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GenericContainer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GenericContainerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'genericValue':
          result.genericValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GenericValue, const [const FullType(String)]))!
              as GenericValue<String>);
          break;
        case 'boundGenericValue':
          result.boundGenericValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BoundGenericValue, const [const FullType(double)]))!
              as BoundGenericValue<double>);
          break;
        case 'collectionGenericValue':
          result.collectionGenericValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      CollectionGenericValue, const [const FullType(String)]))!
              as CollectionGenericValue<String>);
          break;
      }
    }

    return result.build();
  }
}

class _$PassthroughGenericContainerSerializer
    implements StructuredSerializer<PassthroughGenericContainer<Object?>> {
  @override
  final Iterable<Type> types = const [
    PassthroughGenericContainer,
    _$PassthroughGenericContainer
  ];
  @override
  final String wireName = 'PassthroughGenericContainer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PassthroughGenericContainer<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'genericValue',
      serializers.serialize(object.genericValue,
          specifiedType: new FullType(GenericValue, [parameterT])),
      'collectionGenericValue',
      serializers.serialize(object.collectionGenericValue,
          specifiedType: new FullType(CollectionGenericValue, [parameterT])),
    ];

    return result;
  }

  @override
  PassthroughGenericContainer<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new PassthroughGenericContainerBuilder<Object?>()
        : serializers.newBuilder(specifiedType)
            as PassthroughGenericContainerBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'genericValue':
          result.genericValue.replace(serializers.deserialize(value,
                  specifiedType: new FullType(GenericValue, [parameterT]))!
              as GenericValue<Object>);
          break;
        case 'collectionGenericValue':
          result.collectionGenericValue.replace(serializers.deserialize(value,
                  specifiedType:
                      new FullType(CollectionGenericValue, [parameterT]))!
              as CollectionGenericValue<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$NestedGenericContainerSerializer
    implements StructuredSerializer<NestedGenericContainer> {
  @override
  final Iterable<Type> types = const [
    NestedGenericContainer,
    _$NestedGenericContainer
  ];
  @override
  final String wireName = 'NestedGenericContainer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NestedGenericContainer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(GenericValue, const [
            const FullType(
                BuiltMap, const [const FullType(int), const FullType(String)])
          ])),
    ];

    return result;
  }

  @override
  NestedGenericContainer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NestedGenericContainerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(GenericValue, const [
                const FullType(BuiltMap,
                    const [const FullType(int), const FullType(String)])
              ]))! as GenericValue<BuiltMap<int, String>>);
          break;
      }
    }

    return result.build();
  }
}

class _$ConcreteGenericSerializer
    implements StructuredSerializer<ConcreteGeneric> {
  @override
  final Iterable<Type> types = const [ConcreteGeneric, _$ConcreteGeneric];
  @override
  final String wireName = 'ConcreteGeneric';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConcreteGeneric object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ConcreteGeneric deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConcreteGenericBuilder();

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

class _$NonBuiltGenericSerializer
    implements StructuredSerializer<NonBuiltGeneric> {
  @override
  final Iterable<Type> types = const [NonBuiltGeneric, _$NonBuiltGeneric];
  @override
  final String wireName = 'NonBuiltGeneric';

  @override
  Iterable<Object?> serialize(Serializers serializers, NonBuiltGeneric object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(NonBuilt, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  NonBuiltGeneric deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NonBuiltGenericBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
                  specifiedType:
                      const FullType(NonBuilt, const [const FullType(int)]))!
              as NonBuilt<int>;
          break;
      }
    }

    return result.build();
  }
}

class _$EmptyGenericSerializer
    implements StructuredSerializer<EmptyGeneric<Object?, Object?>> {
  @override
  final Iterable<Type> types = const [EmptyGeneric, _$EmptyGeneric];
  @override
  final String wireName = 'EmptyGeneric';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EmptyGeneric<Object?, Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  EmptyGeneric<Object?, Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new EmptyGenericBuilder<Object?, Object?>().build();
  }
}

class _$ConstAndGenericSerializer
    implements StructuredSerializer<ConstAndGeneric<Object?>> {
  @override
  final Iterable<Type> types = const [ConstAndGeneric, _$ConstAndGeneric];
  @override
  final String wireName = 'ConstAndGeneric';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConstAndGeneric<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'map',
      serializers.serialize(object.map,
          specifiedType:
              new FullType(BuiltMap, [const FullType(String), parameterT])),
    ];

    return result;
  }

  @override
  ConstAndGeneric<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ConstAndGenericBuilder<Object?>()
        : serializers.newBuilder(specifiedType)
            as ConstAndGenericBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: new FullType(
                  BuiltMap, [const FullType(String), parameterT]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$GenericValue<T> extends GenericValue<T> {
  @override
  final T value;

  factory _$GenericValue([void Function(GenericValueBuilder<T>)? updates]) =>
      (new GenericValueBuilder<T>()..update(updates))._build();

  _$GenericValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GenericValue', 'value');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'GenericValue', 'T');
    }
  }

  @override
  GenericValue<T> rebuild(void Function(GenericValueBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericValueBuilder<T> toBuilder() =>
      new GenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenericValue')..add('value', value))
        .toString();
  }
}

class GenericValueBuilder<T>
    implements Builder<GenericValue<T>, GenericValueBuilder<T>> {
  _$GenericValue<T>? _$v;

  T? _value;
  T? get value => _$this._value;
  set value(T? value) => _$this._value = value;

  GenericValueBuilder();

  GenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericValue<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericValue<T>;
  }

  @override
  void update(void Function(GenericValueBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericValue<T> build() => _build();

  _$GenericValue<T> _build() {
    final _$result = _$v ??
        new _$GenericValue<T>._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GenericValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$InitializeGenericValue<T> extends InitializeGenericValue<T> {
  @override
  final T value;

  factory _$InitializeGenericValue(
          [void Function(InitializeGenericValueBuilder<T>)? updates]) =>
      (new InitializeGenericValueBuilder<T>()..update(updates))._build();

  _$InitializeGenericValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'InitializeGenericValue', 'value');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'InitializeGenericValue', 'T');
    }
  }

  @override
  InitializeGenericValue<T> rebuild(
          void Function(InitializeGenericValueBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitializeGenericValueBuilder<T> toBuilder() =>
      new InitializeGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitializeGenericValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitializeGenericValue')
          ..add('value', value))
        .toString();
  }
}

class InitializeGenericValueBuilder<T>
    implements
        Builder<InitializeGenericValue<T>, InitializeGenericValueBuilder<T>> {
  _$InitializeGenericValue<T>? _$v;

  T? _value;
  T? get value => _$this._value;
  set value(T? value) => _$this._value = value;

  InitializeGenericValueBuilder() {
    InitializeGenericValue._initializeBuilder(this);
  }

  InitializeGenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitializeGenericValue<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitializeGenericValue<T>;
  }

  @override
  void update(void Function(InitializeGenericValueBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitializeGenericValue<T> build() => _build();

  _$InitializeGenericValue<T> _build() {
    final _$result = _$v ??
        new _$InitializeGenericValue<T>._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'InitializeGenericValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$BoundGenericValue<T extends num> extends BoundGenericValue<T> {
  @override
  final T value;
  @override
  final T? nullableValue;

  factory _$BoundGenericValue(
          [void Function(BoundGenericValueBuilder<T>)? updates]) =>
      (new BoundGenericValueBuilder<T>()..update(updates))._build();

  _$BoundGenericValue._({required this.value, this.nullableValue}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'BoundGenericValue', 'value');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'BoundGenericValue', 'T');
    }
  }

  @override
  BoundGenericValue<T> rebuild(
          void Function(BoundGenericValueBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoundGenericValueBuilder<T> toBuilder() =>
      new BoundGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoundGenericValue &&
        value == other.value &&
        nullableValue == other.nullableValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), nullableValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BoundGenericValue')
          ..add('value', value)
          ..add('nullableValue', nullableValue))
        .toString();
  }
}

class BoundGenericValueBuilder<T extends num>
    implements Builder<BoundGenericValue<T>, BoundGenericValueBuilder<T>> {
  _$BoundGenericValue<T>? _$v;

  T? _value;
  T? get value => _$this._value;
  set value(T? value) => _$this._value = value;

  T? _nullableValue;
  T? get nullableValue => _$this._nullableValue;
  set nullableValue(T? nullableValue) => _$this._nullableValue = nullableValue;

  BoundGenericValueBuilder();

  BoundGenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _nullableValue = $v.nullableValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoundGenericValue<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BoundGenericValue<T>;
  }

  @override
  void update(void Function(BoundGenericValueBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BoundGenericValue<T> build() => _build();

  _$BoundGenericValue<T> _build() {
    final _$result = _$v ??
        new _$BoundGenericValue<T>._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'BoundGenericValue', 'value'),
            nullableValue: nullableValue);
    replace(_$result);
    return _$result;
  }
}

class _$BoundNullableGenericValue<T extends num?>
    extends BoundNullableGenericValue<T> {
  @override
  final T value;
  @override
  final T? nullableValue;

  factory _$BoundNullableGenericValue(
          [void Function(BoundNullableGenericValueBuilder<T>)? updates]) =>
      (new BoundNullableGenericValueBuilder<T>()..update(updates))._build();

  _$BoundNullableGenericValue._({required this.value, this.nullableValue})
      : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          r'BoundNullableGenericValue', 'T');
    }
  }

  @override
  BoundNullableGenericValue<T> rebuild(
          void Function(BoundNullableGenericValueBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoundNullableGenericValueBuilder<T> toBuilder() =>
      new BoundNullableGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoundNullableGenericValue &&
        value == other.value &&
        nullableValue == other.nullableValue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), nullableValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BoundNullableGenericValue')
          ..add('value', value)
          ..add('nullableValue', nullableValue))
        .toString();
  }
}

class BoundNullableGenericValueBuilder<T extends num?>
    implements
        Builder<BoundNullableGenericValue<T>,
            BoundNullableGenericValueBuilder<T>> {
  _$BoundNullableGenericValue<T>? _$v;

  T? _value;
  T? get value => _$this._value;
  set value(T? value) => _$this._value = value;

  T? _nullableValue;
  T? get nullableValue => _$this._nullableValue;
  set nullableValue(T? nullableValue) => _$this._nullableValue = nullableValue;

  BoundNullableGenericValueBuilder();

  BoundNullableGenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _nullableValue = $v.nullableValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoundNullableGenericValue<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BoundNullableGenericValue<T>;
  }

  @override
  void update(void Function(BoundNullableGenericValueBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BoundNullableGenericValue<T> build() => _build();

  _$BoundNullableGenericValue<T> _build() {
    final _$result = _$v ??
        new _$BoundNullableGenericValue<T>._(
            value: null is T
                ? value as T
                : BuiltValueNullFieldError.checkNotNull(
                    value, r'BoundNullableGenericValue', 'value'),
            nullableValue: nullableValue);
    replace(_$result);
    return _$result;
  }
}

class _$CollectionGenericValue<T> extends CollectionGenericValue<T> {
  @override
  final BuiltList<T> values;

  factory _$CollectionGenericValue(
          [void Function(CollectionGenericValueBuilder<T>)? updates]) =>
      (new CollectionGenericValueBuilder<T>()..update(updates))._build();

  _$CollectionGenericValue._({required this.values}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        values, r'CollectionGenericValue', 'values');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'CollectionGenericValue', 'T');
    }
  }

  @override
  CollectionGenericValue<T> rebuild(
          void Function(CollectionGenericValueBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionGenericValueBuilder<T> toBuilder() =>
      new CollectionGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionGenericValue && values == other.values;
  }

  @override
  int get hashCode {
    return $jf($jc(0, values.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectionGenericValue')
          ..add('values', values))
        .toString();
  }
}

class CollectionGenericValueBuilder<T>
    implements
        Builder<CollectionGenericValue<T>, CollectionGenericValueBuilder<T>> {
  _$CollectionGenericValue<T>? _$v;

  ListBuilder<T>? _values;
  ListBuilder<T> get values => _$this._values ??= new ListBuilder<T>();
  set values(ListBuilder<T>? values) => _$this._values = values;

  CollectionGenericValueBuilder();

  CollectionGenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _values = $v.values.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionGenericValue<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectionGenericValue<T>;
  }

  @override
  void update(void Function(CollectionGenericValueBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionGenericValue<T> build() => _build();

  _$CollectionGenericValue<T> _build() {
    _$CollectionGenericValue<T> _$result;
    try {
      _$result =
          _$v ?? new _$CollectionGenericValue<T>._(values: values.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        values.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CollectionGenericValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GenericContainer extends GenericContainer {
  @override
  final GenericValue<String> genericValue;
  @override
  final BoundGenericValue<double> boundGenericValue;
  @override
  final CollectionGenericValue<String> collectionGenericValue;

  factory _$GenericContainer(
          [void Function(GenericContainerBuilder)? updates]) =>
      (new GenericContainerBuilder()..update(updates))._build();

  _$GenericContainer._(
      {required this.genericValue,
      required this.boundGenericValue,
      required this.collectionGenericValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        genericValue, r'GenericContainer', 'genericValue');
    BuiltValueNullFieldError.checkNotNull(
        boundGenericValue, r'GenericContainer', 'boundGenericValue');
    BuiltValueNullFieldError.checkNotNull(
        collectionGenericValue, r'GenericContainer', 'collectionGenericValue');
  }

  @override
  GenericContainer rebuild(void Function(GenericContainerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericContainerBuilder toBuilder() =>
      new GenericContainerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericContainer &&
        genericValue == other.genericValue &&
        boundGenericValue == other.boundGenericValue &&
        collectionGenericValue == other.collectionGenericValue;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, genericValue.hashCode), boundGenericValue.hashCode),
        collectionGenericValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenericContainer')
          ..add('genericValue', genericValue)
          ..add('boundGenericValue', boundGenericValue)
          ..add('collectionGenericValue', collectionGenericValue))
        .toString();
  }
}

class GenericContainerBuilder
    implements Builder<GenericContainer, GenericContainerBuilder> {
  _$GenericContainer? _$v;

  GenericValueBuilder<String>? _genericValue;
  GenericValueBuilder<String> get genericValue =>
      _$this._genericValue ??= new GenericValueBuilder<String>();
  set genericValue(GenericValueBuilder<String>? genericValue) =>
      _$this._genericValue = genericValue;

  BoundGenericValueBuilder<double>? _boundGenericValue;
  BoundGenericValueBuilder<double> get boundGenericValue =>
      _$this._boundGenericValue ??= new BoundGenericValueBuilder<double>();
  set boundGenericValue(BoundGenericValueBuilder<double>? boundGenericValue) =>
      _$this._boundGenericValue = boundGenericValue;

  CollectionGenericValueBuilder<String>? _collectionGenericValue;
  CollectionGenericValueBuilder<String> get collectionGenericValue =>
      _$this._collectionGenericValue ??=
          new CollectionGenericValueBuilder<String>();
  set collectionGenericValue(
          CollectionGenericValueBuilder<String>? collectionGenericValue) =>
      _$this._collectionGenericValue = collectionGenericValue;

  GenericContainerBuilder();

  GenericContainerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _genericValue = $v.genericValue.toBuilder();
      _boundGenericValue = $v.boundGenericValue.toBuilder();
      _collectionGenericValue = $v.collectionGenericValue.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericContainer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericContainer;
  }

  @override
  void update(void Function(GenericContainerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericContainer build() => _build();

  _$GenericContainer _build() {
    _$GenericContainer _$result;
    try {
      _$result = _$v ??
          new _$GenericContainer._(
              genericValue: genericValue.build(),
              boundGenericValue: boundGenericValue.build(),
              collectionGenericValue: collectionGenericValue.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genericValue';
        genericValue.build();
        _$failedField = 'boundGenericValue';
        boundGenericValue.build();
        _$failedField = 'collectionGenericValue';
        collectionGenericValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GenericContainer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DynamicGenericContainer extends DynamicGenericContainer {
  @override
  final Generic<dynamic> foo;

  factory _$DynamicGenericContainer(
          [void Function(DynamicGenericContainerBuilder)? updates]) =>
      (new DynamicGenericContainerBuilder()..update(updates))._build();

  _$DynamicGenericContainer._({required this.foo}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        foo, r'DynamicGenericContainer', 'foo');
  }

  @override
  DynamicGenericContainer rebuild(
          void Function(DynamicGenericContainerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DynamicGenericContainerBuilder toBuilder() =>
      new DynamicGenericContainerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DynamicGenericContainer && foo == other.foo;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DynamicGenericContainer')
          ..add('foo', foo))
        .toString();
  }
}

class DynamicGenericContainerBuilder
    implements
        Builder<DynamicGenericContainer, DynamicGenericContainerBuilder> {
  _$DynamicGenericContainer? _$v;

  Generic<dynamic>? _foo;
  Generic<dynamic>? get foo => _$this._foo;
  set foo(Generic<dynamic>? foo) => _$this._foo = foo;

  DynamicGenericContainerBuilder();

  DynamicGenericContainerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foo = $v.foo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DynamicGenericContainer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DynamicGenericContainer;
  }

  @override
  void update(void Function(DynamicGenericContainerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DynamicGenericContainer build() => _build();

  _$DynamicGenericContainer _build() {
    final _$result = _$v ??
        new _$DynamicGenericContainer._(
            foo: BuiltValueNullFieldError.checkNotNull(
                foo, r'DynamicGenericContainer', 'foo'));
    replace(_$result);
    return _$result;
  }
}

class _$PassthroughGenericContainer<T> extends PassthroughGenericContainer<T> {
  @override
  final GenericValue<T> genericValue;
  @override
  final CollectionGenericValue<T> collectionGenericValue;

  factory _$PassthroughGenericContainer(
          [void Function(PassthroughGenericContainerBuilder<T>)? updates]) =>
      (new PassthroughGenericContainerBuilder<T>()..update(updates))._build();

  _$PassthroughGenericContainer._(
      {required this.genericValue, required this.collectionGenericValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        genericValue, r'PassthroughGenericContainer', 'genericValue');
    BuiltValueNullFieldError.checkNotNull(collectionGenericValue,
        r'PassthroughGenericContainer', 'collectionGenericValue');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          r'PassthroughGenericContainer', 'T');
    }
  }

  @override
  PassthroughGenericContainer<T> rebuild(
          void Function(PassthroughGenericContainerBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PassthroughGenericContainerBuilder<T> toBuilder() =>
      new PassthroughGenericContainerBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassthroughGenericContainer &&
        genericValue == other.genericValue &&
        collectionGenericValue == other.collectionGenericValue;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, genericValue.hashCode), collectionGenericValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassthroughGenericContainer')
          ..add('genericValue', genericValue)
          ..add('collectionGenericValue', collectionGenericValue))
        .toString();
  }
}

class PassthroughGenericContainerBuilder<T>
    implements
        Builder<PassthroughGenericContainer<T>,
            PassthroughGenericContainerBuilder<T>> {
  _$PassthroughGenericContainer<T>? _$v;

  GenericValueBuilder<T>? _genericValue;
  GenericValueBuilder<T> get genericValue =>
      _$this._genericValue ??= new GenericValueBuilder<T>();
  set genericValue(GenericValueBuilder<T>? genericValue) =>
      _$this._genericValue = genericValue;

  CollectionGenericValueBuilder<T>? _collectionGenericValue;
  CollectionGenericValueBuilder<T> get collectionGenericValue =>
      _$this._collectionGenericValue ??= new CollectionGenericValueBuilder<T>();
  set collectionGenericValue(
          CollectionGenericValueBuilder<T>? collectionGenericValue) =>
      _$this._collectionGenericValue = collectionGenericValue;

  PassthroughGenericContainerBuilder();

  PassthroughGenericContainerBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _genericValue = $v.genericValue.toBuilder();
      _collectionGenericValue = $v.collectionGenericValue.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PassthroughGenericContainer<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PassthroughGenericContainer<T>;
  }

  @override
  void update(void Function(PassthroughGenericContainerBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PassthroughGenericContainer<T> build() => _build();

  _$PassthroughGenericContainer<T> _build() {
    _$PassthroughGenericContainer<T> _$result;
    try {
      _$result = _$v ??
          new _$PassthroughGenericContainer<T>._(
              genericValue: genericValue.build(),
              collectionGenericValue: collectionGenericValue.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genericValue';
        genericValue.build();
        _$failedField = 'collectionGenericValue';
        collectionGenericValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PassthroughGenericContainer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NestedGenericContainer extends NestedGenericContainer {
  @override
  final GenericValue<BuiltMap<int, String>> map;

  factory _$NestedGenericContainer(
          [void Function(NestedGenericContainerBuilder)? updates]) =>
      (new NestedGenericContainerBuilder()..update(updates))._build();

  _$NestedGenericContainer._({required this.map}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        map, r'NestedGenericContainer', 'map');
  }

  @override
  NestedGenericContainer rebuild(
          void Function(NestedGenericContainerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NestedGenericContainerBuilder toBuilder() =>
      new NestedGenericContainerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NestedGenericContainer && map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NestedGenericContainer')
          ..add('map', map))
        .toString();
  }
}

class NestedGenericContainerBuilder
    implements Builder<NestedGenericContainer, NestedGenericContainerBuilder> {
  _$NestedGenericContainer? _$v;

  GenericValueBuilder<BuiltMap<int, String>>? _map;
  GenericValueBuilder<BuiltMap<int, String>> get map =>
      _$this._map ??= new GenericValueBuilder<BuiltMap<int, String>>();
  set map(GenericValueBuilder<BuiltMap<int, String>>? map) => _$this._map = map;

  NestedGenericContainerBuilder();

  NestedGenericContainerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _map = $v.map.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NestedGenericContainer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NestedGenericContainer;
  }

  @override
  void update(void Function(NestedGenericContainerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NestedGenericContainer build() => _build();

  _$NestedGenericContainer _build() {
    _$NestedGenericContainer _$result;
    try {
      _$result = _$v ?? new _$NestedGenericContainer._(map: map.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NestedGenericContainer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CustomBuilderGenericValue<T> extends CustomBuilderGenericValue<T> {
  @override
  final T value;

  factory _$CustomBuilderGenericValue(
          [void Function(CustomBuilderGenericValueBuilder<T>)? updates]) =>
      (new CustomBuilderGenericValueBuilder<T>()..update(updates)).build()
          as _$CustomBuilderGenericValue<T>;

  _$CustomBuilderGenericValue._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'CustomBuilderGenericValue', 'value');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          r'CustomBuilderGenericValue', 'T');
    }
  }

  @override
  CustomBuilderGenericValue<T> rebuild(
          void Function(CustomBuilderGenericValueBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$CustomBuilderGenericValueBuilder<T> toBuilder() =>
      new _$CustomBuilderGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomBuilderGenericValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomBuilderGenericValue')
          ..add('value', value))
        .toString();
  }
}

class _$CustomBuilderGenericValueBuilder<T>
    extends CustomBuilderGenericValueBuilder<T> {
  _$CustomBuilderGenericValue<T>? _$v;

  @override
  T? get value {
    _$this;
    return super.value;
  }

  @override
  set value(T? value) {
    _$this;
    super.value = value;
  }

  _$CustomBuilderGenericValueBuilder() : super._();

  CustomBuilderGenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      super.value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomBuilderGenericValue<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomBuilderGenericValue<T>;
  }

  @override
  void update(void Function(CustomBuilderGenericValueBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomBuilderGenericValue<T> build() => _build();

  _$CustomBuilderGenericValue<T> _build() {
    final _$result = _$v ??
        new _$CustomBuilderGenericValue<T>._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'CustomBuilderGenericValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$ConcreteGeneric extends ConcreteGeneric {
  @override
  final int value;

  factory _$ConcreteGeneric([void Function(ConcreteGenericBuilder)? updates]) =>
      (new ConcreteGenericBuilder()..update(updates))._build();

  _$ConcreteGeneric._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'ConcreteGeneric', 'value');
  }

  @override
  ConcreteGeneric rebuild(void Function(ConcreteGenericBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConcreteGenericBuilder toBuilder() =>
      new ConcreteGenericBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConcreteGeneric && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConcreteGeneric')
          ..add('value', value))
        .toString();
  }
}

class ConcreteGenericBuilder
    implements Builder<ConcreteGeneric, ConcreteGenericBuilder> {
  _$ConcreteGeneric? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  ConcreteGenericBuilder();

  ConcreteGenericBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConcreteGeneric other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConcreteGeneric;
  }

  @override
  void update(void Function(ConcreteGenericBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConcreteGeneric build() => _build();

  _$ConcreteGeneric _build() {
    final _$result = _$v ??
        new _$ConcreteGeneric._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ConcreteGeneric', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GenericFunction<T> extends GenericFunction<T> {
  @override
  final Function(T) function;

  factory _$GenericFunction(
          [void Function(GenericFunctionBuilder<T>)? updates]) =>
      (new GenericFunctionBuilder<T>()..update(updates))._build();

  _$GenericFunction._({required this.function}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        function, r'GenericFunction', 'function');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'GenericFunction', 'T');
    }
  }

  @override
  GenericFunction<T> rebuild(
          void Function(GenericFunctionBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericFunctionBuilder<T> toBuilder() =>
      new GenericFunctionBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GenericFunction && function == _$dynamicOther.function;
  }

  @override
  int get hashCode {
    return $jf($jc(0, function.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenericFunction')
          ..add('function', function))
        .toString();
  }
}

class GenericFunctionBuilder<T>
    implements Builder<GenericFunction<T>, GenericFunctionBuilder<T>> {
  _$GenericFunction<T>? _$v;

  Function(T)? _function;
  Function(T)? get function => _$this._function;
  set function(Function(T)? function) => _$this._function = function;

  GenericFunctionBuilder();

  GenericFunctionBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _function = $v.function;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericFunction<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericFunction<T>;
  }

  @override
  void update(void Function(GenericFunctionBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericFunction<T> build() => _build();

  _$GenericFunction<T> _build() {
    final _$result = _$v ??
        new _$GenericFunction<T>._(
            function: BuiltValueNullFieldError.checkNotNull(
                function, r'GenericFunction', 'function'));
    replace(_$result);
    return _$result;
  }
}

class _$NonBuiltGeneric extends NonBuiltGeneric {
  @override
  final NonBuilt<int> value;

  factory _$NonBuiltGeneric([void Function(NonBuiltGenericBuilder)? updates]) =>
      (new NonBuiltGenericBuilder()..update(updates))._build();

  _$NonBuiltGeneric._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'NonBuiltGeneric', 'value');
  }

  @override
  NonBuiltGeneric rebuild(void Function(NonBuiltGenericBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NonBuiltGenericBuilder toBuilder() =>
      new NonBuiltGenericBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NonBuiltGeneric && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NonBuiltGeneric')
          ..add('value', value))
        .toString();
  }
}

class NonBuiltGenericBuilder
    implements Builder<NonBuiltGeneric, NonBuiltGenericBuilder> {
  _$NonBuiltGeneric? _$v;

  NonBuilt<int>? _value;
  NonBuilt<int>? get value => _$this._value;
  set value(NonBuilt<int>? value) => _$this._value = value;

  NonBuiltGenericBuilder();

  NonBuiltGenericBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NonBuiltGeneric other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NonBuiltGeneric;
  }

  @override
  void update(void Function(NonBuiltGenericBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NonBuiltGeneric build() => _build();

  _$NonBuiltGeneric _build() {
    final _$result = _$v ??
        new _$NonBuiltGeneric._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'NonBuiltGeneric', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$EmptyGeneric<K, V> extends EmptyGeneric<K, V> {
  factory _$EmptyGeneric([void Function(EmptyGenericBuilder<K, V>)? updates]) =>
      (new EmptyGenericBuilder<K, V>()..update(updates))._build();

  _$EmptyGeneric._() : super._() {
    if (K == dynamic) {
      throw new BuiltValueMissingGenericsError(r'EmptyGeneric', 'K');
    }
    if (V == dynamic) {
      throw new BuiltValueMissingGenericsError(r'EmptyGeneric', 'V');
    }
  }

  @override
  EmptyGeneric<K, V> rebuild(
          void Function(EmptyGenericBuilder<K, V>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmptyGenericBuilder<K, V> toBuilder() =>
      new EmptyGenericBuilder<K, V>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmptyGeneric;
  }

  @override
  int get hashCode {
    return 592793250;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'EmptyGeneric').toString();
  }
}

class EmptyGenericBuilder<K, V>
    implements Builder<EmptyGeneric<K, V>, EmptyGenericBuilder<K, V>> {
  _$EmptyGeneric<K, V>? _$v;

  EmptyGenericBuilder();

  @override
  void replace(EmptyGeneric<K, V> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmptyGeneric<K, V>;
  }

  @override
  void update(void Function(EmptyGenericBuilder<K, V>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmptyGeneric<K, V> build() => _build();

  _$EmptyGeneric<K, V> _build() {
    final _$result = _$v ?? new _$EmptyGeneric<K, V>._();
    replace(_$result);
    return _$result;
  }
}

class _$ConstAndGeneric<T> extends ConstAndGeneric<T> {
  @override
  final BuiltMap<String, T> map;

  factory _$ConstAndGeneric(
          [void Function(ConstAndGenericBuilder<T>)? updates]) =>
      (new ConstAndGenericBuilder<T>()..update(updates))._build();

  _$ConstAndGeneric._({required this.map}) : super._() {
    BuiltValueNullFieldError.checkNotNull(map, r'ConstAndGeneric', 'map');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'ConstAndGeneric', 'T');
    }
  }

  @override
  ConstAndGeneric<T> rebuild(
          void Function(ConstAndGenericBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstAndGenericBuilder<T> toBuilder() =>
      new ConstAndGenericBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstAndGeneric && map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConstAndGeneric')..add('map', map))
        .toString();
  }
}

class ConstAndGenericBuilder<T>
    implements Builder<ConstAndGeneric<T>, ConstAndGenericBuilder<T>> {
  _$ConstAndGeneric<T>? _$v;

  MapBuilder<String, T>? _map;
  MapBuilder<String, T> get map => _$this._map ??= new MapBuilder<String, T>();
  set map(MapBuilder<String, T>? map) => _$this._map = map;

  ConstAndGenericBuilder();

  ConstAndGenericBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _map = $v.map.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstAndGeneric<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstAndGeneric<T>;
  }

  @override
  void update(void Function(ConstAndGenericBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConstAndGeneric<T> build() => _build();

  _$ConstAndGeneric<T> _build() {
    _$ConstAndGeneric<T> _$result;
    try {
      _$result = _$v ?? new _$ConstAndGeneric<T>._(map: map.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConstAndGeneric', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
