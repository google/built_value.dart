// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library mixins;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/mixins_src.dart';

part 'mixins.g.dart';

abstract class UsesMixin extends Object
    with Mixin
    implements Built<UsesMixin, UsesMixinBuilder> {
  static Serializer<UsesMixin> get serializer => _$usesMixinSerializer;

  factory UsesMixin([void Function(UsesMixinBuilder) updates]) = _$UsesMixin;
  UsesMixin._();
}
