// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class BuiltListSerializer implements StructuredSerializer<BuiltList> {
  final bool structured = true;
  @override
  final Iterable<Type> types = new BuiltList<Type>([BuiltList]);
  @override
  final String wireName = 'list';

  @override
  Iterable serialize(Serializers serializers, BuiltList builtList,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;

    final elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    if (!isUnderspecified && !serializers.hasBuilder(specifiedType)) {
      throw new StateError('No builder for $specifiedType, cannot serialize.');
    }

    return builtList
        .map((item) => serializers.serialize(item, specifiedType: elementType));
  }

  @override
  BuiltList deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;

    final elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    final ListBuilder result = isUnderspecified
        ? new ListBuilder<Object>()
        : serializers.newBuilder(specifiedType) as ListBuilder;
    if (result == null) {
      throw new StateError(
          'No builder for $specifiedType, cannot deserialize.');
    }
    result.addAll(serialized.map(
        (item) => serializers.deserialize(item, specifiedType: elementType)));
    return result.build();
  }
}
