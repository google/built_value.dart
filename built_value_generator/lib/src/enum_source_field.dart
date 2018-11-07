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
      new _$EnumSourceField._(parsedLibrary: parsedLibrary, element: element);
  EnumSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String get type => element.getter.returnType.displayName;

  @memoized
  BuiltValueEnumConst get settings {
    final annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => value?.type?.displayName == 'BuiltValueEnumConst');
    if (annotations.isEmpty) return const BuiltValueEnumConst();
    final annotation = annotations.single;
    return new BuiltValueEnumConst(
        wireName: annotation.getField('wireName').toStringValue());
  }

  @memoized
  String get generatedIdentifier {
    final fieldName = element.displayName;
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
    final result = new ListBuilder<EnumSourceField>();

    final enumName = classElement.displayName;
    for (final fieldElement in classElement.fields) {
      final type = fieldElement.getter.returnType.displayName;
      if (!fieldElement.isSynthetic &&
          (type == enumName || type == 'dynamic')) {
        result.add(new EnumSourceField(parsedLibrary, fieldElement));
      }
    }

    return result.build();
  }

  Iterable<String> get errors {
    final result = <String>[];

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
