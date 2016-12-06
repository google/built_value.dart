// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

// TODO(davidmorgan): support special values.
class DoubleSerializer implements PrimitiveSerializer<double> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([double]);
  @override
  final String wireName = 'double';

  @override
  Object serialize(Serializers serializers, double aDouble,
      {FullType specifiedType: FullType.unspecified}) {
    return aDouble;
  }

  @override
  double deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return (serialized as num).toDouble();
  }
}
