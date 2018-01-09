// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.

// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

/// Default implementation of [Serializers].
class BuiltJsonSerializers implements Serializers {
  final BuiltMap<Type, Serializer> _typeToSerializer;

  // Implementation note: wire name is what gets sent in the JSON, type name is
  // the runtime type name. Type name is complicated for two reasons:
  //
  // 1. Built Value classes have two types, the abstract class and the
  // generated implementation.
  //
  // 2. When compiled to javascript the runtime type names are obfuscated.
  final BuiltMap<String, Serializer> _wireNameToSerializer;
  final BuiltMap<String, Serializer> _typeNameToSerializer;

  final BuiltMap<FullType, Function> _builderFactories;

  final BuiltList<SerializerPlugin> _plugins;

  BuiltJsonSerializers._(this._typeToSerializer, this._wireNameToSerializer,
      this._typeNameToSerializer, this._builderFactories, this._plugins);

  @override
  T deserializeWith<T>(Serializer<T> serializer, Object serialized) {
    return deserialize(serialized,
        specifiedType: new FullType(serializer.types.first)) as T;
  }

  @override
  Object serializeWith<T>(Serializer<T> serializer, T object) {
    return serialize(object,
        specifiedType: new FullType(serializer.types.first));
  }

  @override
  Object serialize(Object object,
      {FullType specifiedType: FullType.unspecified}) {
    var transformedObject = object;
    for (final plugin in _plugins) {
      transformedObject =
          plugin.beforeSerialize(transformedObject, specifiedType);
    }
    var result = _serialize(transformedObject, specifiedType);
    for (final plugin in _plugins) {
      result = plugin.afterSerialize(result, specifiedType);
    }
    return result;
  }

  Object _serialize(Object object, FullType specifiedType) {
    if (specifiedType.isUnspecified) {
      final serializer = _getSerializerByType(object.runtimeType);
      if (serializer == null) {
        throw new StateError("No serializer for '${object.runtimeType}'.");
      }
      if (serializer is StructuredSerializer) {
        final result = <Object>[serializer.wireName];
        return result..addAll(serializer.serialize(this, object));
      } else if (serializer is PrimitiveSerializer) {
        return <Object>[
          serializer.wireName,
          serializer.serialize(this, object)
        ];
      } else {
        throw new StateError(
            'serializer must be StructuredSerializer or PrimitiveSerializer');
      }
    } else {
      final serializer = _getSerializerByType(specifiedType.root);
      if (serializer == null) {
        // Might be an interface; try resolving using the runtime type.
        return serialize(object);
      }
      if (serializer is StructuredSerializer) {
        return serializer
            .serialize(this, object, specifiedType: specifiedType)
            .toList();
      } else if (serializer is PrimitiveSerializer) {
        return serializer.serialize(this, object, specifiedType: specifiedType);
      } else {
        throw new StateError(
            'serializer must be StructuredSerializer or PrimitiveSerializer');
      }
    }
  }

  @override
  Object deserialize(Object object,
      {FullType specifiedType: FullType.unspecified}) {
    var transformedObject = object;
    for (final plugin in _plugins) {
      transformedObject =
          plugin.beforeDeserialize(transformedObject, specifiedType);
    }
    var result = _deserialize(object, transformedObject, specifiedType);
    for (final plugin in _plugins) {
      result = plugin.afterDeserialize(result, specifiedType);
    }
    return result;
  }

