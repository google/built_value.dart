// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: annotate_overrides
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Account.serializer)
      ..add(Cat.serializer)
      ..add(CompoundValue.serializer)
      ..add(Fish.serializer)
      ..add(GenericValue.serializer)
      ..add(SimpleValue.serializer)
      ..add(ValidatedValue.serializer)
      ..add(VerySimpleValue.serializer)
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)]),
          () => new MapBuilder<String, JsonObject>()))
    .build();
