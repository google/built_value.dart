// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/polymorphism.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Cat', () {
    var data = Cat((b) => b
      ..legs = 4
      ..tail = true);
    var serialized = json.decode(json.encode([
      'Cat',
      'tail',
      true,
      'legs',
      4,
    ])) as Object;

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
    var data = Robot((b) => b
      ..legs = 4
      ..fins = 3);
    var serialized = json.decode(json.encode([
      'Robot',
      'fins',
      3,
      'legs',
      4,
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('StandardCat', () {
    var data = StandardCat((b) => b..tail = true);
    var serialized = json.decode(json.encode([
      'StandardCat',
      'tail',
      true,
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('HasField', () {
    var data = BuiltList<HasField<dynamic>>(<Object>[
      HasString((b) => b..field = 'hello'),
      HasDouble((b) => b..field = 3.14)
    ]);
    var serialized = json.decode(json.encode([
      'list',
      ['HasString', 'field', 'hello'],
      ['HasDouble', 'field', 3.14]
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('Cage', () {
    var data = Cage((b) => b
      ..inhabitant = Cat((b) => b
        ..tail = true
        ..legs = 4)
      ..otherInhabitants.add(Fish((b) => b
        ..legs = 0
        ..fins = 4)));
    var serialized = json.decode(json.encode([
      'Cage',
      'inhabitant',
      ['Cat', 'tail', true, 'legs', 4],
      'otherInhabitants',
      [
        ['Fish', 'fins', 4, 'legs', 0]
      ],
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('UsesHandCoded', () {
    var data = UsesHandCoded((b) => b..fieldInBaseBuilder = 4);
    var serialized = json.decode(json.encode([
      'UsesHandCoded',
      'fieldInBaseBuilder',
      4,
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
