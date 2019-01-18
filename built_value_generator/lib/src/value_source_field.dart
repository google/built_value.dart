// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/dart_types.dart';
import 'package:built_value_generator/src/fixes.dart';
import 'package:built_value_generator/src/fields.dart' show collectFields;
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;

part 'value_source_field.g.dart';

const _suggestedTypes = const <String, String>{
  'List': 'BuiltList',
  'Map': 'BuiltMap',
  'Set': 'BuiltSet',
  'ListMultimap': 'BuiltListMultimap',
  'SetMultimap': 'BuiltSetMultimap',
};

abstract class ValueSourceField
    implements Built<ValueSourceField, ValueSourceFieldBuilder> {
  BuiltValue get settings;
  ParsedLibraryResult get parsedLibrary;
  FieldElement get element;
  @nullable
  FieldElement get builderElement;

  factory ValueSourceField(
          BuiltValue settings,
          ParsedLibraryResult parsedLibrary,
          FieldElement element,
          FieldElement builderElement) =>
      new _$ValueSourceField._(
          settings: settings,
          parsedLibrary: parsedLibrary,
          element: element,
          builderElement: builderElement);
  ValueSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String get type => DartTypes.getName(element.getter.returnType);

  @memoized
  bool get isFunctionType => type.contains('(');

  /// The [type] plus any import prefix.
  @memoized
  String get typeWithPrefix {
    final typeFromAst = (parsedLibrary
                .getElementDeclaration(element.getter)
                .node as MethodDeclaration)
            ?.returnType
            ?.toSource() ??
        'dynamic';
    final typeFromElement = type;

    // If the type is a function, we can't use the element result; it is
    // formatted incorrectly.
    if (isFunctionType) return typeFromAst;

    // If the type does not have an import prefix, prefer the element result.
    // It handles inherited generics correctly.
    if (!typeFromAst.contains('.')) return typeFromElement;

    return typeFromAst;
  }

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
  bool get builderFieldIsGetterSetterPair =>
      builderFieldExists &&
      (builderElement.getter != null && builderElement.setter != null);

  @memoized
  String get buildElementType {
    // Try to get a resolved type first, it's faster.
    final result = builderElement.getter?.returnType?.displayName;
    if (result != null && result != 'dynamic') return result;
    // Go via AST to allow use of unresolvable types not yet generated.
    return parsedLibrary
            .getElementDeclaration(builderElement)
            ?.node
            ?.parent
            ?.childEntities
            ?.first
            .toString() ??
        'dynamic';
  }

  /// Gets the type name for the builder. Specify the compilation unit to
  /// get the name for as [compilationUnit]; this affects whether an import
  /// prefix is used. Pass `null` for [compilationUnit] to just omit the prefix.
  String typeInBuilder(
          CompilationUnitElement compilationUnit) =>
      builderFieldExists
          ? buildElementType
          : _toBuilderType(element.getter.returnType,
              typeInCompilationUnit(compilationUnit));

  @memoized
  bool get isNestedBuilder => builderFieldExists
      ? typeInBuilder(null).contains('Builder') ?? false
      : settings.nestedBuilders &&
          DartTypes.needsNestedBuilder(element.getter.returnType);

  static BuiltList<ValueSourceField> fromClassElements(
      BuiltValue settings,
      ParsedLibraryResult parsedLibrary,
      ClassElement classElement,
      ClassElement builderClassElement) {
    final result = new ListBuilder<ValueSourceField>();

    for (final field in collectFields(classElement)) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        final builderField = builderClassElement?.getField(field.name);
        result.add(
            new ValueSourceField(settings, parsedLibrary, field, builderField));
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

  Iterable<GeneratorError> computeErrors() {
    final result = <GeneratorError>[];

    if (!isGetter) {
      result.add(
          new GeneratorError((b) => b..message = 'Make field $name a getter.'));
    }

    if (type == 'dynamic') {
      result.add(new GeneratorError((b) => b
        ..message = 'Make field $name have non-dynamic type. '
            'If you are already specifying a type, '
            'please make sure the type is correctly imported.'));
    }

    if (name.startsWith('_')) {
      result.add(new GeneratorError((b) =>
          b..message = 'Make field $name public; remove the underscore.'));
    }

    if (_suggestedTypes.keys.contains(type)) {
      result.add(new GeneratorError((b) => b
        ..message = 'Make field "$name" have type "${_suggestedTypes[type]}". '
            'The current type, "$type", is not allowed because it is mutable.'));
    }

    if (builderFieldExists) {
      if (buildElementType != type &&
          buildElementType != _toBuilderType(element.type, type)) {
        result.add(new GeneratorError((b) => b
          ..message = 'Make builder field $name have type: '
              '$type (or, if applicable, builder)'));
      }
    }

    if (builderFieldExists &&
        !builderFieldIsNormalField &&
        !builderFieldIsGetterSetterPair) {
      result.add(new GeneratorError((b) => b
        ..message =
            'Make builder field $name a normal field or a getter/setter '
            'pair.'));
    }

    return result;
  }
}
