// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.

// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:example/generics.dart';
import 'package:example/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('GenericValue with known specifiedType but missing builder', () {
    final data = new GenericValue<int>((b) => b..value = 1);
    final specifiedType =
        const FullType(GenericValue, const [const FullType(int)]);
    final serialized = [
      'value',
      1,
    ];

    test('cannot be serialized', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throws);
    });

    test('cannot be deserialized', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throws);
    });
  });

  group('GenericValue with known specifiedType and correct builder', () {
    final data = new GenericValue<int>((b) => b..value = 1);
    final specifiedType =
        const FullType(GenericValue, const [const FullType(int)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new GenericValueBuilder<int>()))
        .build();
    final serialized = [
      'value',
      1,
    ];

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

  group('GenericValue with unknown specifiedType', () {
    final data = new GenericValue<int>((b) => b..value = 1);
    final serialized = [
      'GenericValue',
      'value',
      ['int', 1],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('loses generic type on deserialization', () {
      expect(serializers.deserialize(serialized).runtimeType.toString(),
          r'_$GenericValue<Object>');
    });
  });

  group('BoundGenericValue with known specifiedType but missing builder', () {
    final data = new BoundGenericValue<int>((b) => b..value = 1);
    final specifiedType =
        const FullType(BoundGenericValue, const [const FullType(int)]);
    final serialized = [
      'value',
      1,
    ];

    test('cannot be serialized', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throws);
    });

    test('cannot be deserialized', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throws);
    });
  });

  group('BoundGenericValue with known specifiedType and correct builder', () {
    final data = new BoundGenericValue<int>((b) => b..value = 1);
    final specifiedType =
        const FullType(BoundGenericValue, const [const FullType(int)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new BoundGenericValueBuilder<int>()))
        .build();
    final serialized = [
      'value',
      1,
    ];

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
    final data = new BoundGenericValue<int>((b) => b..value = 1);
    final serialized = [
      'BoundGenericValue',
      'value',
      ['int', 1],
    ];

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
    final data = new CollectionGenericValue<int>((b) => b..values.add(1));
    final specifiedType =
        const FullType(CollectionGenericValue, const [const FullType(int)]);
    final serialized = [
      'values',
      [
        1,
      ],
    ];

    test('cannot be serialized', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throws);
    });

    test('cannot be deserialized', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throws);
    });
  });

  group('CollectionGenericValue with known specifiedType and correct builder',
      () {
    final data = new CollectionGenericValue<int>((b) => b..values.add(1));
    final specifiedType =
        const FullType(CollectionGenericValue, const [const FullType(int)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new CollectionGenericValueBuilder<int>())
          ..addBuilderFactory(
              const FullType(BuiltList, const [const FullType(int)]),
              () => new ListBuilder<int>()))
        .build();
    final serialized = [
      'values',
      [
        1,
      ],
    ];

    test('can be serialized', () {
      serializersWithBuilder.expectBuilder(
          const FullType(BuiltList, const [const FullType(int)]));
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
    final data = new CollectionGenericValue<int>((b) => b..values.add(1));
    final serialized = [
      'CollectionGenericValue',
      'values',
      [
        ['int', 1]
      ],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('loses generic type on deserialization', () {
      expect(serializers.deserialize(serialized).runtimeType.toString(),
          r'_$CollectionGenericValue<Object>');
    });
  });

  group('GenericContainer with known specifiedType', () {
    final data = new GenericContainer((b) => b
      ..genericValue.value = '1'
      ..boundGenericValue.value = 2.2
      ..collectionGenericValue.values.add('3'));
    final specifiedType =
        const FullType(GenericContainer, const [const FullType(int)]);
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              const FullType(BuiltList, const [const FullType(String)]),
              () => new ListBuilder<String>()))
        .build();
    final serialized = [
      'genericValue',
      ['value', '1'],
      'boundGenericValue',
      ['value', 2.2],
      'collectionGenericValue',
      [
        'values',
        ['3']
      ],
    ];

    test('can be serialized', () {
      serializersWithBuilder.expectBuilder(
          const FullType(BuiltList, const [const FullType(int)]));
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
    final data = new GenericContainer((b) => b
      ..genericValue.value = '1'
      ..boundGenericValue.value = 2.2
      ..collectionGenericValue.values.add('3'));
    // TODO(davidmorgan): adding this builder manually shouldn't be necessary.
    // Auto-add builders for nested generic types.
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              const FullType(BuiltList, const [const FullType(String)]),
              () => new ListBuilder<String>()))
        .build();
    final serialized = [
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
    ];

    test('can be serialized', () {
      expect(serializersWithBuilder.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializersWithBuilder.deserialize(serialized), data);
    });
  });
}
