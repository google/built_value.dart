// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_value_generator/src/enum_source_library.dart';
import 'package:built_value_generator/src/value_source_class.dart';
import 'package:built_value_generator/src/serializer_source_library.dart';
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
      final enumCode =
          new EnumSourceLibrary.fromLibraryElement(element).generateCode();

      final serializerSourceLibrary =
          SerializerSourceLibrary.fromLibraryElement(element);
      if (serializerSourceLibrary.needsBuiltJson ||
          serializerSourceLibrary.hasSerializers) {
        return (enumCode ?? '') + '\n' + serializerSourceLibrary.generate();
      } else {
        return enumCode;
      }
    } else {
      return null;
    }
  }
}
