// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

/// Runtime type for [RegExp] private implementation.
final _runtimeType = RegExp('').runtimeType;

class RegExpSerializer implements PrimitiveSerializer<RegExp> {
  final bool structured = false;
  @override
  final Iterable<Type> types =
      new BuiltList<Type>([RegExp, _runtimeType]);
  @override
  final String wireName = 'RegExp';

  @override
  Object serialize(Serializers serializers, RegExp value,
      {FullType specifiedType = FullType.unspecified}) {
    return value.pattern;
  }

  @override
  RegExp deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return RegExp(serialized as String);
  }
}
