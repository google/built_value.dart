// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.8

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

// This catches a regression in determining whether a getter should cause a
// field to be created. We only want that if there is no concrete
// implementation. This precise combination of mixins and interfaces caused
// the concrete implementation to be missed and an unwanted field to be
// created.
abstract class GetsCorrectFieldsViaMixins extends Object
    with ConcreteMixin, AbstractMixin
    implements
        Built<GetsCorrectFieldsViaMixins, GetsCorrectFieldsViaMixinsBuilder>,
        MixinBase {
  factory GetsCorrectFieldsViaMixins(
          [void Function(GetsCorrectFieldsViaMixinsBuilder) updates]) =
      _$GetsCorrectFieldsViaMixins;
  GetsCorrectFieldsViaMixins._();
}

abstract class MixinBase {
  int get shouldBeAField;
  int get shouldNotBeAField;
}

mixin ConcreteMixin implements MixinBase {
  @override
  int get shouldNotBeAField => 1;
}

mixin AbstractMixin implements MixinBase {}
