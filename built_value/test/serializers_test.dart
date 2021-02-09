// Copyright (c) 2019, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:built_value/src/date_time_serializer.dart';
import 'package:built_value/src/int_serializer.dart';
import 'package:test/test.dart';

void main() {
  var serializers = Serializers();
  final moreSerializers = (serializers.toBuilder()
        ..addAll([TestSerializer()])
        ..addBuilderFactory(FullType(TestSerializer), () => null))
      .build();

  group(Serializers, () {
    test('exposes iterable of serializer', () {
      expect(serializers.serializers, contains(TypeMatcher<IntSerializer>()));
    });

    test('can be added to', () {
      expect(
          moreSerializers.serializers, contains(TypeMatcher<TestSerializer>()));
    });

    test('can be merged', () {
      var mergedSerializers =
          (serializers.toBuilder()..mergeAll([moreSerializers])).build();
      expect(mergedSerializers.serializers,
          contains(TypeMatcher<TestSerializer>()));
      expect(mergedSerializers.builderFactories.keys,
          contains(FullType(TestSerializer)));
    });

    test('can be merged by static method', () {
      var mergedSerializers = Serializers.merge([serializers, moreSerializers]);
      expect(mergedSerializers.serializers,
          contains(TypeMatcher<TestSerializer>()));
      expect(mergedSerializers.builderFactories.keys,
          contains(FullType(TestSerializer)));
    });

    test('provides convenience toJson method', () {
      expect(serializers.toJson(DateTimeSerializer(), DateTime.utc(2020, 1, 1)),
          '1577836800000000');
    });

    test('provides convenience fromJson method', () {
      expect(serializers.fromJson(DateTimeSerializer(), '1577836800000000'),
          DateTime.utc(2020, 1, 1));
    });
  });
}

class TestSerializer implements PrimitiveSerializer<Object?> {
  @override
  Iterable<Type> get types => [];

  @override
  String get wireName => '';

  @override
  Object? deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return null;
  }

  @override
  Object serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    return '';
  }
}
