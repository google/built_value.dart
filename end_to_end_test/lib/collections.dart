// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collections.g.dart';

abstract class Collections implements Built<Collections, CollectionsBuilder> {
  static Serializer<Collections> get serializer => _$collectionsSerializer;

  BuiltList<int> get list;
  BuiltSet<String> get set;
  BuiltMap<String, int> get map;
  BuiltListMultimap<int, bool> get listMultimap;
  BuiltSetMultimap<String, bool> get setMultimap;

  BuiltList<int?> get nullsInList;
  BuiltSet<String?> get nullsInSet;
  BuiltMap<String?, int?> get nullsInMap;
  BuiltListMultimap<int?, bool> get nullsInListMultimap;
  BuiltSetMultimap<String, bool?> get nullsInSetMultimap;

  BuiltList<int>? get nullableList;
  BuiltSet<String>? get nullableSet;
  BuiltMap<String, int>? get nullableMap;
  BuiltListMultimap<int, bool>? get nullableListMultimap;
  BuiltSetMultimap<String, bool>? get nullableSetMultimap;

  BuiltList<Foo<int?>> get nullableInGenericsList;

  BuiltList<BuiltList<int?>?> get nestedNullablesList;

  factory Collections([void Function(CollectionsBuilder) updates]) =
      _$Collections;
  Collections._();
}

class Foo<T> {}
