// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'source_field.g.dart';

abstract class SourceField implements Built<SourceField, SourceFieldBuilder> {
  String get name;
  String get type;
  bool get isGetter;
  bool get isNullable;
  bool get builderFieldExists;
  bool get builderFieldIsNormalField;
  @nullable
  String get typeInBuilder;
  bool get isNestedBuilder;

  SourceField._();
  factory SourceField([updates(SourceFieldBuilder b)]) = _$SourceField;

  factory SourceField.fromFieldElements(
      FieldElement fieldElement, FieldElement builderFieldElement) {
    return new SourceField((b) => b
      ..name = fieldElement.displayName
      ..type = fieldElement.getter.returnType.displayName
      ..typeInBuilder = builderFieldElement?.getter?.returnType?.displayName
      ..isGetter =
          fieldElement.getter != null && !fieldElement.getter.isSynthetic
      ..isNullable = fieldElement.getter.metadata.any(
          (metadata) => metadata.constantValue.toStringValue() == 'nullable')
      ..builderFieldExists = builderFieldElement != null
      ..builderFieldIsNormalField = builderFieldElement != null &&
          builderFieldElement.getter != null &&
          !builderFieldElement.getter.isAbstract &&
          builderFieldElement.getter.isSynthetic
      ..isNestedBuilder = builderFieldElement?.getter?.returnType?.displayName
              ?.contains('Builder') ??
          false);
  }

  static BuiltList<SourceField> fromClassElements(
      ClassElement classElement, ClassElement builderClassElement) {
    final result = new ListBuilder<SourceField>();

    for (final field in classElement.fields) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        final builderField = builderClassElement.getField(field.name);
        result.add(new SourceField.fromFieldElements(field, builderField));
      }
    }

    return result.build();
  }

  Iterable<String> computeErrors() {
    final result = <String>[];

    if (!isGetter) {
      result.add('Make field $name a getter.');
    }

    if (builderFieldExists &&
        type != typeInBuilder &&
        // TODO(davidmorgan): smarter check for builder types.
        type.replaceAll('Built', '') !=
            typeInBuilder.replaceAll('Builder', '')) {
      result.add('Make builder field $name have type: $type');
    }

    if (builderFieldExists && !builderFieldIsNormalField) {
      result.add('Make builder field $name a normal field.');
    }

    return result;
  }

  /*static BuiltList<SourceField> fromBuilderClassElement(
      ClassElement classElement) {
    final result = new ListBuilder<SourceField>();

    for (final field in classElement.fields) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        result.add(new SourceField.fromFieldElement(field));
      }
    }

    return result.build();
  }*/
}

abstract class SourceFieldBuilder
    implements Builder<SourceField, SourceFieldBuilder> {
  String name;
  String type;
  bool isGetter;
  bool isNullable;
  bool builderFieldExists;
  bool builderFieldIsNormalField;
  String typeInBuilder;
  bool isNestedBuilder;

  SourceFieldBuilder._();
  factory SourceFieldBuilder() = _$SourceFieldBuilder;
}
