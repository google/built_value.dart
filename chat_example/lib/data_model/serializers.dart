// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chat_example/data_model/data_model.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  Chat,
  ListUsers,
  ListUsersResponse,
  Login,
  LoginResponse,
  ShowChat,
  Status,
  Welcome,
])
final Serializers serializers = _$serializers;
