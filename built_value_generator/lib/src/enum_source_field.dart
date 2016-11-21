// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.enum_source_field;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/src/list.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

part 'enum_source_field.g.dart';

abstract class EnumSourceField
    implements Built<EnumSourceField, EnumSourceFieldBuilder> {
  String get name;
  String get type;
  String get generatedIdentifier;
  bool get isConst;
  bool get isStatic;

  EnumSourceField._();
  factory EnumSourceField([updates(EnumSourceFieldBuilder b)]) =
      _$EnumSourceField;

  factory EnumSourceField.fromFieldElement(FieldElement fieldElement) {
    return new EnumSourceField((b) => b
      ..name = fieldElement.displayName
      ..type = fieldElement.getter.returnType.displayName
      ..generatedIdentifier = _getGeneratedIdentifier(fieldElement)
      ..isConst = fieldElement.isConst
      ..isStatic = fieldElement.isStatic);
  }

  static String _getGeneratedIdentifier(FieldElement field) {
    final fieldName = field.displayName;
    return field.computeNode().toString().substring('$fieldName = '.length);
  }

  static BuiltList<EnumSourceField> fromClassElement(
      ClassElement classElement) {
    final result = new ListBuilder<EnumSourceField>();

    final enumName = classElement.displayName;
    for (final fieldElement in classElement.fields) {
      final type = fieldElement.getter.returnType.displayName;
      if (!fieldElement.isSynthetic &&
          (type == enumName || type == 'dynamic')) {
        result.add(new EnumSourceField.fromFieldElement(fieldElement));
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
