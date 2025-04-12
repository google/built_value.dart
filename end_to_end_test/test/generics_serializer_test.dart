// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/generics.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('GenericValue with known specifiedType but missing builder', () {
    var data = GenericValue<int>((b) => b..value = 1);
    var specifiedType = const FullType(GenericValue, [FullType(int)]);
    var serialized = json.decode(json.encode([
      'value',
      1,
    ])) as Object;

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

  group('GenericValue with known specifiedType and correct builder', () {
    var data = GenericValue<int>((b) => b..value = 1);
    var specifiedType = const FullType(GenericValue, [FullType(int)]);
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(specifiedType, () => GenericValueBuilder<int>()))
        .build();
    var serialized = json.decode(json.encode([
      'value',
      1,
    ])) as Object;

    test('can be serialized', () {
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });

    test('keeps generic type on deserialization', () {
      expect(
          serializersWithBuilder
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType
              .toString(),
          r'_$GenericValue<int>');
    });
  });

  group('GenericValue with known specifiedType, correct builder and null', () {
    var data = GenericValue<int?>();
    var specifiedType = const FullType(GenericValue, [FullType.nullable(int)]);
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(specifiedType, () => GenericValueBuilder<int?>()))
        .build();
    var serialized = json.decode(json.encode([])) as Object;

    test('can be serialized', () {
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });

    test('keeps generic type on deserialization', () {
      expect(
          serializersWithBuilder
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType
              .toString(),
          r'_$GenericValue<int?>');
    });
  });

  group('GenericValue with unknown specifiedType', () {
    var data = GenericValue<int>((b) => b..value = 1);
    var serialized = json.decode(json.encode([
      'GenericValue',
      'value',
      ['int', 1],
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('loses generic type on deserialization', () {
      expect(serializers.deserialize(serialized).runtimeType.toString(),
          r'_$GenericValue<Object?>');
    });
  });

  group('GenericValue with unknown specifiedType null value', () {
    var data = GenericValue<int?>();
    var serialized = json.decode(json.encode([
      'GenericValue',
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('loses generic type on deserialization', () {
      expect(serializers.deserialize(serialized).runtimeType.toString(),
          r'_$GenericValue<Object?>');
    });
  });

  group('BoundGenericValue with known specifiedType but missing builder', () {
    var data = BoundGenericValue<int>((b) => b..value = 1);
    var specifiedType = const FullType(BoundGenericValue, [FullType(int)]);
    var serialized = json.decode(json.encode([
      'value',
      1,
    ])) as Object;

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

  group('BoundGenericValue with known specifiedType and correct builder', () {
    var data = BoundGenericValue<int>((b) => b..value = 1);
    var specifiedType = const FullType(BoundGenericValue, [FullType(int)]);
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => BoundGenericValueBuilder<int>()))
        .build();
    var serialized = json.decode(json.encode([
      'value',
      1,
    ])) as Object;

    test('can be serialized', () {
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });

    test('keeps generic type on deserialization', () {
      expect(
          serializersWithBuilder
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType
              .toString(),
          r'_$BoundGenericValue<int>');
    });
  });

  group('BoundGenericValue with unknown specifiedType', () {
    var data = BoundGenericValue<int>((b) => b..value = 1);
    var serialized = json.decode(json.encode([
      'BoundGenericValue',
      'value',
      ['int', 1],
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('loses generic type on deserialization', () {
      expect(serializers.deserialize(serialized).runtimeType.toString(),
          r'_$BoundGenericValue<num>');
    });
  });

  group('CollectionGenericValue with known specifiedType but missing builder',
      () {
    var data = CollectionGenericValue<int>((b) => b..values.add(1));
    var specifiedType = const FullType(CollectionGenericValue, [FullType(int)]);
    var serialized = json.decode(json.encode([
      'values',
      [
        1,
      ],
    ])) as Object;

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

  group('CollectionGenericValue with known specifiedType and correct builder',
      () {
    var data = CollectionGenericValue<int>((b) => b..values.add(1));
    var specifiedType = const FullType(CollectionGenericValue, [FullType(int)]);
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => CollectionGenericValueBuilder<int>())
          ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]),
              () => ListBuilder<int>()))
        .build();
    var serialized = json.decode(json.encode([
      'values',
      [
        1,
      ],
    ])) as Object;

    test('can be serialized', () {
      serializersWithBuilder
          .expectBuilder(const FullType(BuiltList, [FullType(int)]));
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });

    test('keeps generic type on deserialization', () {
      expect(
          serializersWithBuilder
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType
              .toString(),
          r'_$CollectionGenericValue<int>');
    });
  });

  group('CollectionGenericValue with unknown specifiedType', () {
    var data = CollectionGenericValue<int>((b) => b..values.add(1));
    var serialized = json.decode(json.encode([
      'CollectionGenericValue',
      'values',
      [
        ['int', 1]
      ],
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('loses generic type on deserialization', () {
      expect(serializers.deserialize(serialized).runtimeType.toString(),
          r'_$CollectionGenericValue<Object?>');
    });
  });

  group('GenericContainer with known specifiedType', () {
    var data = GenericContainer((b) => b
      ..genericValue.value = '1'
      ..boundGenericValue.value = 2.2
      ..collectionGenericValue.values.add('3'));
    var specifiedType = const FullType(GenericContainer, [FullType(int)]);
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]),
              () => ListBuilder<String>()))
        .build();
    var serialized = json.decode(json.encode([
      'genericValue',
      ['value', '1'],
      'boundGenericValue',
      ['value', 2.2],
      'collectionGenericValue',
      [
        'values',
        ['3']
      ],
    ])) as Object;

    test('can be serialized', () {
      serializersWithBuilder
          .expectBuilder(const FullType(BuiltList, [FullType(int)]));
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });
  });

  group('GenericContainer with unknown specifiedType', () {
    var data = GenericContainer((b) => b
      ..genericValue.value = '1'
      ..boundGenericValue.value = 2.2
      ..collectionGenericValue.values.add('3'));
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]),
              () => ListBuilder<String>()))
        .build();
    var serialized = json.decode(json.encode([
      'GenericContainer',
      'genericValue',
      ['value', '1'],
      'boundGenericValue',
      ['value', 2.2],
      'collectionGenericValue',
      [
        'values',
        ['3']
      ],
    ])) as Object;

    test('can be serialized', () {
      expect(serializersWithBuilder.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializersWithBuilder.deserialize(serialized), data);
    });
  });

  group('PassthroughGenericContainer with known specifiedType', () {
    var data = PassthroughGenericContainer<int>((b) => b
      ..genericValue.value = 1
      ..collectionGenericValue.values.add(3));
    var specifiedType =
        const FullType(PassthroughGenericContainer, [FullType(int)]);
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => PassthroughGenericContainerBuilder<int>())
          ..addBuilderFactory(const FullType(GenericValue, [FullType(int)]),
              () => GenericValueBuilder<int>())
          ..addBuilderFactory(
              const FullType(CollectionGenericValue, [FullType(int)]),
              () => CollectionGenericValueBuilder<int>()))
        .build();
    var serialized = json.decode(json.encode([
      'genericValue',
      ['value', 1],
      'collectionGenericValue',
      [
        'values',
        [3]
      ],
    ])) as Object;

    test('can be serialized', () {
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });
  });

  group('PassthroughGenericContainer with unknown specifiedType', () {
    var data = PassthroughGenericContainer<int>((b) => b
      ..genericValue.value = 1
      ..collectionGenericValue.values.add(3));
    var specifiedType =
        const FullType(PassthroughGenericContainer, [FullType(int)]);
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => PassthroughGenericContainerBuilder<int>())
          ..addBuilderFactory(const FullType(GenericValue, [FullType(Object)]),
              () => GenericValueBuilder<Object>())
          ..addBuilderFactory(
              const FullType(CollectionGenericValue, [FullType(Object)]),
              () => CollectionGenericValueBuilder<Object>()))
        .build();
    var serialized = json.decode(json.encode([
      'PassthroughGenericContainer',
      'genericValue',
      [
        'value',
        ['int', 1]
      ],
      'collectionGenericValue',
      [
        'values',
        [
          ['int', 3]
        ]
      ]
    ])) as Object;

    test('can be serialized', () {
      expect(serializersWithBuilder.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializersWithBuilder.deserialize(serialized), data);
    });
  });

  group('NestedGenericContainer with known specifiedType', () {
    var data = NestedGenericContainer(
        (b) => b..map.value = BuiltMap<int, String>({1: 'one'}));
    var specifiedType = const FullType(NestedGenericContainer);
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              const FullType(BuiltMap, [FullType(int), FullType(String)]),
              () => MapBuilder<int, String>()))
        .build();
    var serialized = json.decode(json.encode([
      'map',
      [
        'value',
        [1, 'one'],
      ],
    ])) as Object;

    test('can be serialized', () {
      expect(
          serializersWithBuilder.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithBuilder.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });
  });

  group('ConcreteGeneric with unknown specifiedType', () {
    var data = ConcreteGeneric((b) => b..value = 1);
    var serialized =
        json.decode(json.encode(['ConcreteGeneric', 'value', 1])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
