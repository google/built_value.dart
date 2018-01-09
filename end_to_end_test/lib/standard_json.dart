// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library standard_json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/polymorphism.dart';

part 'standard_json.g.dart';

abstract class StandardJsonValue
    implements Built<StandardJsonValue, StandardJsonValueBuilder> {
  static Serializer<StandardJsonValue> get serializer =>
      _$standardJsonValueSerializer;

  num get number;
  String get text;
  BuiltMap<String, JsonObject> get keyValues;
  BuiltList<Animal> get zoo;

  @nullable
  BuiltList<String> get strings;

  factory StandardJsonValue([updates(StandardJsonValueBuilder b)]) =
      _$StandardJsonValue;
  StandardJsonValue._();
}
