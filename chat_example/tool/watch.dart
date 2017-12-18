// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build_runner/build_runner.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';

/// Start a watcher that automatically builds the generated files in the
/// built_value chat example on changes.
Future main(List<String> args) async {
  await watch([
    new BuildAction(
        new PartBuilder([
          new BuiltValueGenerator(),
        ]),
        'chat_example',
        inputs: const ['lib/**/*.dart'])
  ], deleteFilesByDefault: true);
}
