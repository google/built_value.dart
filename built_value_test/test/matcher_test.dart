// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/built_value.dart';
import 'package:built_value_test/matcher.dart';
import 'package:test/test.dart';

import 'values.dart';

void main() {
  group('built_value matcher', () {
    test('matches if same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..string = 'str');

      expect(value, equalsBuilt(value));
    });

    test('reports if not same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..string = 'str');
      final otherValue = value.rebuild((b) => b..simpleValue.anInt = 5);

      _expectMismatch(value, otherValue,
          "was <3> instead of <5> at location ['simpleValue']['anInt']");
    });

    test('reports deep match on lists if not same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..simpleValue.list.add('foo')
        ..string = 'str');
      final otherValue = value.rebuild((b) => b..simpleValue.list.add('bar'));

      _expectMismatch(value, otherValue,
          "shorter than expected at location ['simpleValue']['list'][1]");
    });

    test('reports deep match on list multimaps if not same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..simpleValue.multimap.add(42, true)
        ..string = 'str');
      final otherValue =
          value.rebuild((b) => b..simpleValue.multimap.add(42, false));

      _expectMismatch(
          value,
          otherValue,
          'shorter than expected at location'
          " ['simpleValue']['multimap']['42'][1]");
    });

    test('reports deep match on maps if not same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..simpleValue.map['foo'] = 3
        ..simpleValue.map['bar'] = 4
        ..string = 'str');
      final otherValue = value.rebuild((b) => b..simpleValue.map['bar'] = 5);

      _expectMismatch(value, otherValue,
          "was <4> instead of <5> at location ['simpleValue']['map']['bar']");
    });

    test('reports deep match on sets if not same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..simpleValue.aSet.add(42)
        ..string = 'str');
      final otherValue = value.rebuild((b) => b..simpleValue.aSet.remove(42));

      _expectMismatch(value, otherValue,
          "larger than expected at location ['simpleValue']['aSet']");
    });

    test('reports deep match on set multimaps if not same', () {
      final value = CompoundValue((b) => b
        ..simpleValue.anInt = 3
        ..simpleValue.setMultimap.add(42, true)
        ..string = 'str');
      final otherValue =
          value.rebuild((b) => b..simpleValue.setMultimap.add(42, false));

      _expectMismatch(
          value,
          otherValue,
          'shorter than expected at location'
          " ['simpleValue']['setMultimap']['42'][1]");
    });

    test('reports if the wrong type', () {
      final value = 42;
      final otherValue = CompoundValue((b) => b..simpleValue.anInt = 5);

      _expectMismatch(value, otherValue, 'is the wrong type');
    });

    test('compared value matcher', () {
      final value = ComparedValue((b) => b
        ..name = 'foo'
        ..onChanged = () => 'Change happened!');
      final otherValue = ComparedValue((b) => b
        ..name = 'foo'
        ..onChanged = () => 'Change happened!');

      expect(value, otherValue);
    });

    test('compared value matcher with different onChanged outcomes', () {
      final value = ComparedValue((b) => b
        ..name = 'foo'
        ..onChanged = () => 'Change happened!');
      final otherValue = ComparedValue((b) => b
        ..name = 'foo'
        ..onChanged = () => 'Change did not happen!');

      expect(value, otherValue);
    });

    test('compared value matcher with different names', () {
      final value = ComparedValue((b) => b
        ..name = 'foo'
        ..onChanged = () => 'Change happened!');
      final otherValue = ComparedValue((b) => b
        ..name = 'bar'
        ..onChanged = () => 'Change did not happen!');

      _expectMismatch(value, otherValue, 'was \'foo\' instead of \'bar\'');
    });
  });
}

void _expectMismatch(
    Object value, Built otherValue, String expectedMismatchMessage) {
  try {
    expect(value, equalsBuilt(otherValue));
  } catch (exception) {
    expect(exception.toString(), contains(expectedMismatchMessage));
    return;
  }
  throw StateError('Expected mismatch.');
}
