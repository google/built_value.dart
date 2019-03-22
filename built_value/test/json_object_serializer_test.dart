// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  final serializers = Serializers();

  group('JsonObject with known specifiedType holding bool', () {
    final data = JsonObject(true);
    final serialized = true;
    final specifiedType = const FullType(JsonObject);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with unknown specifiedType holding bool', () {
    final data = JsonObject(true);
    final serialized = ['JsonObject', true];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with known specifiedType holding double', () {
    final data = JsonObject(42.5);
    final serialized = 42.5;
    final specifiedType = const FullType(JsonObject);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with unknown specifiedType holding double', () {
    final data = JsonObject(42.5);
    final serialized = ['JsonObject', 42.5];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with known specifiedType holding list', () {
    final data = JsonObject([1, 2, 3]);
    final serialized = [1, 2, 3];
    final specifiedType = const FullType(JsonObject);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with unknown specifiedType holding list', () {
    final data = JsonObject([1, 2, 3]);
    final serialized = [
      'JsonObject',
      [1, 2, 3],
    ];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with known specifiedType holding map', () {
    final data = JsonObject({'one': 1, 'two': 2, 'three': 3});
    final serialized = {'one': 1, 'two': 2, 'three': 3};
    final specifiedType = const FullType(JsonObject);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with unknown specifiedType holding map', () {
    final data = JsonObject({'one': 1, 'two': 2, 'three': 3});
    final serialized = [
      'JsonObject',
      {'one': 1, 'two': 2, 'three': 3},
    ];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with known specifiedType holding int', () {
    final data = JsonObject(42);
    final serialized = 42;
    final specifiedType = const FullType(JsonObject);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with unknown specifiedType holding int', () {
    final data = JsonObject(42);
    final serialized = ['JsonObject', 42];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with known specifiedType holding String', () {
    final data = JsonObject('test');
    final serialized = 'test';
    final specifiedType = const FullType(JsonObject);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('JsonObject with unknown specifiedType holding String', () {
    final data = JsonObject('test');
    final serialized = ['JsonObject', 'test'];
    final specifiedType = FullType.unspecified;

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
