// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.11

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
    // Workaround for https://github.com/google/built_value.dart/issues/941.
    LibraryElement libraryElement;
    var attempts = 0;
    while (true) {
      try {
        libraryElement = await buildStep.resolver.libraryFor(
            await buildStep.resolver.assetIdForElement(library.element));
        libraryElement.session.getParsedLibraryByElement(libraryElement);
        break;
      } catch (_) {
        ++attempts;
        if (attempts == 10) {
          log.severe('Analysis session did not stabilize after ten tries!');
          return null;
        }
      }
    }

    var result = StringBuffer();
    try {
      final enumCode = EnumSourceLibrary(libraryElement).generateCode();
      if (enumCode != null) result.writeln(enumCode);
      final serializerSourceLibrary = SerializerSourceLibrary(libraryElement);
      if (serializerSourceLibrary.needsBuiltJson ||
          serializerSourceLibrary.hasSerializers) {
        result.writeln(serializerSourceLibrary.generateCode());
      }
    } on InvalidGenerationSourceError catch (e, st) {
      result.writeln(_error(e.message));
      log.severe(
          'Error in BuiltValueGenerator for '
          '${libraryElement.source.fullName}.',
          e,
          st);
    } catch (e, st) {
      result.writeln(_error(e.toString()));
      log.severe(
          'Unknown error in BuiltValueGenerator for '
          '${libraryElement.source.fullName}.',
          e,
          st);
    }

    for (var element in libraryElement.units.expand((unit) => unit.types)) {
      if (ValueSourceClass.needsBuiltValue(element)) {
        try {
          result.writeln(ValueSourceClass(element).generateCode() ?? '');
        } catch (e, st) {
          result.writeln(_error(e));
          log.severe('Error in BuiltValueGenerator for $element.', e, st);
        }
      }
    }

    if (result.isNotEmpty) {
      return '$result'
          '\n'
          '// ignore_for_file: '
          'always_put_control_body_on_new_line,'
          'always_specify_types,'
          'annotate_overrides,'
          'avoid_annotating_with_dynamic,'
          'avoid_as,'
          'avoid_catches_without_on_clauses,'
          'avoid_returning_this,'
          'lines_longer_than_80_chars,'
          'omit_local_variable_types,'
          'prefer_expression_function_bodies,'
          'sort_constructors_first,'
          'test_types_in_equals,'
          'unnecessary_const,'
          'unnecessary_new';
    } else {
      return null;
    }
  }
}

String _error(Object error) {
  var lines = '$error'.split('\n');
  var indented = lines.skip(1).map((l) => '//        $l'.trim()).join('\n');
  return '// Error: ${lines.first}\n$indented';
}
