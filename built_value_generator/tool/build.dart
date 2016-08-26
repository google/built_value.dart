// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';

Future main(List<String> args) async {
  await build(
      new PhaseGroup.singleAction(
          new GeneratorBuilder([new BuiltValueGenerator()]),
          new InputSet('built_value_generator', const ['lib/src/*.dart'])),
      deleteFilesByDefault: true);
}
