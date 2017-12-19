// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/dart_types.dart';
import 'package:built_value_generator/src/fields.dart' show collectFields;
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;

part 'value_source_field.g.dart';

abstract class ValueSourceField
    implements Built<ValueSourceField, ValueSourceFieldBuilder> {
  BuiltValue get settings;
  FieldElement get element;
  @nullable
  FieldElement get builderElement;

  factory ValueSourceField(BuiltValue settings, FieldElement element,
          FieldElement builderElement) =>
      new _$ValueSourceField._(
          settings: settings, element: element, builderElement: builderElement);
  ValueSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String get type => element.getter.returnType.displayName;

  /// The [type] plus any import prefix.
  @memoized
  String get typeWithPrefix =>
      (element.getter.computeNode() as MethodDeclaration)
          ?.returnType
          ?.toString() ??
      'dynamic';

  /// Returns the type with import prefix if the compilation unit matches,
  /// otherwise the type with no import prefix.
  String typeInCompilationUnit(CompilationUnitElement compilationUnitElement) {
    return compilationUnitElement == element.library.definingCompilationUnit
        ? typeWithPrefix
        : type;
  }

  @memoized
  bool get isGetter => element.getter != null && !element.getter.isSynthetic;

  @memoized
  bool get isNullable => element.getter.metadata
      .any((metadata) => metadataToStringValue(metadata) == 'nullable');

  @memoized
  BuiltValueField get builtValueField {
    final annotations = element.getter.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => value?.type?.displayName == 'BuiltValueField');
    if (annotations.isEmpty) return const BuiltValueField();
    final annotation = annotations.single;
    return new BuiltValueField(
        compare: annotation.getField('compare').toBoolValue(),
        serialize: annotation.getField('serialize').toBoolValue(),
        wireName: annotation.getField('wireName').toStringValue());
  }

  @memoized
  bool get builderFieldExists => builderElement != null;

  @memoized
  bool get builderFieldIsNormalField =>
      builderFieldExists &&
      builderElement.getter != null &&
      !builderElement.getter.isAbstract &&
      builderElement.getter.isSynthetic;

  @memoized
  String get buildElementType {
    // Try to get a resolved type first, it's faster.
    final result = builderElement.getter?.returnType?.displayName;
    if (result != null && result != 'dynamic') return result;
    // Go via AST to allow use of unresolvable types not yet generated.
    return builderElement
            ?.computeNode()
            ?.parent
            ?.childEntities
            ?.first
            .toString() ??
        'dynamic';
  }

  @memoized
  String get typeInBuilder => builderFieldExists
      ? buildElementType
      : _toBuilderType(element.getter.returnType, typeWithPrefix);

  @memoized
  bool get isNestedBuilder => builderFieldExists
      ? typeInBuilder.contains('Builder') ?? false
      : settings.nestedBuilders &&
          DartTypes.needsNestedBuilder(element.getter.returnType);

  static BuiltList<ValueSourceField> fromClassElements(BuiltValue settings,
      ClassElement classElement, ClassElement builderClassElement) {
    final result = new ListBuilder<ValueSourceField>();

    for (final field in collectFields(classElement)) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        final builderField = builderClassElement?.getField(field.name);
        result.add(new ValueSourceField(settings, field, builderField));
      }
    }

    return result.build();
  }

  static String _toBuilderType(DartType type, String displayName) {
    if (DartTypes.isBuiltCollection(type)) {
      return displayName
          .replaceFirst('Built', '')
          .replaceFirst('<', 'Builder<');
    } else if (DartTypes.isInstantiableBuiltValue(type)) {
      return displayName.contains('<')
          ? displayName.replaceFirst('<', 'Builder<')
          : '${displayName}Builder';
    } else {
      return displayName;
    }
  }

  Iterable<String> computeErrors() {
    final result = <String>[];

    if (!isGetter) {
      result.add('Make field $name a getter.');
    }

    if (type == 'dynamic') {
      result.add('Make field $name have non-dynamic type. '
          'If you are already specifying a type, '
          'please make sure the type is correctly imported.');
    }

    if (name.startsWith('_')) {
      result.add('Make field $name public; remove the underscore.');
    }

    if (builderFieldExists &&
        type != typeInBuilder &&
        // TODO(davidmorgan): smarter check for builder types.
        type.replaceAll('Built', '') !=
            typeInBuilder.replaceAll('Builder', '')) {
      result.add('Make builder field $name have type: '
          '$type (or, if applicable, builder)');
    }

    if (builderFieldExists && !builderFieldIsNormalField) {
      result.add('Make builder field $name a normal field.');
    }

    return result;
  }
}
