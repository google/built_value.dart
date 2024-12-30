// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:built_value_generator/src/enum_source_library.dart';
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:built_value_generator/src/serializer_source_library.dart';
import 'package:built_value_generator/src/value_source_class.dart';
import 'package:source_gen/source_gen.dart';

/// Generator for Enum Class and Built Values.
///
/// See https://github.com/google/built_value.dart/tree/master/example
class BuiltValueGenerator extends Generator {
  // Allow creating via `const` as well as enforces immutability here.
  const BuiltValueGenerator();

  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    var parsedLibraryResults = ParsedLibraryResults();

    // Workaround for https://github.com/google/built_value.dart/issues/941.
    LibraryElement2 libraryElement;
    var attempts = 0;
    while (true) {
      try {
        libraryElement = await buildStep.resolver.libraryFor2(
            await buildStep.resolver.assetIdForElement2(library.element2));
        parsedLibraryResults.parsedLibraryResultOrThrowingMock(libraryElement);
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
      final enumCode = EnumSourceLibrary(parsedLibraryResults, libraryElement)
          .generateCode();
      if (enumCode != null) result.writeln(enumCode);
      final serializerSourceLibrary =
          SerializerSourceLibrary(parsedLibraryResults, libraryElement);
      if (serializerSourceLibrary.needsBuiltJson ||
          serializerSourceLibrary.hasSerializers) {
        result.writeln(serializerSourceLibrary.generateCode());
      }
    } on InvalidGenerationSourceError catch (e, st) {
      result.writeln(_error(e.message));
      log.severe(
          'Error in BuiltValueGenerator for '
          '${libraryElement.firstFragment.source.fullName}.',
          e,
          st);
    } catch (e, st) {
      result.writeln(_error(e.toString()));
      log.severe(
          'Unknown error in BuiltValueGenerator for '
          '${libraryElement.firstFragment.source.fullName}.',
          e,
          st);
    }

    for (var element in libraryElement.classes) {
      if (ValueSourceClass.needsBuiltValue(element)) {
        try {
          result.writeln(
              ValueSourceClass(parsedLibraryResults, element).generateCode());
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
          'deprecated_member_use_from_same_package,'
          'type=lint';
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
