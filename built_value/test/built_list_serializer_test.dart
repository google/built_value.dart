// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('BuiltList with known specifiedType but missing builder', () {
    final data = new BuiltList<int>([1, 2, 3]);
    final specifiedType =
        const FullType(BuiltList, const [const FullType(int)]);
    final serializers = new Serializers();
    final serialized = [1, 2, 3];

    test('serialize throws', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(new isInstanceOf<StateError>()));
    });

    test('deserialize throws', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throwsA(new isInstanceOf<StateError>()));
    });
  });

  group('BuiltList with known specifiedType and correct builder', () {
    final data = new BuiltList<int>([1, 2, 3]);
    final specifiedType =
        const FullType(BuiltList, const [const FullType(int)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => new ListBuilder<int>()))
        .build();
    final serialized = [1, 2, 3];

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
          new BuiltList<int>().runtimeType);
    });
  });

  group('BuiltList nested with known specifiedType and correct builders', () {
    final data = new BuiltList<BuiltList<int>>([
      new BuiltList<int>([1, 2, 3]),
      new BuiltList<int>([4, 5, 6]),
      new BuiltList<int>([7, 8, 9])
    ]);
    final specifiedType = const FullType(BuiltList, const [
      const FullType(BuiltList, const [const FullType(int)])
    ]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new ListBuilder<BuiltList<int>>())
          ..addBuilderFactory(
              const FullType(BuiltList, const [const FullType(int)]),
              () => new ListBuilder<int>()))
        .build();
    final serialized = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('BuiltList with unknown specifiedType and no builders', () {
    final data = new BuiltList<int>([1, 2, 3]);
    final specifiedType = FullType.unspecified;
    final serializers = new Serializers();
    final serialized = [
      'list',
      ['int', 1],
      ['int', 2],
      ['int', 3]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });
}
