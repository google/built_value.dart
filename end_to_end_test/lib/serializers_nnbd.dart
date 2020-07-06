// Copyright (c) 2020, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.9

library serializers_nnbd;

import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/enums_nnbd.dart';

part 'serializers_nnbd.g.dart';

@SerializersFor([
  FallbackEnum,
  SecondTestEnum,
  TestEnum,
  WireNameEnum,
  WireNumberEnum,
])
final Serializers serializers = _$serializers;
