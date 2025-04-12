// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/dart_types.dart';
import 'package:built_value_generator/src/field_mixin.dart';
import 'package:built_value_generator/src/fields.dart' show collectFields;
import 'package:built_value_generator/src/fixes.dart';
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;
import 'package:built_value_generator/src/parsed_library_results.dart';

part 'value_source_field.g.dart';

const _suggestedTypes = <String, String>{
  'List<dynamic>': 'BuiltList',
  'Map<dynamic, dynamic>': 'BuiltMap',
  'Set<dynamic>': 'BuiltSet',
  'ListMultimap<dynamic, dynamic>': 'BuiltListMultimap',
  'SetMultimap<dynamic, dynamic>': 'BuiltSetMultimap',
};

abstract class ValueSourceField
    with FieldMixin
    implements Built<ValueSourceField, ValueSourceFieldBuilder> {
  ParsedLibraryResults get parsedLibraryResults;
  BuiltValue get settings;
  @override
  ParsedLibraryResult get parsedLibrary;
  FieldElement get element;
  @override
  FieldElement? get builderElement;

  factory ValueSourceField(
          ParsedLibraryResults parsedLibraryResults,
          BuiltValue settings,
          ParsedLibraryResult parsedLibrary,
          FieldElement element,
          FieldElement? builderElement) =>
      _$ValueSourceField._(
          parsedLibraryResults: parsedLibraryResults,
          settings: settings,
          parsedLibrary: parsedLibrary,
          element: element,
          builderElement: builderElement);
  ValueSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String get type => DartTypes.getName(element.getter!.returnType);

  @memoized
  bool get isFunctionType => type.contains('(');

  /// The [type] plus any import prefix, without any nullability suffix.
  @memoized
  String get typeWithPrefix {
    var typeFromAst = (parsedLibrary
                .getElementDeclaration(element.getter!)!
                .node as MethodDeclaration)
            .returnType
            ?.toSource() ??
        'dynamic';
    if (typeFromAst.endsWith('?')) {
      typeFromAst = typeFromAst.substring(0, typeFromAst.length - 1);
    }
    var typeFromElement = type;

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
  String typeInCompilationUnit(CompilationUnitElement? compilationUnitElement) {
    return compilationUnitElement == element.library.definingCompilationUnit
        ? typeWithPrefix
        : type;
  }

  @memoized
  bool get isGetter => element.getter != null && !element.getter!.isSynthetic;

  @memoized
  bool get hasNullableAnnotation => element.getter!.metadata
      .any((metadata) => metadataToStringValue(metadata) == 'nullable');

  @memoized
  bool get hasNullableType =>
      element.getter?.returnType.nullabilitySuffix ==
      NullabilitySuffix.question;

  @memoized
  bool get hasGenericType =>
      element.getter?.returnType is TypeParameterType;

  @memoized
  bool get isNullable => hasNullableAnnotation || hasNullableType;

  @memoized
  BuiltValueField get builtValueField {
    var annotations = element.getter!.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where(
            (value) => DartTypes.tryGetName(value?.type) == 'BuiltValueField');
    if (annotations.isEmpty) return const BuiltValueField();
    var annotation = annotations.single!;
    return BuiltValueField(
        compare: annotation.getField('compare')?.toBoolValue(),
        serialize: annotation.getField('serialize')?.toBoolValue(),
        wireName: annotation.getField('wireName')?.toStringValue(),
        nestedBuilder: annotation.getField('nestedBuilder')?.toBoolValue(),
        autoCreateNestedBuilder:
            annotation.getField('autoCreateNestedBuilder')?.toBoolValue());
  }

  @memoized
  bool get builderFieldIsNormalField =>
      builderFieldExists &&
      builderElement!.getter != null &&
      !builderElement!.getter!.isAbstract &&
      builderElement!.getter!.isSynthetic;

  @memoized
  bool get builderFieldIsGetterSetterPair =>
      builderFieldExists &&
      (builderElement!.getter != null && builderElement!.setter != null);

  @memoized
  bool get builderFieldIsAbstract =>
      builderFieldExists &&
      builderElement!.getter != null &&
      builderElement!.getter!.isAbstract;

  @memoized
  @override
  String get fullBuildElementType => super.fullBuildElementType;

  @memoized
  String get buildElementType {
    var result = fullBuildElementType;
    // If we went via the AST there may be an import prefix, but we don't
    // want one here. Strip it off.
    if (result.contains('.')) {
      result = result.substring(result.indexOf('.') + 1);
    }
    return _removeNullabilitySuffix(result);
  }

  bool get builderElementTypeIsNullable => fullBuildElementType.endsWith('?');

  bool get builderElementSetterIsNullable {
    if (!builderFieldExists) return false;

    // Try to get a resolved type first, it's faster.
    var result = DartTypes.tryGetName(
        builderElement!.setter?.parameters.first.type,
        withNullabilitySuffix: true);

    if (result == null || result == 'dynamic') {
      // Go via AST to allow use of unresolvable types not yet generated;
      // this includes generated Builder types.
      result = parsedLibrary
          .getElementDeclaration(builderElement!)
          ?.node
          .parent
          ?.childEntities
          .first
          .toString();
    }

    if (result == null || result == 'dynamic') {
      result = builderElement!.setter != null
          ? (parsedLibrary.getElementDeclaration(builderElement!.setter!)?.node
                  as MethodDeclaration?)
              ?.parameters!
              .parameters
              .first
              .childEntities
              .first
              .toString()
          : null;
    }

    return result?.endsWith('?') ?? false;
  }

  /// The [builderElementType] plus any import prefix.
  @memoized
  String get builderElementTypeWithPrefix {
    // If it's a real field, it's a [VariableDeclaration] which is guaranteed
    // to have parent node [VariableDeclarationList] giving the type.
    var fieldDeclaration = parsedLibrary.getElementDeclaration(builderElement!);
    if (fieldDeclaration != null) {
      return _removeNullabilitySuffix(
          (((fieldDeclaration.node as VariableDeclaration).parent)
                      as VariableDeclarationList?)
                  ?.type
                  ?.toSource() ??
              'dynamic');
    } else {
      // Otherwise it's an explicit getter/setter pair; get the type from the getter.
      return _removeNullabilitySuffix((parsedLibrary
                  .getElementDeclaration(builderElement!.getter!)!
                  .node as MethodDeclaration)
              .returnType
              ?.toSource() ??
          'dynamic');
    }
  }

  String _removeNullabilitySuffix(String type) {
    return type.endsWith('?') ? type.substring(0, type.length - 1) : type;
  }

  /// Gets the type name for the builder. Specify the compilation unit to
  /// get the name for as [compilationUnit]; this affects whether an import
  /// prefix is used. Pass `null` for [compilationUnit] to just omit the prefix.
  String? typeInBuilder(CompilationUnitElement? compilationUnit) =>
      builderFieldExists
          ? buildElementType
          : _toBuilderType(parsedLibraryResults, element.getter!.returnType,
              typeInCompilationUnit(compilationUnit));

  @memoized
  bool get isNestedBuilder => builderFieldExists
      ? typeInBuilder(null)?.contains('Builder') ?? false
      : (builtValueField.nestedBuilder ?? settings.nestedBuilders) &&
          DartTypes.needsNestedBuilder(
              parsedLibraryResults, element.getter!.returnType);

  @memoized
  bool get isAutoCreateNestedBuilder =>
      builtValueField.autoCreateNestedBuilder ??
      settings.autoCreateNestedBuilders;

  static BuiltList<ValueSourceField> fromClassElements(
      ParsedLibraryResults parsedLibraryResults,
      BuiltValue settings,
      ParsedLibraryResult parsedLibrary,
      InterfaceElement classElement,
      ClassElement? builderClassElement) {
    var result = ListBuilder<ValueSourceField>();

    for (var field in collectFields(classElement)) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter!.isAbstract || field.getter!.isSynthetic)) {
        final builderField = builderClassElement?.getField(field.name);
        result.add(ValueSourceField(parsedLibraryResults, settings,
            parsedLibrary, field, builderField));
      }
    }

    return result.build();
  }

  static String? _toBuilderType(ParsedLibraryResults parsedLibraryResults,
      DartType type, String displayName) {
    if (DartTypes.isBuiltCollection(type)) {
      return displayName
          .replaceFirst('Built', '')
          .replaceFirst('<', 'Builder<');
    } else if (DartTypes.isInstantiableBuiltValue(parsedLibraryResults, type)) {
      return displayName.contains('<')
          ? displayName.replaceFirst('<', 'Builder<')
          : '${displayName}Builder';
    } else {
      return displayName;
    }
  }

  Iterable<GeneratorError> computeErrors() {
    var result = <GeneratorError>[];

    if (!isGetter) {
      result.add(
          GeneratorError((b) => b..message = 'Make field $name a getter.'));
    }

    if (type == 'dynamic') {
      result.add(GeneratorError((b) => b
        ..message = 'Make field $name have non-dynamic type. '
            'If you are already specifying a type, '
            'please make sure the type is correctly imported.'));
    }

    if (name.startsWith('_')) {
      result.add(GeneratorError((b) =>
          b..message = 'Make field $name public; remove the underscore.'));
    }

    // TODO(davidmorgan): tighten this up to apply to any generics.
    if (_suggestedTypes.keys.contains(type)) {
      result.add(GeneratorError((b) => b
        ..message = 'Make field "$name" have type "${_suggestedTypes[type]}". '
            'The current type, "$type", is not allowed because it is mutable.'));
    }

    if (hasNullableAnnotation) {
      result.add(GeneratorError((b) => b
        ..message = 'Remove "@nullable" from field "$name". '
            'Add "?" to the field type instead.'));
    }

    if (builderFieldExists) {
      var builderElementTypeOrNull = buildElementType;
      if (builderElementTypeIsNullable) builderElementTypeOrNull += '?';
      final builderType =
          _toBuilderType(parsedLibraryResults, element.type, type);
      if (builderElementTypeOrNull != type + '?' &&
          (builderType == null ||
              (builderElementTypeOrNull != builderType &&
                  builderElementTypeOrNull != builderType + '?'))) {
        result.add(GeneratorError((b) => b
          ..message = 'Make builder field $name have type: '
              '$type? (or, if applicable, builder)'));
      }
    }

    if (builderFieldExists &&
        !builderFieldIsNormalField &&
        !builderFieldIsGetterSetterPair) {
      result.add(GeneratorError((b) => b
        ..message =
            'Make builder field $name a normal field or a getter/setter '
                'pair.'));
    }

    if (builderFieldExists &&
        builderFieldIsGetterSetterPair &&
        (builderElement!.getter!.isAbstract ^
            builderElement!.setter!.isAbstract)) {
      result.add(GeneratorError((b) =>
          b..message = 'Explicit getter/setter pair must both be defined.'));
    }

    if (settings.comparableBuilders && builtValueField.nestedBuilder == true) {
      result.add(GeneratorError((b) => b
        ..message = 'Make builder field $name have `nestedBuilder: false`'
            ' in order to use `comparableBuilders: true`.'));
    }

    return result;
  }
}
