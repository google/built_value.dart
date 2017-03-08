// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library serializers
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ValueWithInt.serializer)
      ..add(EnumWithInt.serializer)
      ..add(Collections.serializer)
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
      ..add(SimpleValue.serializer)
      ..add(VerySimpleValue.serializer)
      ..add(CompoundValue.serializer)
      ..add(ValidatedValue.serializer)
      ..add(PartiallyStructuredValue.serializer)
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)]),
          () => new MapBuilder<String, JsonObject>())
      ..add(GenericValue.serializer)
      ..add(BoundGenericValue.serializer)
      ..add(CollectionGenericValue.serializer)
      ..add(GenericContainer.serializer)
      ..addBuilderFactory(
          const FullType(GenericValue, const [const FullType(String)]),
          () => new GenericValueBuilder<String>())
      ..addBuilderFactory(
          const FullType(BoundGenericValue, const [const FullType(double)]),
          () => new BoundGenericValueBuilder<double>())
      ..addBuilderFactory(
          const FullType(
              CollectionGenericValue, const [const FullType(String)]),
          () => new CollectionGenericValueBuilder<String>())
      ..add(TestEnum.serializer))
    .build();
