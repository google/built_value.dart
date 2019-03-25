// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/async_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('BuiltList', () {
    final data = new BuiltList<int>([1, 2, 3]);
    final specifiedType =
        const FullType(BuiltList, const [const FullType(int)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => new ListBuilder<int>()))
        .build();
    final serialized = [1, 2, 3];

    test('can be deserialized asynchronously', () async {
      final deserialized = await new BuiltListAsyncDeserializer()
          .deserialize(serializers, serialized, specifiedType: specifiedType)
          .toList();

      expect(deserialized, data);
    });
  });
}
