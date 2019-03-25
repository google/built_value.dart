// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('num with known specifiedType', () {
    final data = 42;
    final serialized = 42;
    final specifiedType = const FullType(num);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('num with NaN value', () {
    final data = double.nan;
    final serialized = 'NaN';
    final specifiedType = const FullType(num);

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

  group('num with -INF value', () {
    final data = double.negativeInfinity;
    final serialized = '-INF';
    final specifiedType = const FullType(num);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('num with INF value', () {
    final data = double.infinity;
    final serialized = 'INF';
    final specifiedType = const FullType(num);

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
