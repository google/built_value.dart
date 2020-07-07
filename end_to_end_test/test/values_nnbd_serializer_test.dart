// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/serializers_nnbd.dart';
import 'package:end_to_end_test/values_nnbd.dart';
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
}
