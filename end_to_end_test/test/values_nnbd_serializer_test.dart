// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:end_to_end_test/enums_nnbd.dart';
import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/serializers_nnbd.dart';
import 'package:end_to_end_test/values_nnbd.dart';
import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleValue', () {
    var data = SimpleValue((b) => b
      ..anInt = 1
      ..aString = 'two'
      ..$mustBeEscaped = true);
    var serialized = [
      'SimpleValue',
      'anInt',
      1,
      'aString',
      'two',
      '\$mustBeEscaped',
      true,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('CompoundValue', () {
    var data = CompoundValue((b) => b
      ..simpleValue.anInt = 1
      ..simpleValue.aString = 'two'
      ..validatedValue = ValidatedValue((b) => b.anInt = 3).toBuilder());
    var serialized = [
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
    var data = CompoundValueNoNesting((b) => b
      ..simpleValue = SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two')
      ..validatedValue = ValidatedValue((b) => b.anInt = 3));
    var serialized = [
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

  group('CompoundValueNoAutoNesting', () {
    var data =
        CompoundValueNoAutoNesting((b) => b..value = NoFieldsValueBuilder());
    var serialized = [
      'CompoundValueNoAutoNesting',
      'value',
      <String>[],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('CompoundValueExplicitNoNesting', () {
    var data = CompoundValueExplicitNoNesting((b) => b
      ..simpleValue.replace(SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two'))
      ..validatedValue = ValidatedValue((b) => b.anInt = 3));
    var serialized = [
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
    var data = CompoundValue((b) => b
      ..simpleValue.anInt = 1
      ..simpleValue.aString = 'two'
      ..validatedValue = ValidatedValue((b) => b.anInt = 3).toBuilder());
    var specifiedType = const FullType(CompoundValue);
    var serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    var serialized = {
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
    var data = ValueUsingImportAs((b) => b.value = TestEnum.yes);
    var serialized = [
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
    var data = PrimitivesValue((b) => b
      ..boolean = true
      ..integer = 42
      ..int64 = Int64.MAX_VALUE
      ..dbl = 2.5
      ..number = 17.5
      ..string = 'test'
      ..dateTime = DateTime.fromMillisecondsSinceEpoch(1000, isUtc: true)
      ..duration = Duration(microseconds: 12345)
      ..regExp = RegExp(r'\w+@\d+')
      ..uri = Uri.parse('https://github.com/google/built_value.dart')
      ..bigInt = BigInt.parse('123456789012345678901234567890'));
    var serialized = [
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
      'duration',
      12345,
      'regExp',
      r'\w+@\d+',
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
    var data = NamedFactoryValue(3);
    var serialized = ['NamedFactoryValue', 'value', 3];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('FieldDiscoveryValue', () {
    var data = FieldDiscoveryValue((b) => b
      ..value.value.value = 1
      ..values.add(ThirdDiscoverableValue((b) => b..value = 4)));
    var serialized = [
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
    var data = PartiallySerializableValue((b) => b
      ..value = 1
      ..transientValue = 2);
    var serialized = [
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
    var data = WireNameValue((b) => b..value = 1);
    var serialized = [
      r'$V',
      r'$v',
      1,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('ValueWithCustomSerializer', () {
    var data = ValueWithCustomSerializer((b) => b..value = 1);
    var serialized = ['ValueWithCustomSerializer', 1];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('OtherValue', () {
    var data = OtherValue((b) => b..other = 1);
    var serialized = ['OtherValue', 'other', 1];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('ValuesWithBuilderInitializer', () {
    var data = ValueWithBuilderInitializer((b) => b
      ..anInt = 1
      ..nestedValue.anInt = 2);
    var serialized = [
      'ValueWithBuilderInitializer',
      'anInt',
      1,
      'anIntWithDefault',
      7,
      'nestedValue',
      ['anInt', 2],
      'nestedValueWithDefault',
      ['anInt', 9],
      'nullableIntWithDefault',
      8,
      'nullableNestedValueWithDefault',
      ['anInt', 10],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('adds defaults for missing fields on deserialization', () {
      var serializedWithoutDefaults = [
        'ValueWithBuilderInitializer',
        'anInt',
        1,
        'nestedValue',
        ['anInt', 2],
      ];
      expect(serializers.deserialize(serializedWithoutDefaults), data);
    });
  });

  group('ValueWithBuilderFinalizer', () {
    var data = ValueWithBuilderFinalizer((b) => b..anInt = 1);
    var serialized = ['ValueWithBuilderFinalizer', 'anInt', 1];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('runs hook on deserialize', () {
      var serializedWhichTriggersHook = [
        'ValueWithBuilderFinalizer', 'anInt',
        // Hook will change 0 to 1.
        0,
      ];
      expect(serializers.deserialize(serializedWhichTriggersHook), data);
    });
  });
}
