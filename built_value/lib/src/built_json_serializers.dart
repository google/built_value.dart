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

  BuiltJsonSerializers._(this._typeToSerializer, this._wireNameToSerializer,
      this._typeNameToSerializer, this._builderFactories);

  @override
  Object serialize(Object object,
      {FullType specifiedType: FullType.unspecified}) {
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
    if (specifiedType.isUnspecified) {
      final wireName = (object as List).first;

      final serializer = _wireNameToSerializer[wireName];
      if (serializer == null) {
        throw new StateError("No serializer for '${wireName}'.");
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
        // Might be an interface; try resolving using the runtime type.
        return deserialize(object);
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
    return builderFactory == null ? null : builderFactory();
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
        _builderFactories.toBuilder());
  }

  Serializer _getSerializerByType(Type type) {
    return _typeToSerializer[type] ?? _typeNameToSerializer[_getRawName(type)];
  }
}

/// Default implementation of [SerializersBuilder].
class BuiltJsonSerializersBuilder implements SerializersBuilder {
  MapBuilder<Type, Serializer> _typeToSerializer =
      new MapBuilder<Type, Serializer>();
  MapBuilder<String, Serializer> _wireNameToSerializer =
      new MapBuilder<String, Serializer>();
  MapBuilder<String, Serializer> _typeNameToSerializer =
      new MapBuilder<String, Serializer>();

  MapBuilder<FullType, Function> _builderFactories =
      new MapBuilder<FullType, Function>();

  BuiltJsonSerializersBuilder();

  BuiltJsonSerializersBuilder._(
      this._typeToSerializer,
      this._wireNameToSerializer,
      this._typeNameToSerializer,
      this._builderFactories);

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

  void addBuilderFactory(FullType types, Function function) {
    _builderFactories[types] = function;
  }

  Serializers build() {
    return new BuiltJsonSerializers._(
        _typeToSerializer.build(),
        _wireNameToSerializer.build(),
        _typeNameToSerializer.build(),
        _builderFactories.build());
  }
}

String _getRawName(Type type) {
  final name = type.toString();
  final genericsStart = name.indexOf('<');
  return genericsStart == -1 ? name : name.substring(0, genericsStart);
}
