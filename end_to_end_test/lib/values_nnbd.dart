// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'values_nnbd.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  static Serializer<SimpleValue> get serializer => _$simpleValueSerializer;

  int get anInt;

  // Only fields marked @nullable can hold null.
  @nullable
  String? get aString;

  @nullable
  bool? get $mustBeEscaped;

  factory SimpleValue([void Function(SimpleValueBuilder) updates]) =
      _$SimpleValue;
  SimpleValue._();
}
