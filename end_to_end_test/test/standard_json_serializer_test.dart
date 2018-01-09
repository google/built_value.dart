// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:end_to_end_test/polymorphism.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:end_to_end_test/standard_json.dart';
import 'package:test/test.dart';

void main() {
  group('StandardJsonValue', () {
    final data = new StandardJsonValue((b) => b
      ..number = 3
      ..text = 'some text'
      ..keyValues['one'] = new JsonObject(1)
      ..keyValues['two'] = new JsonObject('two')
      ..keyValues['three'] = new JsonObject(true)
      ..keyValues['four'] = new JsonObject([1, 2, 3])
      ..keyValues['five'] = new JsonObject({'one': 1, 'two': 2})
      ..zoo.add(new Cat((b) => b
        ..tail = true
        ..legs = 4)));
    final specifiedType = new FullType(StandardJsonValue);
    final serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
    final serialized = {
      'number': 3,
      'text': 'some text',
      'keyValues': {
        'one': 1,
        'two': 'two',
        'three': true,
        'four': [1, 2, 3],
        'five': {'one': 1, 'two': 2},
      },
      'zoo': [
        {r'$': 'Cat', 'tail': true, 'legs': 4}
      ],
    };

    test('can be serialized', () {
      expect(
          serializersWithPlugin.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(
          serializersWithPlugin.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });
  });

  group('StandardJsonValue with extraneous nulls', () {
    final data = new StandardJsonValue((b) => b
      ..number = 3
      ..text = 'some text'
      ..keyValues['one'] = new JsonObject(1)
      ..keyValues['two'] = new JsonObject('two')
      ..keyValues['three'] = new JsonObject(true)
      ..keyValues['four'] = new JsonObject([1, 2, 3])
      ..keyValues['five'] = new JsonObject({'one': 1, 'two': 2}));
    final specifiedType = new FullType(StandardJsonValue);
    final serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
    final serialized = {
      'number': 3,
      'text': 'some text',
      'keyValues': {
        'one': 1,
        'two': 'two',
        'three': true,
        'four': [1, 2, 3],
        'five': {'one': 1, 'two': 2},
      },
      'strings': null,
    };

    test('can be deserialized', () {
      expect(
          serializersWithPlugin.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });
  });

  group('StandardJsonValue with unknown specifiedType', () {
    final data = new StandardJsonValue((b) => b
      ..number = 3
      ..text = 'some text'
      ..keyValues['one'] = new JsonObject(1)
      ..keyValues['two'] = new JsonObject('two')
      ..keyValues['three'] = new JsonObject(true)
      ..keyValues['four'] = new JsonObject([1, 2, 3])
      ..keyValues['five'] = new JsonObject({'one': 1, 'two': 2})
      ..zoo.add(new Cat((b) => b
        ..tail = true
        ..legs = 4)));
    final serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
    final serialized = {
      r'$': 'StandardJsonValue',
      'number': 3,
      'text': 'some text',
      'keyValues': {
        'one': 1,
        'two': 'two',
        'three': true,
        'four': [1, 2, 3],
        'five': {'one': 1, 'two': 2},
      },
      'zoo': [
        {r'$': 'Cat', 'tail': true, 'legs': 4}
      ],
    };

    test('can be serialized', () {
      expect(serializersWithPlugin.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializersWithPlugin.deserialize(serialized), data);
    });
  });
}
