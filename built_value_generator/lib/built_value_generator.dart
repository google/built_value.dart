// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_value_generator/src/value_source_class.dart';
import 'package:built_value_generator/src/enum_source_library.dart';
import 'package:source_gen/source_gen.dart';

/// Generator for Enum Class and Built Values.
///
/// See https://github.com/google/built_value.dart/tree/master/example
class BuiltValueGenerator extends Generator {
  @override
  Future<String> generate(Element element, BuildStep buildStep) async {
    if (element is ClassElement && ValueSourceClass.needsBuiltValue(element)) {
      return new ValueSourceClass.fromClassElement(element).generateCode();
    } else if (element is LibraryElement) {
      return new EnumSourceLibrary.fromLibraryElement(element).generateCode();
    } else {
      return null;
    }
  }
}
