// Copyright (c) 2025, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class SetSerializer implements StructuredSerializer<Set> {
  final bool structured = true;
  @override
  final Iterable<Type> types = BuiltSet<Type>([Set, <Object>{}.runtimeType]);
  @override
  final String wireName = 'Set';

  @override
  Iterable<Object?> serialize(Serializers serializers, Set set,
      {FullType specifiedType = FullType.unspecified}) {
    var isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);

    var elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    return set
        .map((item) => serializers.serialize(item, specifiedType: elementType));
  }

  @override
  Set deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    var isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;

    var elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    var result = isUnderspecified
        ? <Object>{}
        : serializers.newBuilder(specifiedType) as Set;

    for (final item in serialized) {
      result.add(serializers.deserialize(item, specifiedType: elementType));
    }
    return result;
  }
}
