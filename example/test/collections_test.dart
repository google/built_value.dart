// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:example/collections.dart';
import 'package:test/test.dart';

void main() {
  group('Collections', () {
    test('can be instantiated', () {
      new Collections();
    });

    test('default to empty if not nullable', () {
      expect(new Collections().list.isEmpty, true);
      expect(new Collections().set.isEmpty, true);
      expect(new Collections().map.isEmpty, true);
      expect(new Collections().listMultimap.isEmpty, true);
      expect(new Collections().setMultimap.isEmpty, true);
    });

    test('default to null if nullable', () {
      expect(new Collections().nullableList, null);
      expect(new Collections().nullableSet, null);
      expect(new Collections().nullableMap, null);
      expect(new Collections().nullableListMultimap, null);
      expect(new Collections().nullableSetMultimap, null);
    });

    test('can be updated via builder', () {
      final collections = new Collections((b) => b
        ..list.add(1)
        ..set.add('two')
        ..map['three'] = 4
        ..listMultimap.add(5, true)
        ..setMultimap.add('six', false));

      expect(collections.list, [1]);
      expect(collections.set, ['two']);
      expect(collections.map.toMap(), {'three': 4});
      expect(collections.listMultimap.toMap(), {
        5: [true]
      });
      expect(collections.setMultimap.toMap(), {
        'six': [false]
      });
    });

    test('can be set from null via builder', () {
      final collections = new Collections((b) => b
        ..nullableList = new ListBuilder<int>()
        ..nullableSet = new SetBuilder<String>()
        ..nullableMap = new MapBuilder<String, int>()
        ..nullableListMultimap = new ListMultimapBuilder<int, bool>()
        ..nullableSetMultimap = new SetMultimapBuilder<String, bool>()
        ..nullableList.add(1)
        ..nullableSet.add('two')
        ..nullableMap['three'] = 4
        ..nullableListMultimap.add(5, true)
        ..nullableSetMultimap.add('six', false));

      expect(collections.nullableList, [1]);
      expect(collections.nullableSet, ['two']);
      expect(collections.nullableMap.toMap(), {'three': 4});
      expect(collections.nullableListMultimap.toMap(), {
        5: [true]
      });
      expect(collections.nullableSetMultimap.toMap(), {
        'six': [false]
      });
    });
  });
}
