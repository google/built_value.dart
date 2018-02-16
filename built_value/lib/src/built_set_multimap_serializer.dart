// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class BuiltSetMultimapSerializer
    implements StructuredSerializer<BuiltSetMultimap> {
  final bool structured = true;
  @override
  final Iterable<Type> types = new BuiltSet<Type>([BuiltSetMultimap]);
  @override
  final String wireName = 'setMultimap';

  @override
  Iterable serialize(Serializers serializers, BuiltSetMultimap builtSetMultimap,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);

    final keyType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];
    final valueType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[1];

    final result = <Object>[];
    for (final key in builtSetMultimap.keys) {
      result.add(serializers.serialize(key, specifiedType: keyType));
      result.add(builtSetMultimap[key]
          .map(
              (value) => serializers.serialize(value, specifiedType: valueType))
          .toList());
    }
    return result;
  }

  @override
  BuiltSetMultimap deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;

    final keyType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[0];
    final valueType = specifiedType.parameters.isEmpty
        ? FullType.unspecified
        : specifiedType.parameters[1];

    final SetMultimapBuilder result = isUnderspecified
        ? new SetMultimapBuilder<Object, Object>()
        : serializers.newBuilder(specifiedType) as SetMultimapBuilder;

    if (serialized.length % 2 == 1) {
      throw new ArgumentError('odd length');
    }

    for (int i = 0; i != serialized.length; i += 2) {
      final key = serializers.deserialize(serialized.elementAt(i),
          specifiedType: keyType);
      final values = serialized.elementAt(i + 1).map(
          (value) => serializers.deserialize(value, specifiedType: valueType));
      for (final value in values) {
        result.add(key, value);
      }
    }

    return result.build();
  }
}
