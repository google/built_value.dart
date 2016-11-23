// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// TODO(davidmorgan): fix deserialization for @nullable nested builder.
// https://github.com/google/built_json.dart/issues/40
void main() {}

/*
import 'package:example/compound_value.dart';
import 'package:example/serializers.dart';
import 'package:example/validated_value.dart';
import 'package:test/test.dart';

void main() {
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
}
*/
