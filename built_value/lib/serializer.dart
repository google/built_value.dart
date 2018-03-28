// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/src/big_int_serializer.dart';
import 'package:built_value/src/date_time_serializer.dart';
import 'package:built_value/src/int64_serializer.dart';
import 'package:built_value/src/json_object_serializer.dart';
import 'package:built_value/src/num_serializer.dart';
import 'package:built_value/src/uri_serializer.dart';
import 'package:quiver/core.dart';

import 'src/bool_serializer.dart';
import 'src/built_json_serializers.dart';
import 'src/built_list_multimap_serializer.dart';
import 'src/built_list_serializer.dart';
import 'src/built_map_serializer.dart';
import 'src/built_set_multimap_serializer.dart';
import 'src/built_set_serializer.dart';
import 'src/double_serializer.dart';
import 'src/int_serializer.dart';
import 'src/string_serializer.dart';

/// Annotation to trigger code generation of a [Serializers] instance.
///
/// Use like this:
///
/// ```
/// @SerializersFor(const [
///   MySerializableClass,
///   MyOtherSerializableClass,
/// ])
/// final Serializers serializers = _$serializers;
/// ```
///
/// The `_$serializers` value will be generated for you in a part file next
/// to the current source file. It will hold serializers for the types
/// specified plus any types used in their fields, transitively.
class SerializersFor {
  final List<Type> types;

  const SerializersFor(this.types);
}

/// Serializes all known classes.
///
/// See: https://github.com/google/built_value.dart/tree/master/example
abstract class Serializers {
  /// Default [Serializers] that can serialize primitives and collections.
  ///
  /// Use [toBuilder] to add more serializers.
  factory Serializers() {
    return (new SerializersBuilder()
          ..add(new BigIntSerializer())
          ..add(new BoolSerializer())
          ..add(new BuiltListSerializer())
          ..add(new BuiltListMultimapSerializer())
          ..add(new BuiltMapSerializer())
          ..add(new BuiltSetSerializer())
          ..add(new BuiltSetMultimapSerializer())
          ..add(new DateTimeSerializer())
          ..add(new DoubleSerializer())
          ..add(new IntSerializer())
          ..add(new Int64Serializer())
          ..add(new JsonObjectSerializer())
          ..add(new NumSerializer())
          ..add(new StringSerializer())
          ..add(new UriSerializer())
          ..addBuilderFactory(
              const FullType(BuiltList, const [FullType.object]),
              () => new ListBuilder<Object>())
          ..addBuilderFactory(
              const FullType(
                  BuiltListMultimap, const [FullType.object, FullType.object]),
              () => new ListMultimapBuilder<Object, Object>())
          ..addBuilderFactory(
              const FullType(
                  BuiltMap, const [FullType.object, FullType.object]),
              () => new MapBuilder<Object, Object>())
          ..addBuilderFactory(const FullType(BuiltSet, const [FullType.object]),
              () => new SetBuilder<Object>())
          ..addBuilderFactory(
              const FullType(
                  BuiltSetMultimap, const [FullType.object, FullType.object]),
              () => new SetMultimapBuilder<Object, Object>()))
        .build();
  }

  /// Serializes [object].
  ///
  /// A [Serializer] must have been provided for every type the object uses.
  ///
  /// Types that are known statically can be provided via [specifiedType]. This
  /// will reduce the amount of data needed on the wire. The exact same
  /// [specifiedType] will be needed to deserialize.
  ///
  /// Create one using [SerializersBuilder].
  ///
  /// TODO(davidmorgan): document the wire format.
  Object serialize(Object object,
      {FullType specifiedType: FullType.unspecified});

  /// Convenience method for when you know the type you're serializing.
  /// Specify the type by specifying its [Serializer] class. Equivalent to
  /// calling [serialize] with a `specifiedType`.
  Object serializeWith<T>(Serializer<T> serializer, T object);

  /// Deserializes [serialized].
  ///
  /// A [Serializer] must have been provided for every type the object uses.
  ///
  /// If [serialized] was produced by calling [serialize] with [specifiedType],
  /// the exact same [specifiedType] must be provided to deserialize.
  Object deserialize(Object serialized,
      {FullType specifiedType: FullType.unspecified});

  /// Convenience method for when you know the type you're deserializing.
  /// Specify the type by specifying its [Serializer] class. Equivalent to
  /// calling [deserialize] with a `specifiedType`.
  T deserializeWith<T>(Serializer<T> serializer, Object serialized);

  /// Creates a new builder for the type represented by [fullType].
  ///
  /// For example, if [fullType] is `BuiltList<int, String>`, returns a
  /// `ListBuilder<int, String>`. This helps serializers to instantiate with
  /// correct generic type parameters.
  ///
  /// Throws a [StateError] if no matching builder factory has been added.
  Object newBuilder(FullType fullType);

