import 'package:built_value/serializer.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import 'sample.dart';

void main() {
  group('Serialization with keys and keyCheck', () {
    var fruit = FruitEnum.apple;
    EnumSerializer serializer;

    test('Failure at serialization', () {
      try {
        serializer = FruitEnum.wrongSerializer;
      } on ArgumentError catch (e) {
        expect(e.message, 'Conflict in wireName');
      }
    });

    test('Success at serialization', () {
      serializer = FruitEnum.rightSerializer;
      expect(serializer.serializationKey(fruit), 'apl');
    });
  });
}
