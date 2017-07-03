// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:end_to_end_test/polymorphism.dart';
import 'package:test/test.dart';

void main() {
  group('Cat', () {
    test('can be instantiated', () {
      new Cat((b) => b
        ..legs = 4
        ..tail = true);
    });

    test('has method from mixin', () {
      expect(
          new Cat((b) => b
            ..legs = 4
            ..tail = true).canWalk,
          true);
    });
  });

  group('Fish', () {
    test('can be instantiated', () {
      new Fish((b) => b
        ..legs = 0
        ..fins = 2);
    });

    test('has method from mixin', () {
      expect(
          new Fish((b) => b
            ..legs = 0
            ..fins = 2).canWalk,
          false);
    });

    test('has method from second mixin', () {
      expect(
          new Fish((b) => b
            ..legs = 0
            ..fins = 2).canSwim,
          true);
    });
  });

  group('Animal', () {
    test('can be used as an interface, including builder', () {
      final animals = [
        new Cat((b) => b
          ..legs = 4
          ..tail = true),
        new Fish((b) => b
          ..legs = 0
          ..fins = 2),
      ];

      final modifiedAnimals =
          animals.map((animal) => animal.rebuild((b) => b.legs++)).toList();

      final expectedAnimals = [
        new Cat((b) => b
          ..legs = 5
          ..tail = true),
        new Fish((b) => b
          ..legs = 1
          ..fins = 2),
      ];

      expect(modifiedAnimals, expectedAnimals);
    });
  });
}
