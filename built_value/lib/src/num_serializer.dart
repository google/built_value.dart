// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/src/double_serializer.dart';

class NumSerializer implements PrimitiveSerializer<num> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([num]);
  @override
  final String wireName = 'num';

  @override
  Object serialize(Serializers serializers, num number,
      {FullType specifiedType: FullType.unspecified}) {
    if (number.isNaN) {
      return DoubleSerializer.NAN;
    } else if (number.isInfinite) {
      return number.isNegative
          ? DoubleSerializer.NEGATIVE_INFINITY
          : DoubleSerializer.INFINITY;
    } else {
      return number;
    }
  }

  @override
  num deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    if (serialized == DoubleSerializer.NAN) {
      return double.NAN;
    } else if (serialized == DoubleSerializer.NEGATIVE_INFINITY) {
      return double.NEGATIVE_INFINITY;
    } else if (serialized == DoubleSerializer.INFINITY) {
      return double.INFINITY;
    } else {
      return (serialized as num).toDouble();
    }
  }
}
