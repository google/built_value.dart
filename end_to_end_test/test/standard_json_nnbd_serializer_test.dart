// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'dart:convert';

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
      ..value.primitive = 4
      ..value.nullablePrimitive = 5
      ..value.value.anInt = 6
      ..value.nullableValue.anInt = 7
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
        ..legs = 3))
      ..nullsInList.replace(<Object?>[null, 3])
      ..nullsInSet.replace(<Object?>['three', null])
      ..nullsInMap['four'] = null
      ..nullsInMap['five'] = 5
      ..object = ComplexValue((b) => b
        ..primitive = 6
        ..value.anInt = 7)
      ..objects.add(ComplexValue((b) => b
        ..primitive = 8
        ..value.anInt = 9)));
    var specifiedType = FullType(StandardJsonValue);
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = json.decode(json.encode({
      'number': 3,
      'text': 'some text',
      'value': {
        'primitive': 4,
        'nullablePrimitive': 5,
        'value': {'anInt': 6},
        'nullableValue': {'anInt': 7}
      },
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
      'nullsInList': <Object?>[null, 3],
      'nullsInSet': <Object?>['three', null],
      'nullsInMap': {'four': null, 'five': 5},
      'object': {
        r'$': 'ComplexValue',
        'primitive': 6,
        'value': {'anInt': 7}
      },
      'objects': <Object>[
        {
          r'$': 'ComplexValue',
          'primitive': 8,
          'value': {'anInt': 9}
        }
      ],
    })) as Object;

    test('can be serialized', () {
      expect(
          serializersWithPlugin.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('serializes to Map<String, Object>>', () {
      expect(
          serializersWithPlugin
              .serialize(data, specifiedType: specifiedType)
              .runtimeType,
          <String, Object?>{}.runtimeType);
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
      ..value.primitive = 4
      ..value.value.anInt = 5
      ..keyValues['one'] = JsonObject(1)
      ..keyValues['two'] = JsonObject('two')
      ..keyValues['three'] = JsonObject(true)
      ..keyValues['four'] = JsonObject([1, 2, 3])
      ..keyValues['five'] = JsonObject({'one': 1, 'two': 2}));
    var specifiedType = FullType(StandardJsonValue);
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = json.decode(json.encode({
      'number': 3,
      'text': 'some text',
      'value': {
        'primitive': 4,
        'value': {'anInt': 5}
      },
      'keyValues': {
        'one': 1,
        'two': 'two',
        'three': true,
        'four': [1, 2, 3],
        'five': {'one': 1, 'two': 2},
      },
      'strings': null,
    })) as Object;

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
      ..value.primitive = 4
      ..value.nullablePrimitive = 5
      ..value.value.anInt = 6
      ..value.nullableValue.anInt = 7
      ..keyValues['one'] = JsonObject(1)
      ..keyValues['two'] = JsonObject('two')
      ..keyValues['three'] = JsonObject(true)
      ..keyValues['four'] = JsonObject([1, 2, 3])
      ..keyValues['five'] = JsonObject({'one': 1, 'two': 2})
      ..zoo.add(Cat((b) => b
        ..tail = true
        ..legs = 4))
      ..nullsInList.replace(<Object?>[null, 3])
      ..nullsInSet.replace(<Object?>['three', null])
      ..nullsInMap['four'] = null
      ..nullsInMap['five'] = 5
      ..object = ComplexValue((b) => b
        ..primitive = 6
        ..value.anInt = 7)
      ..objects.add(ComplexValue((b) => b
        ..primitive = 8
        ..value.anInt = 9)));
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = {
      r'$': 'StandardJsonValue',
      'number': 3,
      'text': 'some text',
      'value': {
        'primitive': 4,
        'nullablePrimitive': 5,
        'value': {'anInt': 6},
        'nullableValue': {'anInt': 7}
      },
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
      'nullsInList': <Object?>[null, 3],
      'nullsInSet': <Object?>['three', null],
      'nullsInMap': {'four': null, 'five': 5},
      'object': {
        r'$': 'ComplexValue',
        'primitive': 6,
        'value': {'anInt': 7}
      },
      'objects': <Object>[
        {
          r'$': 'ComplexValue',
          'primitive': 8,
          'value': {'anInt': 9}
        }
      ],
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
