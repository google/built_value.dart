// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('BuiltListMultimap with known specifiedType and correct builder', () {
    var data = BuiltListMultimap<int, String>({
      1: ['one'],
      2: ['two'],
      3: ['three', '3hree']
    });
    var specifiedType =
        const FullType(BuiltListMultimap, [FullType(int), FullType(String)]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => ListMultimapBuilder<int, String>()))
        .build();
    var serialized = [
      1,
      ['one'],
      2,
      ['two'],
      3,
      ['three', '3hree']
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });

    test('keeps generic type when deserialized', () {
      expect(
          serializers
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType,
          BuiltListMultimap<int, String>().runtimeType);
    });
  });
}
