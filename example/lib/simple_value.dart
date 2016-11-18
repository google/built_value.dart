// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library simple_value;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'simple_value.g.dart';

/// Example of how to use built_value.
///
/// The value class must implement [Built]. It must be abstract, and have
/// fields declared as abstract getters. Finally, it must have a particular
/// constructor and factory, as shown here.
abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  /// Example of how to make a built_value type serializable.
  ///
  /// Declare a static final [Serializer] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static final Serializer<SimpleValue> serializer = _$simpleValueSerializer;

  int get anInt;

  // Only fields marked @nullable can hold null.
  @nullable
  String get aString;

  SimpleValue._();
  factory SimpleValue([updates(SimpleValueBuilder b)]) = _$SimpleValue;
}
