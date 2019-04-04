// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';

void main() {
  final serializers = Serializers();

  group('int64 with known specifiedType', () {
    final data = Int64.MAX_VALUE;
    final serialized = Int64.MAX_VALUE.toString();
    final specifiedType = const FullType(Int64);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('int64 with unknown specifiedType', () {
    final data = Int64.MIN_VALUE;
    final serialized = ['Int64', Int64.MIN_VALUE.toString()];
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
}
