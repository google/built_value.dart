// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('BuiltListMultimap with known specifiedType and correct builder', () {
    final data = new BuiltListMultimap<int, String>({
      1: ['one'],
      2: ['two'],
      3: ['three', '3hree']
    });
    final specifiedType = const FullType(
        BuiltListMultimap, const [const FullType(int), const FullType(String)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new ListMultimapBuilder<int, String>()))
        .build();
    final serialized = [
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
              .runtimeType
              .toString(),
          'BuiltListMultimap<int, String>');
    });
  });
}
