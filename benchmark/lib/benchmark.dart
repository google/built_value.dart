// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:benchmark/node.dart';
import 'package:benchmark/simple_value.dart';

void benchmark() {
  benchmarkHashCode();
  benchmarkNestedRebuilds();
  benchmarkDeserialization();
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
      for (var i = 0; i != depth; ++i) {
        leafBuilder = leafBuilder.left;
      }
      leafBuilder.label = 'updatedLeaf';
      topBuilder.build();
    });
  }
}

void benchmarkDeserialization() {
  for (var depth = 0; depth <= 3; ++depth) {
    final value = Node((b) => _buildNested(b, depth));
    final serialized = json.decode(json.encode(serializers.serialize(value)));
    _benchmark('nested deserialization $depth', () {
      return serializers.deserialize(serialized);
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

void _benchmark(String name, Function() function) {
  // Warm up.
  for (var i = 0; i != 1000; ++i) {
    function();
  }

  // Time.
  for (var i = 0; i != 3; ++i) {
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
