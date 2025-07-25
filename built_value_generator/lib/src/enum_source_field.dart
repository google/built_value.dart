// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'dart_types.dart';

part 'enum_source_field.g.dart';

abstract class EnumSourceField
    implements Built<EnumSourceField, EnumSourceFieldBuilder> {
  ParsedLibraryResult get parsedLibrary;
  FieldElement2 get element;

  factory EnumSourceField(
    ParsedLibraryResult parsedLibrary,
    FieldElement2 element,
  ) =>
      _$EnumSourceField._(parsedLibrary: parsedLibrary, element: element);
  EnumSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String? get type => DartTypes.tryGetName(element.getter2?.returnType);

  @memoized
  BuiltValueEnumConst get settings {
    var annotations = element.metadata2.annotations
        .map((annotation) => annotation.computeConstantValue())
        .where(
          (value) => DartTypes.tryGetName(value?.type) == 'BuiltValueEnumConst',
        );
    if (annotations.isEmpty) return const BuiltValueEnumConst();
    var annotation = annotations.single!;
    return BuiltValueEnumConst(
      fallback: annotation.getField('fallback')?.toBoolValue() ?? false,
      wireName: annotation.getField('wireName')!.toStringValue(),
      // Field added in version `7.1.0`, might be missing.
      wireNumber: annotation.getField('wireNumber')?.toIntValue(),
    );
  }

  @memoized
  String get generatedIdentifier {
    var fieldName = element.displayName;
    return parsedLibrary
        .getFragmentDeclaration(element.firstFragment)!
        .node
        .toSource()
        .substring('$fieldName = '.length);
  }

  @memoized
  bool get isConst => element.isConst;

  @memoized
  bool get isStatic => element.isStatic;

  static BuiltList<EnumSourceField> fromClassElement(
    ParsedLibraryResult parsedLibrary,
    InterfaceElement2 classElement,
  ) {
    var result = ListBuilder<EnumSourceField>();

    var enumName = classElement.displayName;
    for (var fieldElement in classElement.fields2) {
      final type = DartTypes.tryGetName(fieldElement.getter2?.returnType);
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

    if (settings.wireName != null && settings.wireNumber != null) {
      result.add(
        'Specify either `wireName` or `wireNumber`, not both, on '
        'field "$name".',
      );
    }

    return result;
  }
}
