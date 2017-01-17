// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/interfaces.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('HasInt', () {
    final data = new BuiltList<HasInt>([
      new ValueWithInt((b) => b
        ..anInt = 2
        ..note = 'two'),
      EnumWithInt.one,
    ]);
    final serialized = [
      'list',
      ['ValueWithInt', 'anInt', 2, 'note', 'two'],
      ['EnumWithInt', 'one'],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
