// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add($ValueSpecial.serializer)
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
      ..add(SerializableRecordValue.serializer)
      ..add(SerializesNullsValue.serializer)
      ..add(SimpleValue.serializer)
      ..add(StandardCat.serializer)
      ..add(StandardJsonValue.serializer)
      ..add(TestEnum.serializer)
      ..add(ThirdDiscoverableValue.serializer)
      ..add(UsesHandCoded.serializer)
      ..add(ValidatedValue.serializer)
      ..add(ValueUsingImportAs.serializer)
      ..add(ValueWithAwkwardNestedBuilder.serializer)
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
          () => ListBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleValue)]),
          () => ListBuilder<SimpleValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleValue)]),
          () => ListBuilder<SimpleValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleValue)]),
          () => ListBuilder<SimpleValue>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ThirdDiscoverableValue)]),
          () => ListBuilder<ThirdDiscoverableValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(int), const FullType(String)]),
          () => MapBuilder<int, String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)]),
          () => MapBuilder<String, int>())
      ..addBuilderFactory(
          const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)]),
          () => ListMultimapBuilder<int, bool>())
      ..addBuilderFactory(
          const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)]),
          () => SetMultimapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(int)]),
          () => ListBuilder<int?>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType.nullable(String)]),
          () => SetBuilder<String?>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType.nullable(String),
            const FullType.nullable(int)
          ]),
          () => MapBuilder<String?, int?>())
      ..addBuilderFactory(
          const FullType(BuiltListMultimap,
              const [const FullType.nullable(int), const FullType(bool)]),
          () => ListMultimapBuilder<int?, bool>())
      ..addBuilderFactory(
          const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType.nullable(bool)]),
          () => SetMultimapBuilder<String, bool?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)]),
          () => MapBuilder<String, int>())
      ..addBuilderFactory(
          const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)]),
          () => ListMultimapBuilder<int, bool>())
      ..addBuilderFactory(
          const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)]),
          () => SetMultimapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(Foo, const [const FullType.nullable(int)])
          ]),
          () => ListBuilder<Foo<int?>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                BuiltList, const [const FullType.nullable(int)])
          ]),
          () => ListBuilder<BuiltList<int?>?>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)]),
          () => MapBuilder<String, JsonObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Animal)]),
          () => ListBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Animal)]),
          () => SetBuilder<Animal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(int)]),
          () => ListBuilder<int?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(String)]),
          () => ListBuilder<String?>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType.nullable(int)]),
          () => MapBuilder<String, int?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Object)]),
          () => ListBuilder<Object>())
      ..addBuilderFactory(
          const FullType(GenericValue, const [
            const FullType(
                BuiltMap, const [const FullType(int), const FullType(String)])
          ]),
          () => GenericValueBuilder<BuiltMap<int, String>>())
      ..addBuilderFactory(
          const FullType(GenericValue, const [const FullType(String)]),
          () => GenericValueBuilder<String>())
      ..addBuilderFactory(
          const FullType(BoundGenericValue, const [const FullType(double)]),
          () => BoundGenericValueBuilder<double>())
      ..addBuilderFactory(
          const FullType(
              CollectionGenericValue, const [const FullType(String)]),
          () => CollectionGenericValueBuilder<String>()))
    .build();
Serializers _$moreSerializers =
    (Serializers().toBuilder()..add(Cat.serializer)).build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
