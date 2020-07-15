// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:end_to_end_test/polymorphism_nnbd.dart';
import 'package:end_to_end_test/serializers_nnbd.dart';
import 'package:end_to_end_test/standard_json_nnbd.dart';
import 'package:test/test.dart';

void main() {
  group('StandardJsonValue', () {
    var data = StandardJsonValue((b) => b
      ..number = 3
      ..text = 'some text'
      ..keyValues['one'] = JsonObject(1)
      ..keyValues['two'] = JsonObject('two')
      ..keyValues['three'] = JsonObject(true)
      ..keyValues['four'] = JsonObject([1, 2, 3])
      ..keyValues['five'] = JsonObject({'one': 1, 'two': 2})
      ..zoo.add(Cat((b) => b
        ..tail = true
        ..legs = 4))
      ..uniqueZoo.add(Cat((b) => b
        ..tail = false
        ..legs = 3)));
    var specifiedType = FullType(StandardJsonValue);
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = {
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
      'uniqueZoo': [
        {r'$': 'Cat', 'tail': false, 'legs': 3}
      ],
    };

    test('can be serialized', () {
      expect(
          serializersWithPlugin.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('serializes to Map<String, Object>', () {
      expect(
          serializersWithPlugin
              .serialize(data, specifiedType: specifiedType)
              .runtimeType,
          <String, Object>{}.runtimeType);
    });

    test('can be deserialized', () {
      expect(
          serializersWithPlugin.deserialize(serialized,
              specifiedType: specifiedType),
          data);
    });
  });

  group('StandardJsonValue with extraneous nulls', () {
    var data = StandardJsonValue((b) => b
      ..number = 3
      ..text = 'some text'
      ..keyValues['one'] = JsonObject(1)
      ..keyValues['two'] = JsonObject('two')
      ..keyValues['three'] = JsonObject(true)
      ..keyValues['four'] = JsonObject([1, 2, 3])
      ..keyValues['five'] = JsonObject({'one': 1, 'two': 2}));
    var specifiedType = FullType(StandardJsonValue);
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = {
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
    var data = StandardJsonValue((b) => b
      ..number = 3
      ..text = 'some text'
      ..keyValues['one'] = JsonObject(1)
      ..keyValues['two'] = JsonObject('two')
      ..keyValues['three'] = JsonObject(true)
      ..keyValues['four'] = JsonObject([1, 2, 3])
      ..keyValues['five'] = JsonObject({'one': 1, 'two': 2})
      ..zoo.add(Cat((b) => b
        ..tail = true
        ..legs = 4)));
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = {
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
      'uniqueZoo': <Object>[],
    };

    test('can be serialized', () {
      expect(serializersWithPlugin.serialize(data), serialized);
    });

    test('serializes to Map<String, Object>', () {
      expect(serializersWithPlugin.serialize(data).runtimeType,
          <String, Object>{}.runtimeType);
    });

    test('can be deserialized', () {
      expect(serializersWithPlugin.deserialize(serialized), data);
    });
  });
}
