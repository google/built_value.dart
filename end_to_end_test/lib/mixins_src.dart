// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Test coverage for handling of file types read from a separate file.

import 'package:built_value/built_value.dart';

typedef String TypeDef(String a);

abstract class Mixin {
  @BuiltValueField(serialize: false)
  TypeDef get typeDef;
}
