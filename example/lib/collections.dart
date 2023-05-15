// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library collections;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collections.g.dart';

/// Example of how to use built_value.
///
/// Classes can contain collections; these must be from built_collection. In
/// the builder, the builder corresponding to the collection is provided.
abstract class Collections implements Built<Collections, CollectionsBuilder> {
  /// Example of how to make a built_value type serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<Collections> get serializer => _$collectionsSerializer;

  BuiltList<int> get list;
  BuiltSet<String> get set;
  BuiltMap<String, int> get map;
  BuiltListMultimap<int, bool> get listMultimap;
  BuiltSetMultimap<String, bool> get setMultimap;

  BuiltList<int>? get nullableList;
  BuiltSet<String>? get nullableSet;
  BuiltMap<String, int>? get nullableMap;
  BuiltListMultimap<int, bool>? get nullableListMultimap;
  BuiltSetMultimap<String, bool>? get nullableSetMultimap;

  factory Collections([void Function(CollectionsBuilder) updates]) =
      _$Collections;
  Collections._();
}
