// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/records.dart';
import 'package:test/test.dart';

void main() {
  group(SimpleRecordValue, () {
    test('can be instantiated', () {
      SimpleRecordValue((b) => b..record = (0, 0));
    });

    test('compares equal when equal', () {
      final value1 = SimpleRecordValue((b) => b..record = (0, 0));
      final value2 = SimpleRecordValue((b) => b..record = (0, 0));
      expect(value1, value2);
    });

    test('compares not equal when not equal', () {
      final value1 = SimpleRecordValue((b) => b..record = (0, 0));
      final value2 = SimpleRecordValue((b) => b..record = (0, 1));
      expect(value1, isNot(equals(value2)));
    });

    test('hashes equal when equal', () {
      final value1 = SimpleRecordValue((b) => b..record = (0, 0));
      final value2 = SimpleRecordValue((b) => b..record = (0, 0));
      expect(value1.hashCode, value2.hashCode);
    });

    test('hashes not equal when not equal', () {
      final value1 = SimpleRecordValue((b) => b..record = (0, 0));
      final value2 = SimpleRecordValue((b) => b..record = (0, 1));
      expect(value1.hashCode, isNot(equals(value2.hashCode)));
    });

    test('has toString', () {
      final value = SimpleRecordValue((b) => b..record = (0, 0));
      expect(value.toString(), '''SimpleRecordValue {
  record=(0, 0),
}''');
    });
  });

  group(ComplexRecordValue, () {
    final value1 = ComplexRecordValue((b) => b
      ..record2 = (0, 0)
      ..record2p = (null, 0)
      ..record3 = (10, 10)
      ..record3p = (null, 10)
      ..record4 = (x: 20, y: 20)
      ..record4p = (x: null, y: 20)
      ..record5 = ([1].build(), b: BuiltList<ComplexRecordValue>())
      ..record5p = (null, b: BuiltList<ComplexRecordValue>())
      ..record6 = (() {}, b: () {})
      ..record6p = (null, b: () {}));
    final value1a = ComplexRecordValue((b) => b
      ..record2 = (0, 0)
      ..record2p = (null, 0)
      ..record3 = (10, 10)
      ..record3p = (null, 10)
      ..record4 = (x: 20, y: 20)
      ..record4p = (x: null, y: 20)
      ..record5 = ([1].build(), b: BuiltList<ComplexRecordValue>())
      ..record5p = (null, b: BuiltList<ComplexRecordValue>())
      ..record6 = (() {}, b: () {})
      ..record6p = (null, b: () {}));
    final value2 = ComplexRecordValue((b) => b
      ..record2 = (0, 1)
      ..record2p = (null, 1)
      ..record3 = (10, 11)
      ..record3p = (null, 11)
      ..record4 = (x: 20, y: 21)
      ..record4p = (x: null, y: 21)
      ..record5 = ([1, 2].build(), b: BuiltList<ComplexRecordValue>())
      ..record5p = (null, b: BuiltList<ComplexRecordValue>())
      ..record6 = (() {}, b: () {})
      ..record6p = (null, b: () {}));

    test('compares equal when equal', () {
      expect(value1, value1a);
    });

    test('compares not equal when not equal', () {
      expect(value1, isNot(equals(value2)));
    });

    test('hashes equal when equal', () {
      expect(value1.hashCode, value1a.hashCode);
    });

    test('hashes not equal when not equal', () {
      expect(value1.hashCode, isNot(equals(value2.hashCode)));
    });

    test('has toString', () {
      expect(value1.toString(), '''ComplexRecordValue {
  record2=(0, 0),
  record2p=(null, 0),
  record3=(10, 10),
  record3p=(null, 10),
  record4=(x: 20, y: 20),
  record4p=(x: null, y: 20),
  record5=([1], b: []),
  record5p=(null, b: []),
  record6=(Closure: () => void, b: Closure: () => void),
  record6p=(null, b: Closure: () => void),
}''');
    });
  });
}
