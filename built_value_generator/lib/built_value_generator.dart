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
  // Allow creating via `const` as well as enforces immutability here.
  const BuiltValueGenerator();

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();
    try {
      final enumCode = new EnumSourceLibrary(library.element).generateCode();
      if (enumCode != null) result.writeln(enumCode);
      final serializerSourceLibrary =
          new SerializerSourceLibrary(library.element);
      if (serializerSourceLibrary.needsBuiltJson ||
          serializerSourceLibrary.hasSerializers) {
        result.writeln(serializerSourceLibrary.generateCode());
      }
    } on InvalidGenerationSourceError catch (e, st) {
      result.writeln(_error(e.message));
      log.severe(
          'Error in BuiltValueGenerator for '
          '${library.element.source.fullName}.',
          e,
          st);
    } catch (e, st) {
      result.writeln(_error(e.toString()));
      log.severe(
          'Unknown error in BuiltValueGenerator for '
          '${library.element.source.fullName}.',
          e,
          st);
    }

    for (final element in library.allElements) {
      if (element is ClassElement &&
          ValueSourceClass.needsBuiltValue(element)) {
        try {
          result.writeln(new ValueSourceClass(element).generateCode() ?? '');
        } catch (e, st) {
          result.writeln(_error(e));
          log.severe('Error in BuiltValueGenerator for $element.', e, st);
        }
      }
    }

    if (result.isNotEmpty) {
      return '$result\n'
          '// ignore_for_file: always_put_control_body_on_new_line\n'
          '// ignore_for_file: annotate_overrides\n'
          '// ignore_for_file: avoid_as\n'
          '// ignore_for_file: avoid_annotating_with_dynamic\n'
          '// ignore_for_file: avoid_catches_without_on_clauses\n'
          '// ignore_for_file: avoid_returning_this\n'
          '// ignore_for_file: lines_longer_than_80_chars\n'
          '// ignore_for_file: omit_local_variable_types\n'
          '// ignore_for_file: prefer_expression_function_bodies\n'
          '// ignore_for_file: sort_constructors_first\n'
          '// ignore_for_file: unnecessary_const\n'
          '// ignore_for_file: unnecessary_new\n'
          '// ignore_for_file: test_types_in_equals\n'
          '\n';
    } else {
      return null;
    }
  }
}

String _error(Object error) {
  final lines = '$error'.split('\n');
  final indented = lines.skip(1).map((l) => '//        $l'.trim()).join('\n');
  return '// Error: ${lines.first}\n$indented';
}
