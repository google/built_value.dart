import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert' show JSON;

/// Switches to "standard" JSON format.
///
/// The default serialization format is more powerful, with better performance
/// and support for more collection types. But, you may need to interact with
/// other systems that use simple map-based JSON. If so, use
/// [SerializersBuilder.addPlugin] to install this plugin.
class StandardJsonPlugin implements SerializerPlugin {
  static final BuiltSet<Type> _unsupportedTypes =
      new BuiltSet<Type>([BuiltSet, BuiltListMultimap, BuiltSetMultimap]);

  /// The field used to specify the value type if needed. Defaults to `$`.
  final String discriminator;

  // The key used when there is just a single value, for example if serializing
  // an `int`.
  final String valueKey;

  StandardJsonPlugin({this.discriminator: r'$', this.valueKey: ''});

  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    if (_unsupportedTypes.contains(specifiedType.root)) {
      throw new ArgumentError(
          'Standard JSON cannot serialize type ${specifiedType.root}.');
    }
    return object;
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    if (object is List &&
        specifiedType.root != BuiltList &&
        specifiedType.root != JsonObject) {
      if (specifiedType.isUnspecified) {
        return _toMapSpecifyType(object);
      } else {
        return _toMap(object, _alreadyHasStringKeys(specifiedType));
      }
    } else {
      return object;
    }
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (object is Map && specifiedType.root != JsonObject) {
      if (specifiedType.isUnspecified) {
        return _toListExtractType(object);
      } else {
        return _toList(object, _alreadyHasStringKeys(specifiedType));
      }
    } else {
      return object;
    }
  }

  @override
  Object afterDeserialize(Object object, FullType specifiedType) {
    return object;
  }

  bool _alreadyHasStringKeys(FullType specifiedType) =>
      specifiedType.root != BuiltMap ||
      specifiedType.parameters[0].root == String;

  Map _toMap(List list, bool alreadyStringKeys) {
    final result = {};
    for (int i = 0; i != list.length ~/ 2; ++i) {
      final key = list[i * 2];
      final value = list[i * 2 + 1];
      result[alreadyStringKeys ? key : _toStringKey(key)] = value;
    }
    return result;
  }

  Map _toMapSpecifyType(List list) {
    var type = list[0];

    if (list.length == 2) {
      // Just a type and a primitive value. Encode the value in the map.
      return <Object, Object>{discriminator: type, valueKey: list[1]};
    }

    if (list[0] == 'list') {
      // Embed the list in the map.
      return <Object, Object>{discriminator: type, valueKey: list.sublist(1)};
    }

    // If a map has non-String keys then they need encoding to strings before
    // it can be converted to JSON. Because we don't know the type, we also
    // won't know the type on deserialization, and signal this by changing the
    // type name on the wire to `encoded_map`.
    var needToEncodeKeys = false;
    if (type == 'map') {
      for (int i = 0; i != (list.length - 1) ~/ 2; ++i) {
        if (list[i * 2 + 1] is! String) {
          needToEncodeKeys = true;
          type = 'encoded_map';
          break;
        }
      }
    }

    final result = <Object, Object>{discriminator: type};
    for (int i = 0; i != (list.length - 1) ~/ 2; ++i) {
      final key =
          needToEncodeKeys ? _toStringKey(list[i * 2 + 1]) : list[i * 2 + 1];
      final value = list[i * 2 + 2];
      result[key] = value;
    }
    return result;
  }

  String _toStringKey(Object key) {
    return JSON.encode(key);
  }

  List _toList(Map map, bool alreadyStringKeys) {
    final result = new List(map.length * 2);
    var i = 0;
    map.forEach((key, value) {
      // Drop null values, they are represented by missing keys.
      if (value == null) return;

      result[i] = alreadyStringKeys ? key : _fromStringKey(key as String);
      result[i + 1] = value;
      i += 2;
    });
    return result;
  }

  List _toListExtractType(Map map) {
    var type = map[discriminator];

    if (type == null) {
      throw new ArgumentError('Unknown type on deserialization. '
          'Need either specifiedType or discriminator field.');
    }

    if (type == 'list') {
      return [type]..addAll(map[valueKey] as Iterable);
    }

    if (map.containsKey(valueKey)) {
      // Just a type and a primitive value. Retrieve the value in the map.
      final result = new List(2);
      result[0] = type;
      result[1] = map[valueKey];
      return result;
    }

    // A type name of `encoded_map` indicates that the map has non-String keys
    // that have been serialized and JSON-encoded; decode the keys when
    // converting back to a `List`.
    final needToDecodeKeys = type == 'encoded_map';
    if (needToDecodeKeys) {
      type = 'map';
    }

    final result = new List(map.length * 2 - 1);
    result[0] = type;

    var i = 1;
    map.forEach((key, value) {
      if (key == discriminator) return;

      // Drop null values, they are represented by missing keys.
      if (value == null) return;

      result[i] = needToDecodeKeys ? _fromStringKey(key as String) : key;
      result[i + 1] = value;
      i += 2;
    });
    return result;
  }

  Object _fromStringKey(String key) {
    return JSON.decode(key);
  }
}
