import 'package:built_value/standard_json_plugin.dart';
import 'package:example/generics.dart';
import 'package:example/polymorphism.dart';
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

  // Values can use polymorphism.
  final animals = <Animal>[
    new Cat((b) => b
      ..legs = 3
      ..tail = true),
    new Fish((b) => b
      ..legs = 0
      ..fins = 4),
  ];
  final modifiedAnimals =
      animals.map((animal) => animal.rebuild((b) => b.legs++)).toList();

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
    modifiedAnimals[0],
    modifiedAnimals[1],
  ]) {
    final serialized = serializers.serialize(object);
    print(serialized);
    assert(serializers.deserialize(serialized) == object);
  }

  // See chat_example and end_to_end_test for more complex usage!
}

/// Examples of using StandardJsonPlugin.
///
/// The plugin changes the built_value serialization format to the Map-based
/// format used by most JSON APIs.
///
/// Where needed the plugin specifies which type to serialize/deserialize using
/// a `discriminator` field. By default this field is called `$`; you can pass
/// a different name to the `StandardJsonPlugin` constructor. If the wire
/// format should not contain the type name, you must instead explicitly
/// specify which type to serialize/deserialize. Both cases are shown below.
void standardJsonExample() {
  final standardSerializers =
      (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

  // In this first example we know the type we want to serialize/deserialize,
  // so the type is not mentioned on the wire.
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

  // In this second example we don't know the type we want to
  // serialize/deserialize, so it has to be specified on the wire.
  final serializedAccountWithDiscriminator = {
    r'$': 'Account',
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

  // We don't have to specify the type when deserializing.
  final value2 =
      standardSerializers.deserialize(serializedAccountWithDiscriminator);
  print(value2);
  assert(value == value2);

  // We don't have to specify the type when serializing.
  final serializedAgain2 = serializers.serialize(value2);
  assert(serializedAccountWithDiscriminator.toString ==
      serializedAgain2.toString());
}
