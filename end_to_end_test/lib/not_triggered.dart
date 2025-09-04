// Copyright (c) 2025, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'exports_built_value.dart';

// This file is ignored because it does not match a defined trigger in
// `built_value_generator` `build.yaml`.
//
// If there is a bug causing it to not be ignored, the build of this package
// will break because these are not valid `built_value` classes.

abstract class Value implements Built<Value, ValueBuilder> {}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {}
