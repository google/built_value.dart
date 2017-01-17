// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:end_to_end_test/collections.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Collections', () {
    final data = new Collections((b) => b
      ..list.add(1)
      ..set.add('two')
      ..map['three'] = 4
      ..listMultimap.addValues(4, [true, false])
      ..setMultimap.addValues('five', [true, false]));
    final serialized = [
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
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
