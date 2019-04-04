// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  var serializers = Serializers();

  group('JsonObject with known specifiedType holding bool', () {
    var data = JsonObject(true);
    var serialized = true;
    var specifiedType = const FullType(JsonObject);

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
    var data = JsonObject(true);
    var serialized = ['JsonObject', true];
    var specifiedType = FullType.unspecified;

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
    var data = JsonObject(42.5);
    var serialized = 42.5;
    var specifiedType = const FullType(JsonObject);

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
    var data = JsonObject(42.5);
    var serialized = ['JsonObject', 42.5];
    var specifiedType = FullType.unspecified;

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
    var data = JsonObject([1, 2, 3]);
    var serialized = [1, 2, 3];
    var specifiedType = const FullType(JsonObject);

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
    var data = JsonObject([1, 2, 3]);
    var serialized = [
      'JsonObject',
      [1, 2, 3],
    ];
    var specifiedType = FullType.unspecified;

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
    var data = JsonObject({'one': 1, 'two': 2, 'three': 3});
    var serialized = {'one': 1, 'two': 2, 'three': 3};
    var specifiedType = const FullType(JsonObject);

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
    var data = JsonObject({'one': 1, 'two': 2, 'three': 3});
    var serialized = [
      'JsonObject',
      {'one': 1, 'two': 2, 'three': 3},
    ];
    var specifiedType = FullType.unspecified;

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
    var data = JsonObject(42);
    var serialized = 42;
    var specifiedType = const FullType(JsonObject);

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
    var data = JsonObject(42);
    var serialized = ['JsonObject', 42];
    var specifiedType = FullType.unspecified;

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
    var data = JsonObject('test');
    var serialized = 'test';
    var specifiedType = const FullType(JsonObject);

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
    var data = JsonObject('test');
    var serialized = ['JsonObject', 'test'];
    var specifiedType = FullType.unspecified;

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
