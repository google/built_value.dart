// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/values_nnbd.dart' as prefix;

part 'imported_values_nnbd.g.dart';

abstract class ImportedValue
    implements Built<ImportedValue, ImportedValueBuilder> {
  static Serializer<ImportedValue> get serializer => _$importedValueSerializer;

  prefix.SimpleValue get simpleValue;
  BuiltList<prefix.SimpleValue> get simpleValues;

  factory ImportedValue([void Function(ImportedValueBuilder) updates]) =
      _$ImportedValue;
  ImportedValue._();
}

// With a custom builder.
abstract class ImportedCustomValue
    implements Built<ImportedCustomValue, ImportedCustomValueBuilder> {
  static Serializer<ImportedCustomValue> get serializer =>
      _$importedCustomValueSerializer;

  prefix.SimpleValue get simpleValue;
  BuiltList<prefix.SimpleValue> get simpleValues;

  factory ImportedCustomValue(
          [void Function(ImportedCustomValueBuilder) updates]) =
      _$ImportedCustomValue;
  ImportedCustomValue._();
}

abstract class ImportedCustomValueBuilder
    implements Builder<ImportedCustomValue, ImportedCustomValueBuilder> {
  prefix.SimpleValue? simpleValue;
  BuiltList<prefix.SimpleValue>? simpleValues;

  ImportedCustomValueBuilder._();
  factory ImportedCustomValueBuilder() = _$ImportedCustomValueBuilder;
}

// With a custom builder using nested buliders.
abstract class ImportedCustomNestedValue
    implements
        Built<ImportedCustomNestedValue, ImportedCustomNestedValueBuilder> {
  static Serializer<ImportedCustomNestedValue> get serializer =>
      _$importedCustomNestedValueSerializer;

  prefix.SimpleValue get simpleValue;
  BuiltList<prefix.SimpleValue> get simpleValues;

  factory ImportedCustomNestedValue(
          [void Function(ImportedCustomNestedValueBuilder) updates]) =
      _$ImportedCustomNestedValue;
  ImportedCustomNestedValue._();
}

abstract class ImportedCustomNestedValueBuilder
    implements
        Builder<ImportedCustomNestedValue, ImportedCustomNestedValueBuilder> {
  prefix.SimpleValueBuilder simpleValue = prefix.SimpleValueBuilder();
  ListBuilder<prefix.SimpleValue> simpleValues = ListBuilder();

  ImportedCustomNestedValueBuilder._();
  factory ImportedCustomNestedValueBuilder() =
      _$ImportedCustomNestedValueBuilder;
}
