// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';

void main() {
  var serializers = Serializers();

  group('int32 with known specifiedType', () {
    var data = Int32.MAX_VALUE;
    var serialized = Int32.MAX_VALUE.toInt();
    var specifiedType = const FullType(Int32);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('int32 with unknown specifiedType', () {
    var data = Int32.MIN_VALUE;
    var serialized =
        json.decode(json.encode(['Int32', Int32.MIN_VALUE.toInt()])) as Object;
    var specifiedType = FullType.unspecified;

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
