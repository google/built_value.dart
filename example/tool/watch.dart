// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build_runner/build_runner.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';

/// Example of how to use source_gen with [BuiltValueGenerator].
///
/// This script runs a watcher that continuously rebuilds generated source.
///
/// Import the generators you want and pass them to [watch] as shown,
/// specifying which files in which packages you want to run against.
Future main(List<String> args) async {
  watch(
      new PhaseGroup.singleAction(
          new GeneratorBuilder([new BuiltValueGenerator()]),
          new InputSet('example', const ['lib/*.dart'])),
      deleteFilesByDefault: true);
}
