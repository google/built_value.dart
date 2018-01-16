// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/polymorphism.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Cat', () {
    final data = new Cat((b) => b
      ..legs = 4
      ..tail = true);
    final serialized = [
      'Cat',
      'tail',
      true,
      'legs',
      4,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });

    test('can be serialized by moreSerializers', () {
      expect(moreSerializers.serialize(data), serialized);
    });

    test('can be deserialized by moreSerializers', () {
      expect(moreSerializers.deserialize(serialized), data);
    });
  });

  group('Robot', () {
    final data = new Robot((b) => b
      ..legs = 4
      ..fins = 3);
    final serialized = [
      'Robot',
      'fins',
      3,
      'legs',
      4,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('StandardCat', () {
    final data = new StandardCat((b) => b..tail = true);
    final serialized = [
      'StandardCat',
      'tail',
      true,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('HasField', () {
    final data = new BuiltList<HasField<dynamic>>([
      new HasString((b) => b..field = 'hello'),
      new HasDouble((b) => b..field = 3.14)
    ]);
    final serialized = [
      'list',
      ['HasString', 'field', 'hello'],
      ['HasDouble', 'field', 3.14]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('Cage', () {
    final data = new Cage((b) => b
      ..inhabitant = new Cat((b) => b
        ..tail = true
        ..legs = 4)
      ..otherInhabitants.add(new Fish((b) => b
        ..legs = 0
        ..fins = 4)));
    final serialized = [
      'Cage',
      'inhabitant',
      ['Cat', 'tail', true, 'legs', 4],
      'otherInhabitants',
      [
        ['Fish', 'fins', 4, 'legs', 0]
      ],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('UsesHandCoded', () {
    final data = new UsesHandCoded((b) => b..fieldInBaseBuilder = 4);
    final serialized = [
      'UsesHandCoded',
      'fieldInBaseBuilder',
      4,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
