// Copyright (c) 2025, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class ListSerializer implements StructuredSerializer<List> {
  final bool structured = true;
  @override
  final Iterable<Type> types = BuiltList<Type>([List, <Object>[].runtimeType]);
  @override
  final String wireName = 'List';

  @override
  Iterable<Object?> serialize(Serializers serializers, List list,
      {FullType specifiedType = FullType.unspecified}) {
    var isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);

    var elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    return list
        .map((item) => serializers.serialize(item, specifiedType: elementType));
  }

  @override
  List deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    var isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;

    var elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    var result = isUnderspecified
        ? <Object>[]
        : serializers.newBuilder(specifiedType) as List;

    for (final item in serialized) {
      result.add(serializers.deserialize(item, specifiedType: elementType));
    }
    return result;
  }
}
