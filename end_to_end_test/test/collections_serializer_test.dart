// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/collections.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Collections', () {
    var data = Collections((b) => b
      ..list.add(1)
      ..set.add('two')
      ..map['three'] = 4
      ..nullsInList.replace(<int?>[1, null])
      ..nullsInSet.replace(<String?>['one', null])
      ..nullsInMap.addAll({null: 1, 'two': 2})
      ..nullsInListMultimap.add(null, false)
      ..nullsInListMultimap.add(1, true)
      ..nullsInSetMultimap.add('one', null)
      ..nullsInSetMultimap.add('two', true)
      ..listMultimap.addValues(4, [true, false])
      ..setMultimap.addValues('five', [true, false])
      ..nestedNullablesList.replace(<BuiltList<int?>?>[
        null,
        BuiltList<int?>(<int?>[1, null]),
      ]));
    var serialized = json.decode(json.encode([
      'Collections',
      'list',
      [1],
      'set',
      ['two'],
      'map',
      ['three', 4],
      'listMultimap',
      [
        4,
        [true, false]
      ],
      'setMultimap',
      [
        'five',
        [true, false]
      ],
      'nullsInList',
      <int?>[1, null],
      'nullsInSet',
      <String?>['one', null],
      'nullsInMap',
      <Object?>[null, 1, 'two', 2],
      'nullsInListMultimap',
      [
        null,
        [false],
        1,
        [true],
      ],
      'nullsInSetMultimap',
      [
        'one',
        [null],
        'two',
        [true],
      ],
      'nullableInGenericsList',
      <Object>[],
      'nestedNullablesList',
      [
        null,
        [1, null],
      ],
    ])) as Object;
    var serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
              const FullType(BuiltList, [FullType.nullable(int)]),
              () => ListBuilder<int?>()))
        .build();

    test('can be serialized', () {
      expect(serializersWithBuilder.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializersWithBuilder.deserialize(serialized), data);
    });
  });
}
