// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/interfaces.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('HasInt', () {
    var data = BuiltList.of([
      ValueWithHasInt((b) => b.hasInt = ValueWithInt((b) => b
        ..anInt = 2
        ..note = 'two')),
      ValueWithHasInt((b) => b.hasInt = EnumWithInt.one),
    ]);
    var serialized = json.decode(json.encode([
      'list',
      [
        'ValueWithHasInt',
        'hasInt',
        ['ValueWithInt', 'anInt', 2, 'note', 'two']
      ],
      [
        'ValueWithHasInt',
        'hasInt',
        ['EnumWithInt', 'one']
      ],
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
