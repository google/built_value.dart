// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library imported_values;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/values.dart' as prefix;

part 'imported_values.g.dart';

abstract class ImportedValue
    implements Built<ImportedValue, ImportedValueBuilder> {
  static Serializer<ImportedValue> get serializer => _$importedValueSerializer;

  prefix.SimpleValue get simpleValue;
  BuiltList<prefix.SimpleValue> get simpleValues;

  factory ImportedValue([updates(ImportedValueBuilder b)]) = _$ImportedValue;
  ImportedValue._();
}
