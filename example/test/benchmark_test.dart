// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/simple_value.dart';
import 'package:test/test.dart';

void main() {
  group('benchmark SimpleValue', () {
    test('hashCode', () {
      final value = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = 'zero');
      benchmark('hashCode', () => value.hashCode);
    });
  });
}

void benchmark(String name, function()) {
  // Warm up.
  for (var i = 0; i != 1000; ++i) {
    function();
  }

  // Time.
  for (int i = 0; i != 3; ++i) {
    final stopwatch = new Stopwatch()..start();
    final reps = 10000000;
    for (var i = 0; i != reps; ++i) {
      function();
    }
    final perSecond =
        (reps / (stopwatch.elapsedMicroseconds / 1000000.0)).round();
    print('$name: $perSecond/s');
  }
}
