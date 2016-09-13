// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'source_field.g.dart';

BuiltSet<String> _builtCollectionNames = new BuiltSet<String>([
  'BuiltList',
  'BuiltListMultimap',
  'BuiltMap',
  'BuiltSet',
  'BuiltSetMultimap',
]);

abstract class SourceField implements Built<SourceField, SourceFieldBuilder> {
  String get name;
  String get type;
  bool get isGetter;
  bool get isNullable;
  bool get builderFieldExists;
  bool get builderFieldIsNormalField;
  String get typeInBuilder;
  bool get isNestedBuilder;

  SourceField._();
  factory SourceField([updates(SourceFieldBuilder b)]) = _$SourceField;

  factory SourceField.fromFieldElements(
      FieldElement fieldElement, FieldElement builderFieldElement) {
    final result = new SourceFieldBuilder();
    final builderFieldExists = builderFieldElement != null;
    final type = fieldElement.getter.returnType.displayName;
    result
      ..name = fieldElement.displayName
      ..type = type
      ..isGetter =
          fieldElement.getter != null && !fieldElement.getter.isSynthetic
      ..isNullable = fieldElement.getter.metadata.any(
          (metadata) => metadata.constantValue.toStringValue() == 'nullable');

    if (builderFieldExists) {
      result
        ..builderFieldExists = true
        ..builderFieldIsNormalField = builderFieldElement.getter != null &&
            !builderFieldElement.getter.isAbstract &&
            builderFieldElement.getter.isSynthetic
        ..typeInBuilder = builderFieldElement.getter?.returnType?.displayName
        ..isNestedBuilder = builderFieldElement.getter?.returnType?.displayName
                ?.contains('Builder') ??
            false;
    } else {
      result
        ..builderFieldExists = false
        ..builderFieldIsNormalField = true
        ..typeInBuilder = _toBuilderType(fieldElement.getter.returnType)
        ..isNestedBuilder = _needsNestedBuilder(fieldElement.getter.returnType);
    }
    return result.build();
  }

  static BuiltList<SourceField> fromClassElements(
      ClassElement classElement, ClassElement builderClassElement) {
    final result = new ListBuilder<SourceField>();

    for (final field in classElement.fields) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        final builderField = builderClassElement?.getField(field.name);
        result.add(new SourceField.fromFieldElements(field, builderField));
      }
    }

    return result.build();
  }

  static bool _needsNestedBuilder(DartType type) {
    return _isBuiltValue(type) || _isBuiltCollection(type);
  }

  static bool _isBuiltValue(DartType type) {
    if (type.element is! ClassElement) return false;
    return (type.element as ClassElement)
        .allSupertypes
        .any((interfaceType) => interfaceType.name == 'Built');
  }

  static bool _isBuiltCollection(DartType type) {
    return _builtCollectionNames
        .any((name) => type.displayName.startsWith('${name}<'));
  }

  static String _toBuilderType(DartType type) {
    if (_isBuiltCollection(type)) {
      return type.displayName
          .replaceFirst('Built', '')
          .replaceFirst('<', 'Builder<');
    } else if (_isBuiltValue(type)) {
      return '${type.displayName}Builder';
    } else {
      return type.displayName;
    }
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
