// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of serializers_nnbd;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BoundGenericValue.serializer)
      ..add(Cage.serializer)
      ..add(Cat.serializer)
      ..add(CollectionGenericValue.serializer)
      ..add(Collections.serializer)
      ..add(ComplexValue.serializer)
      ..add(CompoundValue.serializer)
      ..add(CompoundValueAutoNestingField.serializer)
      ..add(CompoundValueExplicitNoNesting.serializer)
      ..add(CompoundValueNestingField.serializer)
      ..add(CompoundValueNoAutoNesting.serializer)
      ..add(CompoundValueNoAutoNestingField.serializer)
      ..add(CompoundValueNoNesting.serializer)
      ..add(CompoundValueNoNestingField.serializer)
      ..add(ConcreteGeneric.serializer)
      ..add(DiscoverableValue.serializer)
      ..add(EnumWithInt.serializer)
      ..add(FallbackEnum.serializer)
      ..add(FallbackNumberEnum.serializer)
      ..add(FieldDiscoveryValue.serializer)
      ..add(Fish.serializer)
      ..add(GenericContainer.serializer)
      ..add(GenericValue.serializer)
      ..add(HasDouble.serializer)
      ..add(HasString.serializer)
      ..add(ImportedCustomNestedValue.serializer)
      ..add(ImportedCustomValue.serializer)
      ..add(ImportedValue.serializer)
      ..add(NamedFactoryValue.serializer)
      ..add(NestedGenericContainer.serializer)
      ..add(NoFieldsValue.serializer)
      ..add(NonBuiltGeneric.serializer)
      ..add(OtherValue.serializer)
      ..add(PartiallySerializableValue.serializer)
      ..add(PassthroughGenericContainer.serializer)
      ..add(PrimitivesValue.serializer)
      ..add(Robot.serializer)
      ..add(SecondDiscoverableValue.serializer)
      ..add(SerializesNullsValue.serializer)
      ..add(SimpleValue.serializer)
      ..add(StandardCat.serializer)
      ..add(StandardJsonValue.serializer)
      ..add(TestEnum.serializer)
      ..add(ThirdDiscoverableValue.serializer)
      ..add(UsesHandCoded.serializer)
      ..add(ValidatedValue.serializer)
      ..add(ValueUsingImportAs.serializer)
      ..add(ValueWithBuilderFinalizer.serializer)
      ..add(ValueWithBuilderInitializer.serializer)
      ..add(ValueWithCustomSerializer.serializer)
      ..add(ValueWithHasInt.serializer)
      ..add(ValueWithInt.serializer)
      ..add(WireNameEnum.serializer)
      ..add(WireNameValue.serializer)
      ..add(WireNumberEnum.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Animal)]),
          () => new ListBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleValue)]),
          () => new ListBuilder<SimpleValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleValue)]),
          () => new ListBuilder<SimpleValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleValue)]),
          () => new ListBuilder<SimpleValue>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ThirdDiscoverableValue)]),
          () => new ListBuilder<ThirdDiscoverableValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)]),
          () => new MapBuilder<String, int>())
      ..addBuilderFactory(
          const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)]),
          () => new ListMultimapBuilder<int, bool>())
      ..addBuilderFactory(
          const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)]),
          () => new SetMultimapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(int)]),
          () => new ListBuilder<int?>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType.nullable(String)]),
          () => new SetBuilder<String?>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType.nullable(String),
            const FullType.nullable(int)
          ]),
          () => new MapBuilder<String?, int?>())
      ..addBuilderFactory(
          const FullType(BuiltListMultimap,
              const [const FullType.nullable(int), const FullType(bool)]),
          () => new ListMultimapBuilder<int?, bool>())
      ..addBuilderFactory(
          const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType.nullable(bool)]),
          () => new SetMultimapBuilder<String, bool?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)]),
          () => new MapBuilder<String, int>())
      ..addBuilderFactory(
          const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)]),
          () => new ListMultimapBuilder<int, bool>())
      ..addBuilderFactory(
          const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)]),
          () => new SetMultimapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(Foo, const [const FullType.nullable(int)])
          ]),
          () => new ListBuilder<Foo<int?>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                BuiltList, const [const FullType.nullable(int)])
          ]),
          () => new ListBuilder<BuiltList<int?>?>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)]),
          () => new MapBuilder<String, JsonObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Animal)]),
          () => new ListBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Animal)]),
          () => new SetBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(int)]),
          () => new ListBuilder<int?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(String)]),
          () => new ListBuilder<String?>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType.nullable(int)]),
          () => new MapBuilder<String, int?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Object)]),
          () => new ListBuilder<Object>())
      ..addBuilderFactory(
          const FullType(GenericValue, const [
            const FullType(
                BuiltMap, const [const FullType(int), const FullType(String)])
          ]),
          () => new GenericValueBuilder<BuiltMap<int, String>>())
      ..addBuilderFactory(
          const FullType(GenericValue, const [const FullType(String)]),
          () => new GenericValueBuilder<String>())
      ..addBuilderFactory(
          const FullType(BoundGenericValue, const [const FullType(double)]),
          () => new BoundGenericValueBuilder<double>())
      ..addBuilderFactory(
          const FullType(
              CollectionGenericValue, const [const FullType(String)]),
          () => new CollectionGenericValueBuilder<String>()))
    .build();
Serializers _$moreSerializers =
    (new Serializers().toBuilder()..add(Cat.serializer)).build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
