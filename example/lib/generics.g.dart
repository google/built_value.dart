// GENERATED CODE - DO NOT MODIFY BY HAND

part of generics;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GenericValue<Object>> _$genericValueSerializer =
    new _$GenericValueSerializer();
Serializer<BoundGenericValue<num>> _$boundGenericValueSerializer =
    new _$BoundGenericValueSerializer();
Serializer<CollectionGenericValue<Object>> _$collectionGenericValueSerializer =
    new _$CollectionGenericValueSerializer();
Serializer<GenericContainer> _$genericContainerSerializer =
    new _$GenericContainerSerializer();

class _$GenericValueSerializer
    implements StructuredSerializer<GenericValue<Object>> {
  @override
  final Iterable<Type> types = const [GenericValue, _$GenericValue];
  @override
  final String wireName = 'GenericValue';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GenericValue<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: parameterT),
    ];

    return result;
  }

  @override
  GenericValue<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new GenericValueBuilder<Object>()
        : serializers.newBuilder(specifiedType) as GenericValueBuilder<Object>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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
  Iterable<Object> serialize(
      Serializers serializers, BoundGenericValue<num> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: parameterT),
    ];

    return result;
  }

  @override
  BoundGenericValue<num> deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'value':
          result.value =
              serializers.deserialize(value, specifiedType: parameterT) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$CollectionGenericValueSerializer
    implements StructuredSerializer<CollectionGenericValue<Object>> {
  @override
  final Iterable<Type> types = const [
    CollectionGenericValue,
    _$CollectionGenericValue
  ];
  @override
  final String wireName = 'CollectionGenericValue';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CollectionGenericValue<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'values',
      serializers.serialize(object.values,
          specifiedType: new FullType(BuiltList, [parameterT])),
    ];

    return result;
  }

  @override
  CollectionGenericValue<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new CollectionGenericValueBuilder<Object>()
        : serializers.newBuilder(specifiedType)
            as CollectionGenericValueBuilder<Object>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType: new FullType(BuiltList, [parameterT]))
              as BuiltList<Object>);
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
  Iterable<Object> serialize(Serializers serializers, GenericContainer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GenericContainerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'genericValue':
          result.genericValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GenericValue, const [const FullType(String)]))
              as GenericValue<String>);
          break;
        case 'boundGenericValue':
          result.boundGenericValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BoundGenericValue, const [const FullType(double)]))
              as BoundGenericValue<double>);
          break;
        case 'collectionGenericValue':
          result.collectionGenericValue.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      CollectionGenericValue, const [const FullType(String)]))
              as CollectionGenericValue<String>);
          break;
      }
    }

    return result.build();
  }
}

class _$GenericValue<T> extends GenericValue<T> {
  @override
  final T value;

  factory _$GenericValue([void Function(GenericValueBuilder<T>) updates]) =>
      (new GenericValueBuilder<T>()..update(updates))._build();

  _$GenericValue._({this.value}) : super._() {
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
  _$GenericValue<T> _$v;

  T _value;
  T get value => _$this._value;
  set value(T value) => _$this._value = value;

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
  void update(void Function(GenericValueBuilder<T>) updates) {
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

class _$BoundGenericValue<T extends num> extends BoundGenericValue<T> {
  @override
  final T value;

  factory _$BoundGenericValue(
          [void Function(BoundGenericValueBuilder<T>) updates]) =>
      (new BoundGenericValueBuilder<T>()..update(updates))._build();

  _$BoundGenericValue._({this.value}) : super._() {
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
    return other is BoundGenericValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BoundGenericValue')
          ..add('value', value))
        .toString();
  }
}

class BoundGenericValueBuilder<T extends num>
    implements Builder<BoundGenericValue<T>, BoundGenericValueBuilder<T>> {
  _$BoundGenericValue<T> _$v;

  T _value;
  T get value => _$this._value;
  set value(T value) => _$this._value = value;

  BoundGenericValueBuilder();

  BoundGenericValueBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
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
  void update(void Function(BoundGenericValueBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  BoundGenericValue<T> build() => _build();

  _$BoundGenericValue<T> _build() {
    final _$result = _$v ??
        new _$BoundGenericValue<T>._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'BoundGenericValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$CollectionGenericValue<T> extends CollectionGenericValue<T> {
  @override
  final BuiltList<T> values;

  factory _$CollectionGenericValue(
          [void Function(CollectionGenericValueBuilder<T>) updates]) =>
      (new CollectionGenericValueBuilder<T>()..update(updates))._build();

  _$CollectionGenericValue._({this.values}) : super._() {
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
  _$CollectionGenericValue<T> _$v;

  ListBuilder<T> _values;
  ListBuilder<T> get values => _$this._values ??= new ListBuilder<T>();
  set values(ListBuilder<T> values) => _$this._values = values;

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
  void update(void Function(CollectionGenericValueBuilder<T>) updates) {
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
      String _$failedField;
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
          [void Function(GenericContainerBuilder) updates]) =>
      (new GenericContainerBuilder()..update(updates))._build();

  _$GenericContainer._(
      {this.genericValue, this.boundGenericValue, this.collectionGenericValue})
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
  _$GenericContainer _$v;

  GenericValueBuilder<String> _genericValue;
  GenericValueBuilder<String> get genericValue =>
      _$this._genericValue ??= new GenericValueBuilder<String>();
  set genericValue(GenericValueBuilder<String> genericValue) =>
      _$this._genericValue = genericValue;

  BoundGenericValueBuilder<double> _boundGenericValue;
  BoundGenericValueBuilder<double> get boundGenericValue =>
      _$this._boundGenericValue ??= new BoundGenericValueBuilder<double>();
  set boundGenericValue(BoundGenericValueBuilder<double> boundGenericValue) =>
      _$this._boundGenericValue = boundGenericValue;

  CollectionGenericValueBuilder<String> _collectionGenericValue;
  CollectionGenericValueBuilder<String> get collectionGenericValue =>
      _$this._collectionGenericValue ??=
          new CollectionGenericValueBuilder<String>();
  set collectionGenericValue(
          CollectionGenericValueBuilder<String> collectionGenericValue) =>
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
  void update(void Function(GenericContainerBuilder) updates) {
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
      String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
