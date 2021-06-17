// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/polymorphism_nnbd.dart';
import 'package:test/test.dart';

void main() {
  group('Cat', () {
    test('can be instantiated', () {
      Cat((b) => b
        ..legs = 4
        ..tail = true);
    });

    test('has method from mixin', () {
      expect(
          Cat((b) => b
            ..legs = 4
            ..tail = true).canWalk,
          true);
    });
  });

  group('Fish', () {
    test('can be instantiated', () {
      Fish((b) => b
        ..legs = 0
        ..fins = 2);
    });

    test('has method from mixin', () {
      expect(
          Fish((b) => b
            ..legs = 0
            ..fins = 2).canWalk,
          false);
    });

    test('has method from second mixin', () {
      expect(
          Fish((b) => b
            ..legs = 0
            ..fins = 2).canSwim,
          true);
    });
  });

  group('Robot', () {
    test('can be instantiated', () {
      Robot((b) => b
        ..legs = 0
        ..fins = 2);
    });

    test('has method from mixin', () {
      expect(
          Robot((b) => b
            ..legs = 0
            ..fins = 2).canWalk,
          false);
    });

    test('has method from second mixin', () {
      expect(
          Robot((b) => b
            ..legs = 0
            ..fins = 2).canSwim,
          true);
    });
  });

  group('Animal', () {
    test('can be used as an interface, including builder', () {
      final animals = [
        Cat((b) => b
          ..legs = 4
          ..tail = true),
        Fish((b) => b
          ..legs = 0
          ..fins = 2),
      ];

      final modifiedAnimals = animals
          .map((animal) => animal.rebuild((b) => b.legs = b.legs! + 1))
          .toList();

      final expectedAnimals = [
        Cat((b) => b
          ..legs = 5
          ..tail = true),
        Fish((b) => b
          ..legs = 1
          ..fins = 2),
      ];

      expect(modifiedAnimals, expectedAnimals);
    });
  });

  group('Cage', () {
    test('holds any animal; does not try to use the abstract builder', () {
      Cage((b) => b.inhabitant = Cat((b) => b
        ..legs = 4
        ..tail = true));
    });
  });

  group('StandardCat', () {
    test('uses legs field from mixin', () {
      expect(StandardCat((b) => b..tail = true).legs, 4);
    });
  });

  group('HasField', () {
    test('can be used as an interface, including builder', () {
      final hasFields = <HasField<dynamic>>[
        HasString((b) => b..field = 'hello'),
        HasDouble((b) => b..field = 3.14)
      ];

      final modifiedHasFields = hasFields
          .map((hasField) => hasField.rebuild((b) => b..field += b.field));

      final expectedHasFields = [
        HasString((b) => b..field = 'hellohello'),
        HasDouble((b) => b..field = 6.28)
      ];

      expect(modifiedHasFields, expectedHasFields);
    });
  });

  group('UsesHandCoded', () {
    test('can be instantiated', () {
      UsesHandCoded((b) => b..fieldInBaseBuilder = 3);
    });

    test('can be updated via base interface', () {
      final HandCoded handCoded =
          UsesHandCoded((b) => b..fieldInBaseBuilder = 3);
      final updatedHandCoded =
          handCoded.rebuild((b) => b..fieldInBaseBuilder = 4);
      expect(updatedHandCoded.fieldInBaseBuilder, 4);
    });
  });

  group(Vehicle, () {
    test('nested builder getter is not nullable', () {
      // This is purely a static check, the function isn't actually called.
      // Access `b.color` without `!` to ensure the getter is not nullable.
      (Vehicle vehicle) {
        return vehicle.rebuild((b) => b.color.replace(VehicleColor()));
      };
    });
  });

  group(NotInstantiableNotNested, () {
    test('does not nest builders', () {
      // This is purely a static check, the function isn't actually called.
      // Check that the builder field is not a nested builder.
      (NotInstantiableNotNested value) =>
          value.rebuild((b) => b..list = BuiltList());
    });
  });
}
