// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  final serializers = Serializers();

  group('SimpleUri with known specifiedType', () {
    final data = Uri.parse('https://github.com/google/built_value.dart');
    final serialized = 'https://github.com/google/built_value.dart';
    final specifiedType = const FullType(Uri);

    test('has expected type', () {
      expect(data.runtimeType.toString(), '_SimpleUri');
    });

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('Uri with known specifiedType', () {
    final data = Uri.parse('https://github.com:0/google/built_value.dart');
    final serialized = 'https://github.com:0/google/built_value.dart';
    final specifiedType = const FullType(Uri);

    test('has expected type', () {
      expect(data.runtimeType.toString(), '_Uri');
    });

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('Uri with unknown specifiedType', () {
    final data = Uri.parse('https://github.com/google/built_value.dart');
    final serialized = ['Uri', 'https://github.com/google/built_value.dart'];
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
