// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  final serializers = (new Serializers().toBuilder()
        ..addPlugin(new StandardJsonPlugin())
        ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(int)]),
            () => new ListBuilder<int>())
        ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(BuiltList, const [const FullType(int)])
            ]),
            () => new ListBuilder<BuiltList<int>>())
        ..addBuilderFactory(
            const FullType(BuiltSet, const [const FullType(int)]),
            () => new SetBuilder<int>())
        ..addBuilderFactory(
            const FullType(
                BuiltMap, const [const FullType(int), const FullType(String)]),
            () => new MapBuilder<int, String>())
        ..addBuilderFactory(
            const FullType(BuiltMap,
                const [const FullType(String), const FullType(String)]),
            () => new MapBuilder<String, String>())
        ..addBuilderFactory(
            const FullType(BuiltMap, const [
              const FullType(BuiltMap,
                  const [const FullType(int), const FullType(String)]),
              const FullType(
                  BuiltMap, const [const FullType(int), const FullType(String)])
            ]),
            () =>
                new MapBuilder<BuiltMap<int, String>, BuiltMap<int, String>>()))
      .build();

  group('Serializers with StandardJsonPlugin', () {
    test('throws on serialize of list multimaps', () {
      final data = new BuiltListMultimap<int, String>({
        1: ['one'],
        2: ['two'],
        3: ['three']
      });
      final specifiedType = const FullType(BuiltListMultimap,
          const [const FullType(int), const FullType(String)]);
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(new isInstanceOf<ArgumentError>()));
    });

    test('throws on serialize of set multimaps', () {
      final data = new BuiltSetMultimap<int, String>({
        1: ['one'],
        2: ['two'],
        3: ['three']
      });
      final specifiedType = const FullType(BuiltSetMultimap,
          const [const FullType(int), const FullType(String)]);
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(new isInstanceOf<ArgumentError>()));
    });

    group('and known specifiedType', () {
      group('can take an int and', () {
        final data = 1;
        final specifiedType = const FullType(int);
        final serialized = 1;

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });

      group('can take a list and', () {
        final data = new BuiltList<int>([1, 2, 3]);
        final specifiedType =
            const FullType(BuiltList, const [const FullType(int)]);
        final serialized = [1, 2, 3];

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });

      group('can take a set and', () {
        final data = new BuiltSet<int>([1, 2, 3]);
        final specifiedType =
            const FullType(BuiltSet, const [const FullType(int)]);
        final serialized = [1, 2, 3];

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });

      group('can take a nested list and', () {
        final data = new BuiltList<BuiltList<int>>([
          new BuiltList<int>([1, 2, 3]),
          new BuiltList<int>([4, 5, 6]),
          new BuiltList<int>([7, 8, 9])
        ]);
        final specifiedType = const FullType(BuiltList, const [
          const FullType(BuiltList, const [const FullType(int)])
        ]);
        final serialized = [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ];

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });

      group('can take a map and', () {
        final data =
            new BuiltMap<int, String>({1: 'one', 2: 'two', 3: 'three'});
        final specifiedType = const FullType(
            BuiltMap, const [const FullType(int), const FullType(String)]);
        final serialized = {'1': 'one', '2': 'two', '3': 'three'};

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });

      group('can take a map with String keys and', () {
        final data = new BuiltMap<String, String>(
            {'1': 'one', '2': 'two', '3': 'three'});
        final specifiedType = const FullType(
            BuiltMap, const [const FullType(String), const FullType(String)]);
        final serialized = {'1': 'one', '2': 'two', '3': 'three'};

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });

      group('can take a nested map and', () {
        final data =
            new BuiltMap<BuiltMap<int, String>, BuiltMap<int, String>>({
          new BuiltMap<int, String>({1: 'one'}):
              new BuiltMap<int, String>({2: 'two', 3: 'three'})
        });
        final specifiedType = const FullType(BuiltMap, const [
          const FullType(
              BuiltMap, const [const FullType(int), const FullType(String)]),
          const FullType(
              BuiltMap, const [const FullType(int), const FullType(String)])
        ]);
        final serialized = {
          '{"1":"one"}': {'2': 'two', '3': 'three'}
        };

        test('serialize it', () {
          expect(serializers.serialize(data, specifiedType: specifiedType),
              serialized);
        });

        test('deserialize it', () {
          expect(
              serializers.deserialize(serialized, specifiedType: specifiedType),
              data);
        });
      });
    });

    group('and unknown specifiedType', () {
      group('can take an int and', () {
        final data = 1;
        final serialized = {r'$': 'int', '': 1};

        test('serialize it', () {
          expect(serializers.serialize(data), serialized);
        });

        test('deserialize it', () {
          expect(serializers.deserialize(serialized), data);
        });
      });

      group('can take a list and', () {
        final data = new BuiltList<int>([1, 2, 3]);
        final serialized = {
          r'$': 'list',
          '': [
            {r'$': 'int', '': 1},
            {r'$': 'int', '': 2},
            {r'$': 'int', '': 3}
          ]
        };

        test('serialize it', () {
          expect(serializers.serialize(data), serialized);
        });

        test('deserialize it', () {
          expect(serializers.deserialize(serialized), data);
        });
      });

      group('can take a nested list and', () {
        final data = new BuiltList<BuiltList<int>>([
          new BuiltList<int>([1, 2, 3]),
          new BuiltList<int>([4, 5, 6]),
          new BuiltList<int>([7, 8, 9])
        ]);
        final serialized = {
          r'$': 'list',
          '': [
            {
              r'$': 'list',
              '': [
                {r'$': 'int', '': 1},
                {r'$': 'int', '': 2},
                {r'$': 'int', '': 3}
              ]
            },
            {
              r'$': 'list',
              '': [
                {r'$': 'int', '': 4},
                {r'$': 'int', '': 5},
                {r'$': 'int', '': 6}
              ]
            },
            {
              r'$': 'list',
              '': [
                {r'$': 'int', '': 7},
                {r'$': 'int', '': 8},
                {r'$': 'int', '': 9}
              ]
            }
          ]
        };

        test('serialize it', () {
          expect(serializers.serialize(data), serialized);
        });

        test('deserialize it', () {
          expect(serializers.deserialize(serialized), data);
        });
      });

      group('can take a map and', () {
        final data =
            new BuiltMap<int, String>({1: 'one', 2: 'two', 3: 'three'});
        final serialized = {
          r'$': 'encoded_map',
          r'{"$":"int","":1}': {r'$': 'String', '': 'one'},
          r'{"$":"int","":2}': {r'$': 'String', '': 'two'},
          r'{"$":"int","":3}': {r'$': 'String', '': 'three'}
        };

        test('serialize it', () {
          expect(serializers.serialize(data), serialized);
        });

        test('deserialize it', () {
          expect(serializers.deserialize(serialized), data);
        });
      });

      group('can take a map with String keys and', () {
        final data = new BuiltMap<String, String>(
            {'1': 'one', '2': 'two', '3': 'three'});
        final serialized = {
          r'$': 'encoded_map',
          r'{"$":"String","":"1"}': {r'$': 'String', '': 'one'},
          r'{"$":"String","":"2"}': {r'$': 'String', '': 'two'},
          r'{"$":"String","":"3"}': {r'$': 'String', '': 'three'}
        };

        test('serialize it', () {
          expect(serializers.serialize(data), serialized);
        });

        test('deserialize it', () {
          expect(serializers.deserialize(serialized), data);
        });
      });

      group('can take a nested map and', () {
        final data =
            new BuiltMap<BuiltMap<int, String>, BuiltMap<int, String>>({
          new BuiltMap<int, String>({1: 'one'}):
              new BuiltMap<int, String>({2: 'two', 3: 'three'})
        });
        final serialized = {
          r'$': 'encoded_map',
          r'{"$":"encoded_map",'
              r'"{\"$\":\"int\",\"\":1}":{"$":"String","":"one"}}': {
            r'$': 'encoded_map',
            r'{"$":"int","":2}': {r'$': 'String', '': 'two'},
            r'{"$":"int","":3}': {r'$': 'String', '': 'three'}
          }
        };

        test('serialize it', () {
          expect(serializers.serialize(data), serialized);
        });

        test('deserialize it', () {
          expect(serializers.deserialize(serialized), data);
        });
      });
    });
  });
}
