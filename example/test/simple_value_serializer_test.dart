// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.

// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/serializers.dart';
import 'package:example/simple_value.dart';
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
}
