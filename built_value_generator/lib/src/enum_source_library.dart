// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.enum_source_library;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/enum_source_class.dart';
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:source_gen/source_gen.dart';

part 'enum_source_library.g.dart';

abstract class EnumSourceLibrary
    implements Built<EnumSourceLibrary, EnumSourceLibraryBuilder> {
  ParsedLibraryResults get parsedLibraryResults;
  LibraryElement2 get element;

  factory EnumSourceLibrary(
    ParsedLibraryResults parsedLibraryResults,
    LibraryElement2 element,
  ) =>
      _$EnumSourceLibrary._(
        parsedLibraryResults: parsedLibraryResults,
        element: element,
      );
  EnumSourceLibrary._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      parsedLibraryResults.parsedLibraryResultOrThrowingMock(element.library2);

  @memoized
  String get name => element.name3!;

  @memoized
  String get fileName =>
      element.firstFragment.source.shortName.replaceAll('.dart', '');

  @memoized
  String get source => element.firstFragment.source.contents.data;

  @memoized
  BuiltList<EnumSourceClass> get classes {
    var result = ListBuilder<EnumSourceClass>();

    for (var classElement in element.classes) {
      if (EnumSourceClass.needsEnumClass(classElement)) {
        result.add(EnumSourceClass(parsedLibraryResults, classElement));
      }
    }
    return result.build();
  }

  String? generateCode() {
    if (classes.isEmpty) return null;

    var errors = _computeErrors();
    if (errors.isNotEmpty) throw _makeError(errors);

    return classes.map((c) => c.generateCode()).join('\n');
  }

  Iterable<String> _computeErrors() {
    return [
      ..._checkPart(),
      ..._checkIdentifiers(),
      for (var c in classes) ...c.computeErrors(),
    ];
  }

  Iterable<String> _checkPart() {
    var expectedCode = "part '$fileName.g.dart';";
    var alternativeExpectedCode = 'part "$fileName.g.dart";';
    return source.contains(expectedCode) ||
            source.contains(alternativeExpectedCode)
        ? <String>[]
        : <String>['Import generated part: $expectedCode'];
  }

  Iterable<String> _checkIdentifiers() {
    var result = <String>[];
    var seenIdentifiers = <String>{};
    var reportedIdentifiers = <String>{};

    for (var sourceClass in classes) {
      for (var identifier in sourceClass.identifiers) {
        if (seenIdentifiers.contains(identifier) &&
            !reportedIdentifiers.contains(identifier)) {
          reportedIdentifiers.add(identifier);
          result.add(
            'Generated identifier "$identifier" is used multiple times in'
            ' $name, change to something else.',
          );
        }
        seenIdentifiers.add(identifier);
      }
    }

    return result;
  }
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  final message = StringBuffer(
    'Please make the following changes to use EnumClass:\n',
  );
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return InvalidGenerationSourceError(message.toString());
}
