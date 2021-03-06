// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:benchmark/node.dart';
import 'package:test/test.dart';

void main() {
  group('Node', () {
    test('can be instantiated', () {
      Node();
    });

    test('label can be updated', () {
      final node = Node((b) => b.label = 'updated');
      expect(node.label, 'updated');
    });

    test('label update does not affect original', () {
      final node = Node();
      node.rebuild((b) => b.label = 'updated');
      expect(node.label, isNull);
    });

    test('builder use after build does not affect original', () {
      final builder = NodeBuilder();
      final node = builder.build();
      builder.label = 'updated';
      expect(node.label, isNull);
    });

    test('nested label can be updated', () {
      final node = Node((b) => b.left.label = 'updated');
      expect(node.left!.label, 'updated');
    });

    test('nested label update does not affect original', () {
      final node = Node();
      node.rebuild((b) => b.left.label = 'updated');
      expect(node.left, null);
    });

    test('nested builder use after build does not affect original', () {
      final builder = NodeBuilder();
      final nestedBuilder = builder.left;
      nestedBuilder.label = 'leaf';
      final node = builder.build();
      nestedBuilder.label = 'updated';
      expect(node.left!.label, 'leaf');
    });

    test('doubly nested label can be updated', () {
      final node = Node((b) => b.left.left.label = 'updated');
      expect(node.left!.left!.label, 'updated');
    });

    test('doubly nested label update does not affect original', () {
      final node = Node();
      node.rebuild((b) => b.left.left.label = 'updated');
      expect(node.left, null);
    });

    test('doubly nested builder use after build does not affect original', () {
      final builder = NodeBuilder();
      final nestedBuilder = builder.left.left;
      nestedBuilder.label = 'leaf';
      final node = builder.build();
      nestedBuilder.label = 'updated';
      expect(node.left!.left!.label, 'leaf');
    });

    test('structure can be created', () {
      final node = Node((b) => b
        ..left.left.label = 'one'
        ..left.right.left.label = 'two'
        ..right.right.right.label = 'three');
      expect(node.left!.left!.label, 'one');
      expect(node.left!.right!.left!.label, 'two');
      expect(node.right!.right!.right!.label, 'three');
    });

    test('derived structure can be created without affecting original', () {
      final node = Node((b) => b
        ..left.left.label = 'one'
        ..left.right.left.label = 'two'
        ..right.right.right.label = 'three');

      final updatedNode = node.rebuild((b) => b
        ..left.left.label = '1'
        ..left.right.left.label = '2'
        ..right.right.right.right.label = 'below 3');

      // Original is unchanged.
      expect(node.left!.left!.label, 'one');
      expect(node.left!.right!.left!.label, 'two');
      expect(node.right!.right!.right!.label, 'three');

      // Derived structure is correct.
      expect(updatedNode.left!.left!.label, '1');
      expect(updatedNode.left!.right!.left!.label, '2');
      expect(updatedNode.right!.right!.right!.label, 'three');
      expect(updatedNode.right!.right!.right!.right!.label, 'below 3');
    });

    test('supports setting builders to null to clear', () {
      final node = Node((b) => b..left.left.label = 'leaf');
      final updatedNode = node.rebuild((b) => b..left = null);
      expect(updatedNode.left, null);
    });

    test(
        'derived structure including deletes can be created without affecting '
        'original', () {
      final node = Node((b) => b
        ..left.left.label = 'one'
        ..left.right.left.label = 'two'
        ..right.right.right.label = 'three');

      final updatedNode = node.rebuild((b) => b
        ..left.left.label = '1'
        ..left.right.left = null);

      // Original is unchanged.
      expect(node.left!.left!.label, 'one');
      expect(node.left!.right!.left!.label, 'two');
      expect(node.right!.right!.right!.label, 'three');

      // Derived structure is correct.
      expect(updatedNode.left!.left!.label, '1');
      expect(updatedNode.left!.right!.left, null);
      expect(updatedNode.right!.right!.right!.label, 'three');
    });
  });
}
