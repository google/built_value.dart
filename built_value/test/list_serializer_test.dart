// Copyright (c) 2025, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  group('List with known specifiedType but missing builder', () {
    var data = <int>[1, 2, 3];
    var specifiedType = const FullType(List, [FullType(int)]);
    var serializers = Serializers();
    var serialized = json.decode(json.encode([1, 2, 3])) as Object;

    test('serialize throws', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(const TypeMatcher<StateError>()));
    });

    test('deserialize throws', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throwsA(const TypeMatcher<DeserializationError>()));
    });
  });

  group('List with known specifiedType and correct builder', () {
    var data = <int>[1, 2, 3];
    var specifiedType = const FullType(List, [FullType(int)]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => <int>[]))
        .build();
    var serialized = json.decode(json.encode([1, 2, 3])) as Object;

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
          <int>[].runtimeType);
    });
  });

  group('List nested with known specifiedType and correct builders', () {
    var data = <List<int>>[
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
    var specifiedType = const FullType(List, [
      FullType(List, [FullType(int)])
    ]);
    var serializers = (Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => <List<int>>[])
          ..addBuilderFactory(
              const FullType(List, [FullType(int)]), () => <int>[]))
        .build();
    var serialized = json.decode(json.encode([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
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

  group('List with unknown specifiedType and no builders', () {
    var data = <int>[1, 2, 3];
    var specifiedType = FullType.unspecified;
    var serializers = Serializers();
    var serialized = json.decode(json.encode([
      'List',
      ['int', 1],
      ['int', 2],
      ['int', 3]
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
