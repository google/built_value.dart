import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:example/generics.dart';
import 'package:example/serializers.dart';
import 'package:example/values.dart';
import 'package:example/enums.dart';

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

  final value9 = new ValueUsingEnum((b)=> b..answer = SecondTestEnum.noThanks);



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
    value9,
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

  final serializedAccount = {
    'id': 3,
    'name': 'John Smith',
    'keyValues': {
      'visited': 1732,
      'active': true,
      'email': 'john.smith@example.com',
      'tags': [74, 123, 4001],
      'preferences': {
        'showMenu': true,
        'skipIntro': true,
        'colorScheme': 'light',
      }
    }
  };

  // Use the deserializeWith method to specify what type you're deserializing.
  final value = standardSerializers.deserializeWith(
      Account.serializer, serializedAccount);
  print(value);

  assert(value.id == 3);
  assert(value.name == 'John Smith');
  assert(value.keyValues['tags'].asList[2] == 4001);
  assert(value.keyValues['preferences'].asMap['colorScheme'] == 'light');

  // Use the serializeWith method to specify what type you're serializing.
  final serializedAgain =
      standardSerializers.serializeWith(Account.serializer, value);
  assert(serializedAccount.toString() == serializedAgain.toString());
}
