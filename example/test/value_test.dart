// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/value.dart';
import 'package:test/test.dart';

void main() {
  group('value', () {
    test('can be instantiated', () {
      new Value((b) => b
        ..anInt = 0
        ..aString = '');
    });

    test('has defaults', () {
      expect(new Value((b) => b
        ..anInt = 0
        ..aString = '').aDefaultInt, 7);
    });

    test('throws on null for non-nullable fields', () {
      expect(() => new Value(), throws);
    });

    test('throws on wrong type assign', () {
      expect(() => new Value((b) => b
        ..anInt = '0'
        ..aString = ''), throws);
    });

    test('nullable fields default to null', () {
      final value = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value.anObject, isNull);
    });

    test('fields can be set via build constructor', () {
      final value = new Value((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..anObject = 3);
      expect(value.anInt, 1);
      expect(value.aString, 'two');
      expect(value.anObject, 3);
    });

    test('fields can be updated via rebuild method', () {
      final value = new Value((b) => b
        ..anInt = 0
        ..aString = '').rebuild((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..anObject = 3);
      expect(value.anInt, 1);
      expect(value.aString, 'two');
      expect(value.anObject, 3);
    });

    test('builder can be instantiated', () {
      new ValueBuilder();
    });

    test('collections can be updated using builder', () {
      final value = new Value((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..listOfInt.update((b) => b
          ..addAll([3, 2, 1])
          ..sort()));
      expect(value.listOfInt, [1, 2, 3]);
    });

    test('compares equal when equal', () {
      final value1 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1, value2);
    });

    test('compares not equal when not equal', () {
      final value1 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new Value((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1, isNot(equals(value2)));
    });

    test('hashes equal when equal', () {
      final value1 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      expect(value1.hashCode, value2.hashCode);
    });

    test('hashes not equal when not equal', () {
      final value1 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      final value2 = new Value((b) => b
        ..anInt = 1
        ..aString = '');
      expect(value1.hashCode, isNot(equals(value2.hashCode)));
    });

    test('has toString', () {
      final value1 = new Value((b) => b
        ..anInt = 0
        ..aString = '');
      expect(
          value1.toString(),
          '''Value {anInt=0
aString=
anObject=null
aDefaultInt=7
listOfInt=[]
}''');
    });
  });
}
