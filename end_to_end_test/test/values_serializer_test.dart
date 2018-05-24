// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:end_to_end_test/enums.dart';
import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:end_to_end_test/values.dart';
import 'package:fixnum/fixnum.dart';
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

    test('has good error message on deserialize with wrong primitive type', () {
      final incorrectSerialized = [
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
          'foo',
        ],
      ];
      expect(
          () => serializers.deserialize(incorrectSerialized),
          throwsA(isErrorContaining(
              "Deserializing '[CompoundValue, simpleValue, "
              "[anInt, 1, aString, two], validatedValue, [anInt...' to "
              "'unspecified' failed due to: Deserializing '[anInt, foo]' to "
              "'ValidatedValue' failed due to: Deserializing 'foo' to 'int' "
              "failed due to: type 'String' is not a subtype of type "
              "'int' in type cast")));
    });
  });

  group('CompoundValueNoNesting', () {
    final data = new CompoundValueNoNesting((b) => b
      ..simpleValue = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two')
      ..validatedValue = new ValidatedValue((b) => b.anInt = 3));
    final serialized = [
      'CompoundValueNoNesting',
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

  group('CompoundValueExplicitNoNesting', () {
    final data = new CompoundValueExplicitNoNesting((b) => b
      ..simpleValue.replace(new SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two'))
      ..validatedValue = new ValidatedValue((b) => b.anInt = 3));
    final serialized = [
      'CompoundValueExplicitNoNesting',
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
      ..int64 = Int64.MAX_VALUE
      ..dbl = 2.5
      ..number = 17.5
      ..string = 'test'
      ..dateTime = new DateTime.fromMillisecondsSinceEpoch(1000, isUtc: true)
      ..uri = Uri.parse('https://github.com/google/built_value.dart')
      ..bigInt = BigInt.parse('123456789012345678901234567890'));
    final serialized = [
      'PrimitivesValue',
      'boolean',
      true,
      'integer',
      42,
      'int64',
      '9223372036854775807',
      'dbl',
      2.5,
      'number',
      17.5,
      'string',
      'test',
      'dateTime',
      1000000,
      'uri',
      'https://github.com/google/built_value.dart',
      'bigInt',
      '123456789012345678901234567890',
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

  group('FieldDiscoveryValue', () {
    final data = new FieldDiscoveryValue((b) => b
      ..value.value.value = 1
      ..values.add(new ThirdDiscoverableValue((b) => b..value = 4)));
    final serialized = [
      'FieldDiscoveryValue',
      'value',
      [
        'value',
        ['value', 1],
      ],
      'values',
      [
        [
          'value',
          4,
        ]
      ],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('PartiallySerializableValue', () {
    final data = new PartiallySerializableValue((b) => b
      ..value = 1
      ..transientValue = 2);
    final serialized = [
      'PartiallySerializableValue',
      'value',
      1,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized),
          data.rebuild((b) => b..transientValue = null));
    });
  });

  group('WireNameValue', () {
    final data = new WireNameValue((b) => b..value = 1);
    final serialized = [
      'V',
      'v',
      1,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