  /// Whether a builder for [fullType] is available via [newBuilder].
  bool hasBuilder(FullType fullType);

  /// Throws if a builder for [fullType] is not available via [newBuilder].
  void expectBuilder(FullType fullType);

  SerializersBuilder toBuilder();
}

/// Note: this is an experimental feature. API may change without a major
/// version increase.
abstract class SerializerPlugin {
  Object beforeSerialize(Object object, FullType specifiedType);

  Object afterSerialize(Object object, FullType specifiedType);

  Object beforeDeserialize(Object object, FullType specifiedType);

  Object afterDeserialize(Object object, FullType specifiedType);
}

/// Builder for [Serializers].
abstract class SerializersBuilder {
  factory SerializersBuilder() = BuiltJsonSerializersBuilder;

  void add(Serializer serializer);

  void addBuilderFactory(FullType specifiedType, Function function);

  void addPlugin(SerializerPlugin plugin);

  Serializers build();
}

/// A [Type] with, optionally, [FullType] generic type parameters.
///
/// May also be [unspecified], indicating that no type information is
/// available.
class FullType {
  /// An unspecified type.
  static const FullType unspecified = const FullType(null);

  /// The [Object] type.
  static const FullType object = const FullType(Object);

  /// The root of the type.
  final Type root;

  /// Type parameters of the type.
  final List<FullType> parameters;

  const FullType(this.root, [this.parameters = const []]);

  bool get isUnspecified => identical(root, null);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! FullType) return false;
    if (root != other.root) return false;
    if (parameters.length != other.parameters.length) return false;
    for (var i = 0; i != parameters.length; ++i) {
      if (parameters[i] != other.parameters[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode {
    return hash2(root, hashObjects(parameters));
  }

  @override
  String toString() => isUnspecified
      ? 'unspecified'
      : parameters.isEmpty
          ? root.toString()
          : '${root.toString()}<${parameters.join(", ")}>';
}

/// Serializes a single type.
///
/// You should not usually need to implement this interface. Implementations
/// are provided for collections and primitives in `built_json`. Classes using
/// `built_value` and enums using `EnumClass` can have implementations
/// generated using `built_json_generator`.
///
/// Implementations must extend either [PrimitiveSerializer] or
/// [StructuredSerializer].
abstract class Serializer<T> {
  /// The [Type]s that can be serialized.
  ///
  /// They must all be equal to T or a subclass of T. Subclasses are used when
  /// T is an abstract class, which is the case with built_value generated
  /// serializers.
  Iterable<Type> get types;

  /// The wire name of the serializable type. For most classes, the class name.
  /// For primitives and collections a lower-case name is defined as part of
  /// the `built_json` wire format.
  String get wireName;
}

/// A [Serializer] that serializes to and from primitive JSON values.
abstract class PrimitiveSerializer<T> implements Serializer<T> {
  /// Serializes [object].
  ///
  /// Use [serializers] as needed for nested serialization. Information about
  /// the type being serialized is provided in [specifiedType].
  ///
  /// Returns a value that can be represented as a JSON primitive: a boolean,
  /// an integer, a double, or a String.
  ///
  /// TODO(davidmorgan): document the wire format.
  Object serialize(Serializers serializers, T object,
      {FullType specifiedType: FullType.unspecified});

  /// Deserializes [serialized].
  ///
  /// [serialized] is a boolean, an integer, a double or a String.
  ///
  /// Use [serializers] as needed for nested deserialization. Information about
  /// the type being deserialized is provided in [specifiedType].
  T deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified});
}

/// A [Serializer] that serializes to and from an [Iterable] of primitive JSON
/// values.
abstract class StructuredSerializer<T> implements Serializer<T> {
  /// Serializes [object].
  ///
  /// Use [serializers] as needed for nested serialization. Information about
  /// the type being serialized is provided in [specifiedType].
  ///
  /// Returns an [Iterable] of values that can be represented as structured
  /// JSON: booleans, integers, doubles, Strings and [Iterable]s.
  ///
  /// TODO(davidmorgan): document the wire format.
  Iterable serialize(Serializers serializers, T object,
      {FullType specifiedType: FullType.unspecified});

  /// Deserializes [serialized].
  ///
  /// [serialized] is an [Iterable] that may contain booleans, integers,
  /// doubles, Strings and/or [Iterable]s.
  ///
  /// Use [serializers] as needed for nested deserialization. Information about
  /// the type being deserialized is provided in [specifiedType].
  T deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified});
}
