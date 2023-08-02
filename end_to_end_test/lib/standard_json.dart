// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/polymorphism.dart';
import 'package:end_to_end_test/values.dart';

part 'standard_json.g.dart';

abstract class StandardJsonValue
    implements Built<StandardJsonValue, StandardJsonValueBuilder> {
  static Serializer<StandardJsonValue> get serializer =>
      _$standardJsonValueSerializer;

  num get number;
  String get text;
  ComplexValue get value;
  BuiltMap<String, JsonObject> get keyValues;
  BuiltList<Animal> get zoo;
  BuiltSet<Animal> get uniqueZoo;

  BuiltList<String>? get strings;

  BuiltList<int?> get nullsInList;
  BuiltList<String?> get nullsInSet;
  BuiltMap<String, int?> get nullsInMap;

  // Always serialized with type.
  ComplexValueInterface? get object;
  BuiltList<Object> get objects;

  factory StandardJsonValue([void Function(StandardJsonValueBuilder) updates]) =
      _$StandardJsonValue;
  StandardJsonValue._();
}

abstract class ComplexValueInterface {}

abstract class ComplexValue
    implements Built<ComplexValue, ComplexValueBuilder>, ComplexValueInterface {
  static Serializer<ComplexValue> get serializer => _$complexValueSerializer;

  int get primitive;
  int? get nullablePrimitive;
  int? get nullablePrimitiveDoNotUse;
  SimpleValue get value;
  SimpleValue? get nullableValue;
  SimpleValue? get nullableValueDoNotUse;

  factory ComplexValue([void Function(ComplexValueBuilder) updates]) =
      _$ComplexValue;
  ComplexValue._();
}
