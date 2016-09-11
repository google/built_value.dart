// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library compound_value;

import 'package:built_value/built_value.dart';

import 'package:example/validated_value.dart';
import 'simple_value.dart';

part 'compound_value.g.dart';

/// Example of how to use built_value.
///
/// Other built_value classes can be used as fields. In the builder they are
/// represented as nested builders.
abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  SimpleValue get simpleValue;
  @nullable
  ValidatedValue get validatedValue;

  CompoundValue._();
  factory CompoundValue([updates(CompoundValueBuilder b)]) = _$CompoundValue;
}
