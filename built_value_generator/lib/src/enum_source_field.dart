// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.enum_source_field;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'enum_source_field.g.dart';

abstract class EnumSourceField
    implements Built<EnumSourceField, EnumSourceFieldBuilder> {
  ParsedLibraryResult get parsedLibrary;
  FieldElement get element;

  factory EnumSourceField(
          ParsedLibraryResult parsedLibrary, FieldElement element) =>
      _$EnumSourceField._(parsedLibrary: parsedLibrary, element: element);
  EnumSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String get type => element.getter.returnType.displayName;

  @memoized
  BuiltValueEnumConst get settings {
    var annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => value?.type?.displayName == 'BuiltValueEnumConst');
    if (annotations.isEmpty) return const BuiltValueEnumConst();
    var annotation = annotations.single;
    return BuiltValueEnumConst(
        fallback: annotation.getField('fallback')?.toBoolValue() ?? false,
        wireName: annotation.getField('wireName').toStringValue());
  }

  @memoized
  String get generatedIdentifier {
    var fieldName = element.displayName;
    return parsedLibrary
        .getElementDeclaration(element)
        .node
        .toSource()
        .substring('$fieldName = '.length);
  }

  @memoized
  bool get isConst => element.isConst;

  @memoized
  bool get isStatic => element.isStatic;

  static BuiltList<EnumSourceField> fromClassElement(
      ParsedLibraryResult parsedLibrary, ClassElement classElement) {
    var result = ListBuilder<EnumSourceField>();

    var enumName = classElement.displayName;
    for (var fieldElement in classElement.fields) {
      final type = fieldElement.getter.returnType.displayName;
      if (!fieldElement.isSynthetic &&
          (type == enumName || type == 'dynamic')) {
        result.add(EnumSourceField(parsedLibrary, fieldElement));
      }
    }

    return result.build();
  }

  Iterable<String> get errors {
    var result = <String>[];

    if (type == 'dynamic') {
      result.add('Specify a type for field "$name".');
    } else if (!isConst && !isStatic) {
      result.add('Make field "$name" static const.');
    } else if (!isConst) {
      result.add('Make field "$name" const.');
    } else if (!generatedIdentifier.startsWith('_\$')) {
      result.add('Initialize field "$name" with a value starting "_\$".');
    }

    return result;
  }
}
