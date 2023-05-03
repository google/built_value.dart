// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  var serializers = Serializers();

  group('Uint8List with known specifiedType', () {
    var serialized =
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+A8AAQUBAScY42YAAAAASUVORK5CYII=';
    var data = base64Decode(serialized);
    var specifiedType = const FullType(Uint8List);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('UInt8List with unknown specifiedType', () {
    var rawData =
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+A8AAQUBAScY42YAAAAASUVORK5CYII=';
    var serialized = json.decode(json.encode(['UInt8List', rawData])) as Object;
    var data = base64Decode(rawData.toString());
    var specifiedType = FullType.unspecified;

    test('can be serialized', () {
      var serialized_by =
          serializers.serialize(data, specifiedType: specifiedType);
      expect(serialized_by, serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });
}
