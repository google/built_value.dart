// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class DoubleSerializer implements PrimitiveSerializer<double> {
  // Constant names match those in [double].
  // ignore_for_file: non_constant_identifier_names
  static final String NAN = 'NaN';
  static final String INFINITY = 'INF';
  static final String NEGATIVE_INFINITY = '-INF';

  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([double]);
  @override
  final String wireName = 'double';

  @override
  Object serialize(Serializers serializers, double aDouble,
      {FullType specifiedType: FullType.unspecified}) {
    if (aDouble.isNaN) {
      return NAN;
    } else if (aDouble.isInfinite) {
      return aDouble.isNegative ? NEGATIVE_INFINITY : INFINITY;
    } else {
      return aDouble;
    }
  }

  @override
  double deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    if (serialized == NAN) {
      return double.NAN;
    } else if (serialized == NEGATIVE_INFINITY) {
      return double.NEGATIVE_INFINITY;
    } else if (serialized == INFINITY) {
      return double.INFINITY;
    } else {
      return (serialized as num).toDouble();
    }
  }
}
