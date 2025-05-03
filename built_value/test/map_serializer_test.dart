// Copyright (c) 2025, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('Map with known specifiedType but missing builder', () {
    var data = <int, String>{1: 'one', 2: 'two', 3: 'three'};
    var specifiedType = const FullType(Map, [FullType(int), FullType(String)]);
    var serializers = Serializers();
    var serialized =
        json.decode(json.encode([1, 'one', 2, 'two', 3, 'three'])) as Object;

    test('cannot be serialized', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(const TypeMatcher<StateError>()));
    });

    test('cannot be deserialized', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throwsA(const TypeMatcher<DeserializationError>()));
    });
  });

  group('Map with known specifiedType and correct builder', () {
    var data = <int, String>{1: 'one', 2: 'two', 3: 'three'};
    var specifiedType = const FullType(Map, [FullType(int), FullType(String)]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => <int, String>{}))
        .build();
    var serialized =
        json.decode(json.encode([1, 'one', 2, 'two', 3, 'three'])) as Object;

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
          <int, String>{}.runtimeType);
    });
  });

  group('Map nested left with known specifiedType', () {
    var data = <Map<int, String>, String>{
      <int, String>{1: 'one'}: 'one!',
      <int, String>{2: 'two'}: 'two!'
    };
    const innerTypeLeft = FullType(Map, [FullType(int), FullType(String)]);
    var specifiedType = const FullType(Map, [innerTypeLeft, FullType(String)]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(innerTypeLeft, () => <int, String>{})
          ..addBuilderFactory(
              specifiedType, () => <Map<int, String>, String>{}))
        .build();
    var serialized = json.decode(json.encode([
      [1, 'one'],
      'one!',
      [2, 'two'],
      'two!'
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      // `expect` does not deep compare `Map` by key, `toString` is close
      // enough.
      expect(
          serializers
              .deserialize(serialized, specifiedType: specifiedType)
              .toString(),
          data.toString());
    });
  });

  group('Map nested right with known specifiedType', () {
    var data = <int, Map<String, String>>{
      1: <String, String>{'one': 'one!'},
      2: <String, String>{'two': 'two!'}
    };
    const innerTypeRight = FullType(Map, [FullType(String), FullType(String)]);
    var specifiedType = const FullType(Map, [FullType(int), innerTypeRight]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(innerTypeRight, () => <String, String>{})
          ..addBuilderFactory(
              specifiedType, () => <int, Map<String, String>>{}))
        .build();
    var serialized = json.decode(json.encode([
      1,
      ['one', 'one!'],
      2,
      ['two', 'two!']
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('Map nested both with known specifiedType', () {
    var data = <Map<int, int>, Map<String, String>>{
      <int, int>{1: 1}: <String, String>{'one': 'one!'},
      <int, int>{2: 2}: <String, String>{'two': 'two!'}
    };
    const MapOfIntIntGenericType =
        FullType(Map, [FullType(int), FullType(int)]);
    const MapOfStringStringGenericType =
        FullType(Map, [FullType(String), FullType(String)]);
    var specifiedType = const FullType(
        Map, [MapOfIntIntGenericType, MapOfStringStringGenericType]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(MapOfIntIntGenericType, () => <int, int>{})
          ..addBuilderFactory(
              MapOfStringStringGenericType, () => <String, String>{})
          ..addBuilderFactory(
              specifiedType, () => <Map<int, int>, Map<String, String>>{}))
        .build();
    var serialized = json.decode(json.encode([
      [1, 1],
      ['one', 'one!'],
      [2, 2],
      ['two', 'two!']
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      // `expect` does not deep compare `Map` by key, `toString` is close
      // enough.
      expect(
          serializers
              .deserialize(serialized, specifiedType: specifiedType)
              .toString(),
          data.toString());
    });

    test('keeps generic type on deserialization', () {
      final genericSerializer = (serializers.toBuilder()
            ..addBuilderFactory(
                specifiedType, () => <Map<int, int>, Map<String, String>>{})
            ..addBuilderFactory(MapOfIntIntGenericType, () => <int, int>{})
            ..addBuilderFactory(
                MapOfStringStringGenericType, () => <String, String>{}))
          .build();

      expect(
          genericSerializer
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType,
          <Map<int, int>, Map<String, String>>{}.runtimeType);
    });
  });

  group('Map with Object values', () {
    var data = <int, Object>{1: 'one', 2: 2, 3: 'three'};
    var specifiedType =
        const FullType(Map, [FullType(int), FullType.unspecified]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => <int, Object>{}))
        .build();
    var serialized = json.decode(json.encode([
      1,
      ['String', 'one'],
      2,
      ['int', 2],
      3,
      ['String', 'three']
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('Map with Object keys', () {
    var data = <Object, String>{1: 'one', 'two': 'two', 3: 'three'};
    var specifiedType =
        const FullType(Map, [FullType.unspecified, FullType(String)]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => <Object, String>{}))
        .build();
    var serialized = json.decode(json.encode([
      ['int', 1],
      'one',
      ['String', 'two'],
      'two',
      ['int', 3],
      'three'
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('Map with Object keys and values', () {
    var data = <Object, Object>{1: 'one', 'two': 2, 3: 'three'};
    var specifiedType = const FullType(Map);
    var serializers = Serializers();
    var serialized = json.decode(json.encode([
      ['int', 1],
      ['String', 'one'],
      ['String', 'two'],
      ['int', 2],
      ['int', 3],
      ['String', 'three']
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('Map with unknown specifiedType', () {
    var data = <Object, Object>{1: 'one', 'two': 2, 3: 'three'};
    var specifiedType = FullType.unspecified;
    var serializers = Serializers();
    var serialized = json.decode(json.encode([
      'Map',
      ['int', 1],
      ['String', 'one'],
      ['String', 'two'],
      ['int', 2],
      ['int', 3],
      ['String', 'three']
    ])) as Object;

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
