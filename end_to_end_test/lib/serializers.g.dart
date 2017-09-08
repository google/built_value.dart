// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: annotate_overrides
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BoundGenericValue.serializer)
      ..add(Cat.serializer)
      ..add(CollectionGenericValue.serializer)
      ..add(Collections.serializer)
      ..add(CompoundValue.serializer)
      ..add(CompoundValueNoNesting.serializer)
      ..add(DiscoverableValue.serializer)
      ..add(EnumWithInt.serializer)
      ..add(FieldDiscoveryValue.serializer)
      ..add(GenericContainer.serializer)
      ..add(GenericValue.serializer)
      ..add(HasDouble.serializer)
      ..add(HasString.serializer)
      ..add(NamedFactoryValue.serializer)
      ..add(NestedGenericContainer.serializer)
      ..add(PrimitivesValue.serializer)
      ..add(Robot.serializer)
      ..add(SecondDiscoverableValue.serializer)
      ..add(SimpleValue.serializer)
      ..add(StandardJsonValue.serializer)
      ..add(TestEnum.serializer)
      ..add(ThirdDiscoverableValue.serializer)
      ..add(ValidatedValue.serializer)
      ..add(ValueUsingImportAs.serializer)
      ..add(ValueWithHasInt.serializer)
      ..add(ValueWithInt.serializer)
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
