// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:end_to_end_test/records.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group(SerializableRecordValue, () {
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
}
