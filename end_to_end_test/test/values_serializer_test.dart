// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:end_to_end_test/enums.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:end_to_end_test/values.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleValue', () {
    final data = new SimpleValue((b) => b
      ..anInt = 1
      ..aString = 'two');
    final serialized = [
      'SimpleValue',
      'anInt',
      1,
      'aString',
      'two',
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('CompoundValue', () {
    final data = new CompoundValue((b) => b
      ..simpleValue.anInt = 1
      ..simpleValue.aString = 'two'
      ..validatedValue = new ValidatedValue((b) => b.anInt = 3).toBuilder());
    final serialized = [
      'CompoundValue',
      'simpleValue',
      [
        'anInt',
        1,
        'aString',
        'two',
      ],
      'validatedValue',
      [
        'anInt',
        3,
      ],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('CompoundValue using StandardJsonPlugin', () {
    final data = new CompoundValue((b) => b
      ..simpleValue.anInt = 1
      ..simpleValue.aString = 'two'
      ..validatedValue = new ValidatedValue((b) => b.anInt = 3).toBuilder());
    final specifiedType = const FullType(CompoundValue);
    final serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
    final serialized = {
      'simpleValue': {
        'anInt': 1,
        'aString': 'two',
      },
      'validatedValue': {
        'anInt': 3,
      },
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

  group('ValueUsingImportAs', () {
    final data = new ValueUsingImportAs((b) => b.value = TestEnum.yes);
    final serialized = [
      'ValueUsingImportAs',
      'value',
      'yes',
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('PrimitivesValue', () {
    final data = new PrimitivesValue((b) => b
      ..boolean = true
      ..integer = 42
      ..dbl = 2.5
      ..number = 17.5
      ..string = 'test'
      ..dateTime = new DateTime.fromMillisecondsSinceEpoch(1000, isUtc: true));
    final serialized = [
      'PrimitivesValue',
      'boolean',
      true,
      'integer',
      42,
      'dbl',
      2.5,
      'number',
      17.5,
      'string',
      'test',
      'dateTime',
      1000,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('NamedFactoryValue', () {
    final data = new NamedFactoryValue(3);
    final serialized = ['NamedFactoryValue', 'value', 3];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