  Object _deserialize(
      Object objectBeforePlugins, Object object, FullType specifiedType) {
    if (specifiedType.isUnspecified) {
      final String wireName = (object as List).first as String;

      final serializer = _wireNameToSerializer[wireName];
      if (serializer == null) {
        throw new StateError("No serializer for '$wireName'.");
      }

      if (serializer is StructuredSerializer) {
        return serializer.deserialize(this, (object as List).sublist(1));
      } else if (serializer is PrimitiveSerializer) {
        return serializer.deserialize(this, (object as List)[1]);
      } else {
        throw new StateError(
            'serializer must be StructuredSerializer or PrimitiveSerializer');
      }
    } else {
      final serializer = _getSerializerByType(specifiedType.root);
      if (serializer == null) {
        if (object is List && object.first is String) {
          // Might be an interface; try resolving using the type on the wire.
          return deserialize(objectBeforePlugins);
        } else {
          throw new StateError("No serializer for '${specifiedType.root}'.");
        }
      }

      if (serializer is StructuredSerializer) {
        return serializer.deserialize(this, object as Iterable,
            specifiedType: specifiedType);
      } else if (serializer is PrimitiveSerializer) {
        return serializer.deserialize(this, object,
            specifiedType: specifiedType);
      } else {
        throw new StateError(
            'serializer must be StructuredSerializer or PrimitiveSerializer');
      }
    }
  }

  @override
  Object newBuilder(FullType fullType) {
    final builderFactory = _builderFactories[fullType];
    if (builderFactory == null) {
      throw new StateError('No builder for $fullType.');
    }
    return builderFactory();
  }

  @override
  void expectBuilder(FullType fullType) {
    if (!hasBuilder(fullType)) {
      throw new StateError('No builder for $fullType.');
    }
  }

  @override
  bool hasBuilder(FullType fullType) {
    return _builderFactories.containsKey(fullType);
  }

  @override
  SerializersBuilder toBuilder() {
    return new BuiltJsonSerializersBuilder._(
        _typeToSerializer.toBuilder(),
        _wireNameToSerializer.toBuilder(),
        _typeNameToSerializer.toBuilder(),
        _builderFactories.toBuilder(),
        _plugins.toBuilder());
  }

  Serializer _getSerializerByType(Type type) {
    return _typeToSerializer[type] ?? _typeNameToSerializer[_getRawName(type)];
  }
}

/// Default implementation of [SerializersBuilder].
class BuiltJsonSerializersBuilder implements SerializersBuilder {
  final MapBuilder<Type, Serializer> _typeToSerializer;
  final MapBuilder<String, Serializer> _wireNameToSerializer;
  final MapBuilder<String, Serializer> _typeNameToSerializer;

  final MapBuilder<FullType, Function> _builderFactories;

  final ListBuilder<SerializerPlugin> _plugins;

  factory BuiltJsonSerializersBuilder() => new BuiltJsonSerializersBuilder._(
      new MapBuilder<Type, Serializer>(),
      new MapBuilder<String, Serializer>(),
      new MapBuilder<String, Serializer>(),
      new MapBuilder<FullType, Function>(),
      new ListBuilder<SerializerPlugin>());

  BuiltJsonSerializersBuilder._(
      this._typeToSerializer,
      this._wireNameToSerializer,
      this._typeNameToSerializer,
      this._builderFactories,
      this._plugins);

  @override
  void add(Serializer serializer) {
    if (serializer is! StructuredSerializer &&
        serializer is! PrimitiveSerializer) {
      throw new ArgumentError(
          'serializer must be StructuredSerializer or PrimitiveSerializer');
    }

    _wireNameToSerializer[serializer.wireName] = serializer;
    for (final type in serializer.types) {
      _typeToSerializer[type] = serializer;
      _typeNameToSerializer[_getRawName(type)] = serializer;
    }
  }

  @override
  void addBuilderFactory(FullType types, Function function) {
    _builderFactories[types] = function;
  }

  @override
  void addPlugin(SerializerPlugin plugin) {
    _plugins.add(plugin);
  }

  @override
  Serializers build() {
    return new BuiltJsonSerializers._(
        _typeToSerializer.build(),
        _wireNameToSerializer.build(),
        _typeNameToSerializer.build(),
        _builderFactories.build(),
        _plugins.build());
  }
}

String _getRawName(Type type) {
  final name = type.toString();
  final genericsStart = name.indexOf('<');
  return genericsStart == -1 ? name : name.substring(0, genericsStart);
}
