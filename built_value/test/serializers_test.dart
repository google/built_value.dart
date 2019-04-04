// Copyright (c) 2019, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:built_value/src/int_serializer.dart';
import 'package:test/test.dart';

void main() {
  var serializers = Serializers();

  group(Serializers, () {
    test('exposes iterable of serializer', () {
      expect(serializers.serializers, contains(TypeMatcher<IntSerializer>()));
    });

    test('can be added to', () {
      final moreSerializers =
          (serializers.toBuilder()..addAll([TestSerializer()])).build();

      expect(
          moreSerializers.serializers, contains(TypeMatcher<TestSerializer>()));
    });
  });
}

class TestSerializer implements PrimitiveSerializer<Object> {
  @override
  Iterable<Type> get types => [];

  @override
  String get wireName => '';

  @override
  Object deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return null;
  }

  @override
  Object serialize(Serializers serializers, Object object,
      {FullType specifiedType = FullType.unspecified}) {
    return null;
  }
}
