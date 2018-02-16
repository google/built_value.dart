// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class BuiltSetSerializer implements StructuredSerializer<BuiltSet> {
  final bool structured = true;
  @override
  final Iterable<Type> types =
      new BuiltList<Type>([BuiltSet, new BuiltSet<Object>().runtimeType]);
  @override
  final String wireName = 'set';

  @override
  Iterable serialize(Serializers serializers, BuiltSet builtSet,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);

    final elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];

    return builtSet
        .map((item) => serializers.serialize(item, specifiedType: elementType));
  }

  @override
  BuiltSet deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;

    final elementType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];
    final SetBuilder result = isUnderspecified
        ? new SetBuilder<Object>()
        : serializers.newBuilder(specifiedType) as SetBuilder;

    result.replace(serialized.map(
        (item) => serializers.deserialize(item, specifiedType: elementType)));
    return result.build();
  }
}
