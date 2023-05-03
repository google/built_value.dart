// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class Uint8ListSerializer implements PrimitiveSerializer<Uint8List> {
  @override
  final String wireName = 'UInt8List';

  @override
  Object serialize(Serializers serializers, Uint8List uint8list,
      {FullType specifiedType = FullType.unspecified}) {
    return base64Encode(uint8list);
  }

  @override
  Uint8List deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return base64Decode(serialized as String);
  }

  @override
  Iterable<Type> get types => BuiltList<Type>([Uint8List]);
}
