// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:end_to_end_test/errors_matchers.dart';
import 'package:end_to_end_test/records.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('$SerializableRecordValue with no record value', () {
    var data = SerializableRecordValue((b) => b..value = 1);
    var serialized = json.decode(json.encode([
      'SerializableRecordValue',
      'value',
      1,
    ])) as Object;

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('$SerializableRecordValue with a record value', () {
    var data = SerializableRecordValue((b) => b
      ..value = 1
      ..record = (1, 2));
    var serialized = json.decode(json.encode([
      'SerializableRecordValue',
      'value',
      1,
      'record',
      [1, 2],
    ])) as Object;
    var serializersWithCustomSerializer =
        (serializers.toBuilder()..add(RecordOfIntIntSerializer())).build();

    test('gives advice about custom serializer on failure to serialize', () {
      expect(
          () => serializers.serialize(data),
          throwsA(isErrorContaining(
              'record types are not automatically serializable')));
    });

    test('gives advice about custom serializer on failure to deserialize', () {
      expect(
          () => serializers.deserialize(serialized),
          throwsA(isErrorContaining(
              'record types are not automatically serializable')));
    });

    test('can be serialized with custom serializer', () {
      expect(serializersWithCustomSerializer.serialize(data), serialized);
    });

    test('can be deserialized with custom deserializer', () {
      expect(serializersWithCustomSerializer.deserialize(serialized), data);
    });
  });
}
