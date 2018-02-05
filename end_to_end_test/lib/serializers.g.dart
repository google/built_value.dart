// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BoundGenericValue.serializer)
      ..add(Cage.serializer)
      ..add(Cat.serializer)
      ..add(CollectionGenericValue.serializer)
      ..add(Collections.serializer)
      ..add(CompoundValue.serializer)
      ..add(CompoundValueExplicitNoNesting.serializer)
      ..add(CompoundValueNoNesting.serializer)
      ..add(DiscoverableValue.serializer)
      ..add(EnumWithInt.serializer)
      ..add(FieldDiscoveryValue.serializer)
      ..add(Fish.serializer)
      ..add(GenericContainer.serializer)
      ..add(GenericValue.serializer)
      ..add(HasDouble.serializer)
      ..add(HasString.serializer)
      ..add(ImportedValue.serializer)
      ..add(NamedFactoryValue.serializer)
      ..add(NestedGenericContainer.serializer)
      ..add(PartiallySerializableValue.serializer)
      ..add(PrimitivesValue.serializer)
      ..add(Robot.serializer)
      ..add(SecondDiscoverableValue.serializer)
      ..add(SimpleValue.serializer)
      ..add(StandardCat.serializer)
      ..add(StandardJsonValue.serializer)
      ..add(TestEnum.serializer)
      ..add(ThirdDiscoverableValue.serializer)
      ..add(UsesHandCoded.serializer)
      ..add(ValidatedValue.serializer)
      ..add(ValueUsingImportAs.serializer)
      ..add(ValueWithHasInt.serializer)
      ..add(ValueWithInt.serializer)
      ..add(WireNameEnum.serializer)
      ..add(WireNameValue.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Animal)]),
          () => new ListBuilder<Animal>())
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
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)]),
          () => new MapBuilder<String, JsonObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Animal)]),
          () => new ListBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
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
