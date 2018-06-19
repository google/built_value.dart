// This is generated code; please do not modify by hand.

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
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
