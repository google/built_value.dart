// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library;

import 'package:built_value/built_value.dart';

part 'node.g.dart';

abstract class Node implements Built<Node, NodeBuilder> {
  String? get label;

  Node? get left;

  Node? get right;

  factory Node([Function(NodeBuilder) updates]) = _$Node;
  Node._();
}
