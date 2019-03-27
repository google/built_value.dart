// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:benchmark/node.dart';
import 'package:benchmark/simple_value.dart';

void benchmark() {
  benchmarkHashCode();
  benchmarkNestedRebuilds();
}

void benchmarkHashCode() {
  final value = SimpleValue((b) => b
    ..anInt = 0
    ..aString = 'zero');
  _benchmark('hashCode', () => value.hashCode);
}

void benchmarkNestedRebuilds() {
  for (var depth = 0; depth != 10; ++depth) {
    final value = Node((b) => _buildNested(b, depth));

    _benchmark('nested rebuild $depth', () {
      final topBuilder = value.toBuilder();
      var leafBuilder = topBuilder;
      for (int i = 0; i != depth; ++i) {
        leafBuilder = leafBuilder.left;
      }
      leafBuilder.label = 'updatedLeaf';
      topBuilder.build();
    });
  }
}

void _buildNested(NodeBuilder nodeBuilder, int depth) {
  if (depth == 0) {
    nodeBuilder.label = 'leaf';
  } else {
    _buildNested(nodeBuilder.left, depth - 1);
    _buildNested(nodeBuilder.right, depth - 1);
  }
}

void _benchmark(String name, function()) {
  // Warm up.
  for (var i = 0; i != 1000; ++i) {
    function();
  }

  // Time.
  for (int i = 0; i != 3; ++i) {
    final stopwatch = Stopwatch()..start();
    final reps = 10000000;
    for (var i = 0; i != reps; ++i) {
      function();
    }
    final perSecond =
        (reps / (stopwatch.elapsedMicroseconds / 1000000.0)).round();
    print('$name: $perSecond/s');
  }
}
