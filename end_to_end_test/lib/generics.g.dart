// GENERATED CODE - DO NOT MODIFY BY HAND

part of generics;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library generics
// **************************************************************************

Serializer<GenericValue> _$genericValueSerializer =
    new _$GenericValueSerializer();
Serializer<BoundGenericValue> _$boundGenericValueSerializer =
    new _$BoundGenericValueSerializer();
Serializer<CollectionGenericValue> _$collectionGenericValueSerializer =
    new _$CollectionGenericValueSerializer();
Serializer<GenericContainer> _$genericContainerSerializer =
    new _$GenericContainerSerializer();
Serializer<NestedGenericContainer> _$nestedGenericContainerSerializer =
    new _$NestedGenericContainerSerializer();

class _$GenericValueSerializer implements StructuredSerializer<GenericValue> {
  @override
  final Iterable<Type> types = const [GenericValue, _$GenericValue];
  @override
  final String wireName = 'GenericValue';

  @override
  Iterable serialize(Serializers serializers, GenericValue object,
      {FullType specifiedType: FullType.unspecified}) {
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
  GenericValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new GenericValueBuilder<Object>()
        : serializers.newBuilder(specifiedType) as GenericValueBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
    implements StructuredSerializer<BoundGenericValue> {
  @override
  final Iterable<Type> types = const [BoundGenericValue, _$BoundGenericValue];
  @override
  final String wireName = 'BoundGenericValue';

  @override
  Iterable serialize(Serializers serializers, BoundGenericValue object,
      {FullType specifiedType: FullType.unspecified}) {
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
  BoundGenericValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new BoundGenericValueBuilder<num>()
        : serializers.newBuilder(specifiedType) as BoundGenericValueBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
    implements StructuredSerializer<CollectionGenericValue> {
  @override
  final Iterable<Type> types = const [
    CollectionGenericValue,
    _$CollectionGenericValue
  ];
  @override
  final String wireName = 'CollectionGenericValue';

  @override
  Iterable serialize(Serializers serializers, CollectionGenericValue object,
      {FullType specifiedType: FullType.unspecified}) {
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
  CollectionGenericValue deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new CollectionGenericValueBuilder<Object>()
        : serializers.newBuilder(specifiedType)
        as CollectionGenericValueBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
  Iterable serialize(Serializers serializers, GenericContainer object,
      {FullType specifiedType: FullType.unspecified}) {
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
  GenericContainer deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new GenericContainerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
  Iterable serialize(Serializers serializers, NestedGenericContainer object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
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
      Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new NestedGenericContainerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(GenericValue, const [
                const FullType(BuiltMap,
                    const [const FullType(int), const FullType(String)])
              ])) as GenericValue<BuiltMap<int, String>>);
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class GenericValue
// **************************************************************************

class _$GenericValue<T> extends GenericValue<T> {
  @override
  final T value;

  factory _$GenericValue([void updates(GenericValueBuilder<T> b)]) =>
      (new GenericValueBuilder<T>()..update(updates)).build();

  _$GenericValue._({this.value}) : super._() {
    if (value == null) throw new ArgumentError.notNull('value');
  }

  @override
  GenericValue<T> rebuild(void updates(GenericValueBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericValueBuilder<T> toBuilder() =>
      new GenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericValue) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return 'GenericValue {'
        'value=${value.toString()},\n'
        '}';
  }
}

class GenericValueBuilder<T>
    implements Builder<GenericValue<T>, GenericValueBuilder<T>> {
  _$GenericValue<T> _$v;

  T _value;
  T get value => _$this._value;
  set value(T value) => _$this._value = value;

  GenericValueBuilder() {
    if (T == dynamic)
      throw new ArgumentError.value(
          'dynamic', 'T', 'All type arguments must be specified.');
  }

  GenericValueBuilder<T> get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericValue<T> other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$GenericValue<T>;
  }

  @override
  void update(void updates(GenericValueBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GenericValue<T> build() {
    final result = _$v ?? new _$GenericValue<T>._(value: value);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class BoundGenericValue
// **************************************************************************

class _$BoundGenericValue<T extends num> extends BoundGenericValue<T> {
  @override
  final T value;

  factory _$BoundGenericValue([void updates(BoundGenericValueBuilder<T> b)]) =>
      (new BoundGenericValueBuilder<T>()..update(updates)).build();

  _$BoundGenericValue._({this.value}) : super._() {
    if (value == null) throw new ArgumentError.notNull('value');
  }

  @override
  BoundGenericValue<T> rebuild(void updates(BoundGenericValueBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BoundGenericValueBuilder<T> toBuilder() =>
      new BoundGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BoundGenericValue) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return 'BoundGenericValue {'
        'value=${value.toString()},\n'
        '}';
  }
}

class BoundGenericValueBuilder<T extends num>
    implements Builder<BoundGenericValue<T>, BoundGenericValueBuilder<T>> {
  _$BoundGenericValue<T> _$v;

  T _value;
  T get value => _$this._value;
  set value(T value) => _$this._value = value;

  BoundGenericValueBuilder() {
    if (T == dynamic)
      throw new ArgumentError.value(
          'dynamic', 'T', 'All type arguments must be specified.');
  }

  BoundGenericValueBuilder<T> get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoundGenericValue<T> other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$BoundGenericValue<T>;
  }

  @override
  void update(void updates(BoundGenericValueBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BoundGenericValue<T> build() {
    final result = _$v ?? new _$BoundGenericValue<T>._(value: value);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CollectionGenericValue
// **************************************************************************

class _$CollectionGenericValue<T> extends CollectionGenericValue<T> {
  @override
  final BuiltList<T> values;

  factory _$CollectionGenericValue(
          [void updates(CollectionGenericValueBuilder<T> b)]) =>
      (new CollectionGenericValueBuilder<T>()..update(updates)).build();

  _$CollectionGenericValue._({this.values}) : super._() {
    if (values == null) throw new ArgumentError.notNull('values');
  }

  @override
  CollectionGenericValue<T> rebuild(
          void updates(CollectionGenericValueBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionGenericValueBuilder<T> toBuilder() =>
      new CollectionGenericValueBuilder<T>()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CollectionGenericValue) return false;
    return values == other.values;
  }

  @override
  int get hashCode {
    return $jf($jc(0, values.hashCode));
  }

  @override
  String toString() {
    return 'CollectionGenericValue {'
        'values=${values.toString()},\n'
        '}';
  }
}

class CollectionGenericValueBuilder<T>
    implements
        Builder<CollectionGenericValue<T>, CollectionGenericValueBuilder<T>> {
  _$CollectionGenericValue<T> _$v;

  ListBuilder<T> _values;
  ListBuilder<T> get values => _$this._values ??= new ListBuilder<T>();
  set values(ListBuilder<T> values) => _$this._values = values;

  CollectionGenericValueBuilder() {
    if (T == dynamic)
      throw new ArgumentError.value(
          'dynamic', 'T', 'All type arguments must be specified.');
  }

  CollectionGenericValueBuilder<T> get _$this {
    if (_$v != null) {
      _values = _$v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionGenericValue<T> other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$CollectionGenericValue<T>;
  }

  @override
  void update(void updates(CollectionGenericValueBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CollectionGenericValue<T> build() {
    final result =
        _$v ?? new _$CollectionGenericValue<T>._(values: values?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class GenericContainer
// **************************************************************************

class _$GenericContainer extends GenericContainer {
  @override
  final GenericValue<String> genericValue;
  @override
  final BoundGenericValue<double> boundGenericValue;
  @override
  final CollectionGenericValue<String> collectionGenericValue;

  factory _$GenericContainer([void updates(GenericContainerBuilder b)]) =>
      (new GenericContainerBuilder()..update(updates)).build();

  _$GenericContainer._(
      {this.genericValue, this.boundGenericValue, this.collectionGenericValue})
      : super._() {
    if (genericValue == null) throw new ArgumentError.notNull('genericValue');
    if (boundGenericValue == null)
      throw new ArgumentError.notNull('boundGenericValue');
    if (collectionGenericValue == null)
      throw new ArgumentError.notNull('collectionGenericValue');
  }

  @override
  GenericContainer rebuild(void updates(GenericContainerBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericContainerBuilder toBuilder() =>
      new GenericContainerBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GenericContainer) return false;
    return genericValue == other.genericValue &&
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
    return 'GenericContainer {'
        'genericValue=${genericValue.toString()},\n'
        'boundGenericValue=${boundGenericValue.toString()},\n'
        'collectionGenericValue=${collectionGenericValue.toString()},\n'
        '}';
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
    if (_$v != null) {
      _genericValue = _$v.genericValue?.toBuilder();
      _boundGenericValue = _$v.boundGenericValue?.toBuilder();
      _collectionGenericValue = _$v.collectionGenericValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericContainer other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$GenericContainer;
  }

  @override
  void update(void updates(GenericContainerBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GenericContainer build() {
    final result = _$v ??
        new _$GenericContainer._(
            genericValue: genericValue?.build(),
            boundGenericValue: boundGenericValue?.build(),
            collectionGenericValue: collectionGenericValue?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class NestedGenericContainer
// **************************************************************************

class _$NestedGenericContainer extends NestedGenericContainer {
  @override
  final GenericValue<BuiltMap<int, String>> map;

  factory _$NestedGenericContainer(
          [void updates(NestedGenericContainerBuilder b)]) =>
      (new NestedGenericContainerBuilder()..update(updates)).build();

  _$NestedGenericContainer._({this.map}) : super._() {
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  NestedGenericContainer rebuild(
          void updates(NestedGenericContainerBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NestedGenericContainerBuilder toBuilder() =>
      new NestedGenericContainerBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! NestedGenericContainer) return false;
    return map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc(0, map.hashCode));
  }

  @override
  String toString() {
    return 'NestedGenericContainer {'
        'map=${map.toString()},\n'
        '}';
  }
}

class NestedGenericContainerBuilder
    implements Builder<NestedGenericContainer, NestedGenericContainerBuilder> {
  _$NestedGenericContainer _$v;

  GenericValueBuilder<BuiltMap<int, String>> _map;
  GenericValueBuilder<BuiltMap<int, String>> get map =>
      _$this._map ??= new GenericValueBuilder<BuiltMap<int, String>>();
  set map(GenericValueBuilder<BuiltMap<int, String>> map) => _$this._map = map;

  NestedGenericContainerBuilder();

  NestedGenericContainerBuilder get _$this {
    if (_$v != null) {
      _map = _$v.map?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NestedGenericContainer other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$NestedGenericContainer;
  }

  @override
  void update(void updates(NestedGenericContainerBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NestedGenericContainer build() {
    final result = _$v ?? new _$NestedGenericContainer._(map: map?.build());
    replace(result);
    return result;
  }
}
