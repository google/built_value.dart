// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library collections;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'collections.g.dart';

/// Example of how to use built_value.
///
/// Classes can contain collections; these must be from built_collection. In
/// the builder, the builder corresponding to the collection is provided.
abstract class Collections implements Built<Collections, CollectionsBuilder> {
  BuiltList<int> get list;
  BuiltSet<String> get set;
  BuiltMap<String, int> get map;
  BuiltListMultimap<int, bool> get listMultimap;
  BuiltSetMultimap<String, bool> get setMultimap;

  @nullable
  BuiltList<int> get nullableList;
  @nullable
  BuiltSet<String> get nullableSet;
  @nullable
  BuiltMap<String, int> get nullableMap;
  @nullable
  BuiltListMultimap<int, bool> get nullableListMultimap;
  @nullable
  BuiltSetMultimap<String, bool> get nullableSetMultimap;

  Collections._();
  factory Collections([updates(CollectionsBuilder b)]) = _$Collections;
}
