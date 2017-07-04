import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert' show JSON;

/// Switches to "standard" JSON format.
///
/// The default serialization format is more powerful, supporting polymorphism
/// and more collection types. But, you may need to interact with other systems
/// that use simple map-based JSON. If so, use [SerializersBuilder.addPlugin]
/// to install this plugin.
class StandardJsonPlugin implements SerializerPlugin {
  static final BuiltSet<Type> _unsupportedTypes =
      new BuiltSet<Type>([BuiltSet, BuiltListMultimap, BuiltSetMultimap]);

  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    if (specifiedType.isUnspecified)
      throw new ArgumentError('Standard JSON requires specifiedType.');
    if (_unsupportedTypes.contains(specifiedType.root)) {
      throw new ArgumentError(
          'Standard JSON cannot serialize type ${specifiedType.root}.');
    }
    return object;
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    return object is List &&
            specifiedType.root != BuiltList &&
            specifiedType.root != JsonObject
        ? _toMap(object, _alreadyHasStringKeys(specifiedType))
        : object;
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    return object is Map && specifiedType.root != JsonObject
        ? _toList(object, _alreadyHasStringKeys(specifiedType))
        : object;
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

  Object _fromStringKey(String key) {
    return JSON.decode(key);
  }
}
