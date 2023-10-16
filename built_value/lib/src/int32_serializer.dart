// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:fixnum/fixnum.dart';

class Int32Serializer implements PrimitiveSerializer<Int32> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([Int32]);
  @override
  final String wireName = 'Int32';

  @override
  Object serialize(Serializers serializers, Int32 int32,
      {FullType specifiedType = FullType.unspecified}) {
    return int32.toInt();
  }

  @override
  Int32 deserialize(Serializers serializers, Object? serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return Int32(serialized as int);
  }
}
