import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:example/generics.dart';
import 'package:example/serializers.dart';
import 'package:example/values.dart';

/// Simple usage examples for built_value.
void example() {
  // Values must be created with all required fields.
  final value = new SimpleValue((b) => b..anInt = 3);

  // Nullable fields will default to null if not set.
  final value2 = new SimpleValue((b) => b
    ..anInt = 3
    ..aString = 'three');

  // All values implement operator==, hashCode and toString.
  assert(value != value2);

  // Values based on existing values are created via "rebuild".
  final value3 = value.rebuild((b) => b..aString = 'three');
  assert(value2 == value3);

  // Or, you can convert to a builder and hold the builder for a while.
  final builder = value3.toBuilder();
  builder.anInt = 4;
  final value4 = builder.build();
  assert(value3 != value4);

  // Nested built_value fields are built with nested builders.
  final value5 = new CompoundValue((b) => b
    ..simpleValue.anInt = 1
    ..validatedValue.anInt = 2);

  // Values can use generics.
  final value6 = new GenericValue<String>((b) => b..value = 'string');

  // Values with a simplified factory still have a builder.
  final value7 = new VerySimpleValue(3);
  final value8 = value7.rebuild((b) => b..value = 4);

  // Everything is serializable.
  for (final object in [
    value,
    value2,
    value3,
    value4,
    value5,
    value6,
    value7,
    value8,
  ]) {
    final serialized = serializers.serialize(object);
    print(serialized);
    assert(serializers.deserialize(serialized) == object);
  }

  // See chat_example and end_to_end_test for more complex usage!
}

/// Example of using StandardJsonPlugin.
///
/// The plugin changes the built_value serialization format to the Map-based
/// format used by most JSON APIs. You must specify which type you are
/// serializing/deserializing when using this plugin.
void standardJsonExample() {
  final standardSerializers =
      (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

  final serialized = {
    'anInt': 3,
    'aString': 'string',
    'keyValues': {
      'int': 1,
      'bool': true,
      'String': 'string',
      'list': [1, 2, 3],
      'map': {'one': 1, 'two': 2}
    }
  };

  // Use the deserializeWith method to specify what type you're deserializing.
  final value = standardSerializers.deserializeWith(
      PartiallyStructuredValue.serializer, serialized);
  print(value);

  assert(value.anInt == 3);
  assert(value.aString == 'string');
  assert(value.keyValues['list'].asList[2] == 3);
  assert(value.keyValues['map'].asMap['one'] == 1);

  // Use the serializeWith method to specify what type you're serializing.
  final serializedAgain = standardSerializers.serializeWith(
      PartiallyStructuredValue.serializer, value);
  assert(serialized.toString() == serializedAgain.toString());
}
