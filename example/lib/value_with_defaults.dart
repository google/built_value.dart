// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library value_with_defaults;

import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

part 'value_with_defaults.g.dart';

/// Example of how to use built_value.
///
/// To provide defaults, write the builder as an explicit class instead of
/// letting it be fully generated. See below.
abstract class ValueWithDefaults
    implements Built<ValueWithDefaults, ValueWithDefaultsBuilder> {
  int get anInt;
  @nullable
  String get aString;

  ValueWithDefaults._();
  factory ValueWithDefaults([updates(ValueWithDefaultsBuilder b)]) =
      _$ValueWithDefaults;
}

/// The builder class must implement [Builder]. It must be abstract, and have
/// fields declared as normal public fields. Finally, it must have a particular
/// constructor and factory, as shown here.
///
/// Defaults can be specified by assigning them to fields here.
///
/// You can further customize the builder by adding methods and setters
/// and implementing interfaces.
abstract class ValueWithDefaultsBuilder
    implements Builder<ValueWithDefaults, ValueWithDefaultsBuilder> {
  @virtual
  int anInt = 7;

  @nullable
  @virtual
  String aString;

  ValueWithDefaultsBuilder._();
  factory ValueWithDefaultsBuilder() = _$ValueWithDefaultsBuilder;
}
