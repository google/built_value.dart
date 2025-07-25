// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'dart_types.dart';
import 'field_mixin.dart';
import 'fields.dart' show collectFields;
import 'fixes.dart';
import 'metadata.dart' show metadataToStringValue;
import 'parsed_library_results.dart';

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
  PropertyInducingElement2 get element;
  @override
  PropertyInducingElement2? get builderElement;

  factory ValueSourceField(
    ParsedLibraryResults parsedLibraryResults,
    BuiltValue settings,
    ParsedLibraryResult parsedLibrary,
    PropertyInducingElement2 element,
    PropertyInducingElement2? builderElement,
  ) =>
      _$ValueSourceField._(
        parsedLibraryResults: parsedLibraryResults,
        settings: settings,
        parsedLibrary: parsedLibrary,
        element: element,
        builderElement: builderElement,
      );
  ValueSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  String get type => DartTypes.getName(element.getter2!.returnType);

  @memoized
  bool get isFunctionType => type.contains('(');

  /// The [type] plus any import prefix, without any nullability suffix.
  @memoized
  String get typeWithPrefix {
    var typeFromAst = (parsedLibrary
                .getFragmentDeclaration(element.getter2!.firstFragment)!
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

  /// Returns the type with import prefix if the library fragment matches,
  /// otherwise the type with no import prefix.
  String typeInLibraryFragment(LibraryFragment? libraryFragment) {
    return libraryFragment == element.library2.firstFragment
        ? typeWithPrefix
        : type;
  }

  @memoized
  bool get isGetter => element.getter2 != null && !element.getter2!.isSynthetic;

  @memoized
  bool get hasNullableAnnotation => element.getter2!.metadata2.annotations.any(
        (metadata) => metadataToStringValue(metadata) == 'nullable',
      );

  @memoized
  bool get hasNullableType =>
      element.getter2?.returnType.nullabilitySuffix ==
      NullabilitySuffix.question;

  @memoized
  bool get hasNullableGenericType =>
      element.getter2?.returnType is TypeParameterType &&
      (element.getter2!.returnType as TypeParameterType)
              .bound
              .nullabilitySuffix ==
          NullabilitySuffix.question;

  @memoized
  bool get isNullable => hasNullableAnnotation || hasNullableType;

  @memoized
  BuiltValueField get builtValueField {
    var annotations = element.getter2!.metadata2.annotations
        .map((annotation) => annotation.computeConstantValue())
        .where(
          (value) => DartTypes.tryGetName(value?.type) == 'BuiltValueField',
        );
    if (annotations.isEmpty) return const BuiltValueField();
    var annotation = annotations.single!;
    return BuiltValueField(
      compare: annotation.getField('compare')?.toBoolValue(),
      serialize: annotation.getField('serialize')?.toBoolValue(),
      wireName: annotation.getField('wireName')?.toStringValue(),
      nestedBuilder: annotation.getField('nestedBuilder')?.toBoolValue(),
      autoCreateNestedBuilder:
          annotation.getField('autoCreateNestedBuilder')?.toBoolValue(),
    );
  }

  @memoized
  bool get builderFieldIsNormalField =>
      builderFieldExists &&
      builderElement!.getter2 != null &&
      !builderElement!.getter2!.isAbstract &&
      builderElement!.getter2!.isSynthetic;

  @memoized
  bool get builderFieldIsGetterSetterPair =>
      builderFieldExists &&
      (builderElement!.getter2 != null && builderElement!.setter2 != null);

  @memoized
  bool get builderFieldIsAbstract =>
      builderFieldExists &&
      builderElement!.getter2 != null &&
      builderElement!.getter2!.isAbstract;

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
      builderElement!.setter2?.formalParameters.first.type,
      withNullabilitySuffix: true,
    );

    if (result == null || result == 'dynamic') {
      // Go via AST to allow use of unresolvable types not yet generated;
      // this includes generated Builder types.
      result = parsedLibrary
          .getFragmentDeclaration(builderElement!.firstFragment)
          ?.node
          .parent
          ?.childEntities
          .first
          .toString();
    }

    if (result == null || result == 'dynamic') {
      result = builderElement!.setter2 != null
          ? (parsedLibrary
                  .getFragmentDeclaration(
                    builderElement!.setter2!.firstFragment,
                  )
                  ?.node as MethodDeclaration?)
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

  /// The `builderElementType` plus any import prefix.
  @memoized
  String get builderElementTypeWithPrefix {
    // If it's a real field, it's a [VariableDeclaration] which is guaranteed
    // to have parent node [VariableDeclarationList] giving the type.
    var fieldDeclaration = parsedLibrary.getFragmentDeclaration(
      builderElement!.firstFragment,
    );
    if (fieldDeclaration != null) {
      return _removeNullabilitySuffix(
        (((fieldDeclaration.node as VariableDeclaration).parent)
                    as VariableDeclarationList?)
                ?.type
                ?.toSource() ??
            'dynamic',
      );
    } else {
      // Otherwise it's an explicit getter/setter pair; get the type from the getter.
      return _removeNullabilitySuffix(
        (parsedLibrary
                    .getFragmentDeclaration(
                      builderElement!.getter2!.firstFragment,
                    )!
                    .node as MethodDeclaration)
                .returnType
                ?.toSource() ??
            'dynamic',
      );
    }
  }

  String _removeNullabilitySuffix(String type) {
    return type.endsWith('?') ? type.substring(0, type.length - 1) : type;
  }

  /// Gets the type name for the builder. Specify the library fragment to
  /// get the name for as [libraryFragment]; this affects whether an import
  /// prefix is used. Pass `null` for [libraryFragment] to just omit the prefix.
  String? typeInBuilder(LibraryFragment? libraryFragment) => builderFieldExists
      ? buildElementType
      : _toBuilderType(
          parsedLibraryResults,
          element.getter2!.returnType,
          typeInLibraryFragment(libraryFragment),
        );

  @memoized
  bool get isNestedBuilder => builderFieldExists
      ? typeInBuilder(null)?.contains('Builder') ?? false
      : (builtValueField.nestedBuilder ?? settings.nestedBuilders) &&
          DartTypes.needsNestedBuilder(
            parsedLibraryResults,
            element.getter2!.returnType,
          );

  @memoized
  bool get isAutoCreateNestedBuilder =>
      builtValueField.autoCreateNestedBuilder ??
      settings.autoCreateNestedBuilders;

  static BuiltList<ValueSourceField> fromClassElements(
    ParsedLibraryResults parsedLibraryResults,
    BuiltValue settings,
    ParsedLibraryResult parsedLibrary,
    InterfaceElement2 classElement,
    ClassElement2? builderClassElement,
  ) {
    var result = ListBuilder<ValueSourceField>();

    for (var field in collectFields(classElement)) {
      if (!field.isStatic &&
          field.getter2 != null &&
          (field.getter2!.isAbstract || field.getter2!.isSynthetic)) {
        final builderField = builderClassElement?.getField2(field.name3!);
        result.add(
          ValueSourceField(
            parsedLibraryResults,
            settings,
            parsedLibrary,
            field,
            builderField,
          ),
        );
      }
    }

    return result.build();
  }

  static String? _toBuilderType(
    ParsedLibraryResults parsedLibraryResults,
    DartType type,
    String displayName,
  ) {
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
        GeneratorError((b) => b..message = 'Make field $name a getter.'),
      );
    }

    if (type == 'dynamic') {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Make field $name have non-dynamic type. '
                'If you are already specifying a type, '
                'please make sure the type is correctly imported.',
        ),
      );
    }

    if (name.startsWith('_')) {
      result.add(
        GeneratorError(
          (b) => b..message = 'Make field $name public; remove the underscore.',
        ),
      );
    }

    // TODO(davidmorgan): tighten this up to apply to any generics.
    if (_suggestedTypes.keys.contains(type)) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Make field "$name" have type "${_suggestedTypes[type]}". '
                'The current type, "$type", is not allowed because it is mutable.',
        ),
      );
    }

    if (hasNullableAnnotation) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Remove "@nullable" from field "$name". '
                'Add "?" to the field type instead.',
        ),
      );
    }

    if (builderFieldExists) {
      var builderElementTypeOrNull = buildElementType;
      if (builderElementTypeIsNullable) builderElementTypeOrNull += '?';
      final builderType = _toBuilderType(
        parsedLibraryResults,
        element.type,
        type,
      );
      if (builderElementTypeOrNull != '$type?' &&
          (builderType == null ||
              (builderElementTypeOrNull != builderType &&
                  builderElementTypeOrNull != '$builderType?'))) {
        result.add(
          GeneratorError(
            (b) => b
              ..message = 'Make builder field $name have type: '
                  '$type? (or, if applicable, builder)',
          ),
        );
      }
    }

    if (builderFieldExists &&
        !builderFieldIsNormalField &&
        !builderFieldIsGetterSetterPair) {
      result.add(
        GeneratorError(
          (b) => b
            ..message =
                'Make builder field $name a normal field or a getter/setter '
                    'pair.',
        ),
      );
    }

    if (builderFieldExists &&
        builderFieldIsGetterSetterPair &&
        (builderElement!.getter2!.isAbstract ^
            builderElement!.setter2!.isAbstract)) {
      result.add(
        GeneratorError(
          (b) =>
              b..message = 'Explicit getter/setter pair must both be defined.',
        ),
      );
    }

    if (settings.comparableBuilders && builtValueField.nestedBuilder == true) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Make builder field $name have `nestedBuilder: false`'
                ' in order to use `comparableBuilders: true`.',
        ),
      );
    }

    return result;
  }
}
