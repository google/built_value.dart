// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:end_to_end_test/enums_nnbd.dart';
import 'package:end_to_end_test/serializers_nnbd.dart';
import 'package:test/test.dart';

void main() {
  group('TestEnum', () {
    var data = TestEnum.yes;
    var serialized = ['TestEnum', 'yes'];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('WireNameEnum', () {
    var data = WireNameEnum.yes;
    var serialized = ['E', 'y'];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('WireNumberEnum', () {
    var data = WireNumberEnum.yes;
    var serialized = ['WireNumberEnum', 1];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('FallbackEnum', () {
    var data = FallbackEnum.no;
    var serialized = ['FallbackEnum', 'some_unrecognized_value'];

    test('deserializes using fallback', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
