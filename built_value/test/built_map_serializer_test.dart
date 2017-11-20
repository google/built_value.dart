// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('BuiltMap with known specifiedType but missing builder', () {
    final data = new BuiltMap<int, String>({1: 'one', 2: 'two', 3: 'three'});
    final specifiedType = const FullType(
        BuiltMap, const [const FullType(int), const FullType(String)]);
    final serializers = new Serializers();
    final serialized = [1, 'one', 2, 'two', 3, 'three'];

    test('cannot be serialized', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(new isInstanceOf<StateError>()));
    });

    test('cannot be deserialized', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throwsA(new isInstanceOf<StateError>()));
    });
  });

  group('BuiltMap with known specifiedType and correct builder', () {
    final data = new BuiltMap<int, String>({1: 'one', 2: 'two', 3: 'three'});
    final specifiedType = const FullType(
        BuiltMap, const [const FullType(int), const FullType(String)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new MapBuilder<int, String>()))
        .build();
    final serialized = [1, 'one', 2, 'two', 3, 'three'];

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
          new BuiltMap<int, String>().runtimeType);
    });
  });

  group('BuiltMap nested left with known specifiedType', () {
    final data = new BuiltMap<BuiltMap<int, String>, String>({
      new BuiltMap<int, String>({1: 'one'}): 'one!',
      new BuiltMap<int, String>({2: 'two'}): 'two!'
    });
    const innerTypeLeft = const FullType(
        BuiltMap, const [const FullType(int), const FullType(String)]);
    final specifiedType =
        const FullType(BuiltMap, const [innerTypeLeft, const FullType(String)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              innerTypeLeft, () => new MapBuilder<int, String>())
          ..addBuilderFactory(specifiedType,
              () => new MapBuilder<BuiltMap<int, String>, String>()))
        .build();
    final serialized = [
      [1, 'one'],
      'one!',
      [2, 'two'],
      'two!'
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

  group('BuiltMap nested right with known specifiedType', () {
    final data = new BuiltMap<int, BuiltMap<String, String>>({
      1: new BuiltMap<String, String>({'one': 'one!'}),
      2: new BuiltMap<String, String>({'two': 'two!'})
    });
    const innerTypeRight = const FullType(
        BuiltMap, const [const FullType(String), const FullType(String)]);
    final specifiedType =
        const FullType(BuiltMap, const [const FullType(int), innerTypeRight]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              innerTypeRight, () => new MapBuilder<String, String>())
          ..addBuilderFactory(specifiedType,
              () => new MapBuilder<int, BuiltMap<String, String>>()))
        .build();
    final serialized = [
      1,
      ['one', 'one!'],
      2,
      ['two', 'two!']
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

  group('BuiltMap nested both with known specifiedType', () {
    final data = new BuiltMap<BuiltMap<int, int>, BuiltMap<String, String>>({
      new BuiltMap<int, int>({1: 1}):
          new BuiltMap<String, String>({'one': 'one!'}),
      new BuiltMap<int, int>({2: 2}):
          new BuiltMap<String, String>({'two': 'two!'})
    });
    const builtMapOfIntIntGenericType = const FullType(
        BuiltMap, const [const FullType(int), const FullType(int)]);
    const builtMapOfStringStringGenericType = const FullType(
        BuiltMap, const [const FullType(String), const FullType(String)]);
    final specifiedType = const FullType(BuiltMap,
        const [builtMapOfIntIntGenericType, builtMapOfStringStringGenericType]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              builtMapOfIntIntGenericType, () => new MapBuilder<int, int>())
          ..addBuilderFactory(builtMapOfStringStringGenericType,
              () => new MapBuilder<String, String>())
          ..addBuilderFactory(
              specifiedType,
              () => new MapBuilder<BuiltMap<int, int>,
                  BuiltMap<String, String>>()))
        .build();
    final serialized = [
      [1, 1],
      ['one', 'one!'],
      [2, 2],
      ['two', 'two!']
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });

    test('keeps generic type on deserialization', () {
      final genericSerializer = (serializers.toBuilder()
            ..addBuilderFactory(
                specifiedType,
                () => new MapBuilder<BuiltMap<int, int>,
                    BuiltMap<String, String>>())
            ..addBuilderFactory(
                builtMapOfIntIntGenericType, () => new MapBuilder<int, int>())
            ..addBuilderFactory(builtMapOfStringStringGenericType,
                () => new MapBuilder<String, String>()))
          .build();

      expect(
          genericSerializer
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType,
          new BuiltMap<BuiltMap<int, int>, BuiltMap<String, String>>()
              .runtimeType);
    });
  });

  group('BuiltMap with Object values', () {
    final data = new BuiltMap<int, Object>({1: 'one', 2: 2, 3: 'three'});
    final specifiedType = const FullType(
        BuiltMap, const [const FullType(int), FullType.unspecified]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new MapBuilder<int, Object>()))
        .build();
    final serialized = [
      1,
      ['String', 'one'],
      2,
      ['int', 2],
      3,
      ['String', 'three']
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

  group('BuiltMap with Object keys', () {
    final data =
        new BuiltMap<Object, String>({1: 'one', 'two': 'two', 3: 'three'});
    final specifiedType = const FullType(
        BuiltMap, const [FullType.unspecified, const FullType(String)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new MapBuilder<Object, String>()))
        .build();
    final serialized = [
      ['int', 1],
      'one',
      ['String', 'two'],
      'two',
      ['int', 3],
      'three'
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

  group('BuiltMap with Object keys and values', () {
    final data = new BuiltMap<Object, Object>({1: 'one', 'two': 2, 3: 'three'});
    final specifiedType = const FullType(BuiltMap);
    final serializers = new Serializers();
    final serialized = [
      ['int', 1],
      ['String', 'one'],
      ['String', 'two'],
      ['int', 2],
      ['int', 3],
      ['String', 'three']
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

  group('BuiltMap with unknown specifiedType', () {
    final data = new BuiltMap<Object, Object>({1: 'one', 'two': 2, 3: 'three'});
    final specifiedType = FullType.unspecified;
    final serializers = new Serializers();
    final serialized = [
      'map',
      ['int', 1],
      ['String', 'one'],
      ['String', 'two'],
      ['int', 2],
      ['int', 3],
      ['String', 'three']
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
