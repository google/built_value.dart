// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  final serializers = Serializers();

  group('double with known specifiedType', () {
    final data = 3.141592653589793;
    final serialized = data;
    final specifiedType = const FullType(double);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('double with unknown specifiedType', () {
    final data = 3.141592653589793;
    final serialized = ['double', data];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('double with NaN value', () {
    final data = double.nan;
    final serialized = 'NaN';
    final specifiedType = const FullType(double);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      // Compare using toString as NaN != NaN.
      expect(
          serializers
              .deserialize(serialized, specifiedType: specifiedType)
              .toString(),
          data.toString());
    });
  });

  group('double with -INF value', () {
    final data = double.negativeInfinity;
    final serialized = '-INF';
    final specifiedType = const FullType(double);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('double with INF value', () {
    final data = double.infinity;
    final serialized = 'INF';
    final specifiedType = const FullType(double);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });
}
