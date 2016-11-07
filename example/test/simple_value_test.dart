// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/simple_value.dart';
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleValue', () {
    test('can be instantiated', () {
      new SimpleValue((b) => b..anInt = 0);
    });

    test('throws on null for non-nullable fields on build', () {
      expect(() => new SimpleValue(), throws);
    });

    test('throws on wrong type assign', () {
      expect(() => new SimpleValue((b) => b..anInt = '0'), throws);
    });

    test('fields can be set via build constructor', () {
      final value = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = 'two');
      expect(value.anInt, 1);
      expect(value.aString, 'two');
    });

    test('fields can be updated via rebuild method', () {
      final value = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '').rebuild((b) => b
        ..anInt = 1
        ..aString = 'two');
      expect(value.anInt, 1);
      expect(value.aString, 'two');
    });

    test('builder can be instantiated', () {
      new SimpleValueBuilder();
    });

    test('compares equal when equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1, value2);
    });

    test('compares not equal when not equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1, isNot(equals(value2)));
    });

    test('hash matches quiver hash', () {
      final value = new SimpleValue((b) => b
        ..anInt = 73
        ..aString = 'seventythree');
      expect(value.hashCode, hashObjects([value.anInt, value.aString]));
    });

    test('hashes equal when equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1.hashCode, value2.hashCode);
    });

    test('hashes not equal when not equal', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new SimpleValue((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1.hashCode, isNot(equals(value2.hashCode)));
    });

    test('has toString', () {
      final value1 = new SimpleValue((b) => b
        ..anInt = 0
        ..aString = '');
      expect(
          value1.toString(),
          '''SimpleValue {anInt=0,
aString=,
}''');
    });
  });
}
