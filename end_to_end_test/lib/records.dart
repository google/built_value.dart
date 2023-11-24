// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'records.g.dart';

abstract class SimpleRecordValue
    implements Built<SimpleRecordValue, SimpleRecordValueBuilder> {
  (int, int) get record;

  factory SimpleRecordValue([void Function(SimpleRecordValueBuilder) updates]) =
      _$SimpleRecordValue;
  SimpleRecordValue._();
}

abstract class ComplexRecordValue
    implements Built<ComplexRecordValue, ComplexRecordValueBuilder> {
  // These don't work yet: https://github.com/dart-lang/dart_style/issues/1224
  //
  // () get record0;
  // ()? get record0;
  //
  // These need extra work to generate the "," as needed.
  //
  // (int,) get record1;
  // (int,)? get record1n;

  (int, int) get record2;
  (int?, int) get record2p;
  (int, int)? get record2n;
  (int x, int y) get record3;
  (int? x, int y) get record3p;
  (int x, int y)? get record3n;
  ({int x, int y}) get record4;
  ({int? x, int y}) get record4p;
  ({int x, int y})? get record4n;
  (BuiltList<int> a, {BuiltList<ComplexRecordValue> b}) get record5;
  (BuiltList<int>? a, {BuiltList<ComplexRecordValue> b}) get record5p;
  (BuiltList<int> a, {BuiltList<ComplexRecordValue> b})? get record5n;

  @BuiltValueField(compare: false)
  (void Function() a, {void Function() b}) get record6;
  @BuiltValueField(compare: false)
  (void Function()? a, {void Function() b}) get record6p;
  @BuiltValueField(compare: false)
  (void Function() a, {void Function() b})? get record6n;

  factory ComplexRecordValue(
          [void Function(ComplexRecordValueBuilder) updates]) =
      _$ComplexRecordValue;
  ComplexRecordValue._();
}

typedef RecordOfIntInt = (int, int);

// Record serialization is not supported, so a class with records is only
// serializable if record fields are not serialized.
abstract class SerializableRecordValue
    implements Built<SerializableRecordValue, SerializableRecordValueBuilder> {
  static Serializer<SerializableRecordValue> get serializer =>
      _$serializableRecordValueSerializer;

  int get value;
  RecordOfIntInt? get record;

  factory SerializableRecordValue(
          [void Function(SerializableRecordValueBuilder) updates]) =
      _$SerializableRecordValue;
  SerializableRecordValue._();
}

class RecordOfIntIntSerializer implements StructuredSerializer<RecordOfIntInt> {
  @override
  RecordOfIntInt deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return (serialized.elementAt(0)! as int, serialized.elementAt(1)! as int);
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, RecordOfIntInt object,
      {FullType specifiedType = FullType.unspecified}) {
    return [object.$1, object.$2];
  }

  @override
  Iterable<Type> get types => [RecordOfIntInt];

  @override
  String get wireName => 'RecordOfIntInt';
}
