// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.

// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// TODO(davidmorgan): support serializing multimaps.
void main() {}

/*
import 'package:example/collections.dart';
import 'package:example/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Collections', () {
    final data = new Collections((b) => b
      ..list.add(1)
      ..set.add('two')
      ..map['three'] = 4);
    final serialized = [
      'Collections',
      'list',
      [1],
      'set',
      ['two'],
      'map',
      ['three', 4],
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
