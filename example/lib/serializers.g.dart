// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
