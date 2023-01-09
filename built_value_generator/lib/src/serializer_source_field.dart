// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
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
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;
import 'package:built_value_generator/src/strings.dart';

part 'serializer_source_field.g.dart';

abstract class SerializerSourceField
    with FieldMixin
    implements Built<SerializerSourceField, SerializerSourceFieldBuilder> {
  static final BuiltMap<String, String> typesWithBuilder =
      BuiltMap<String, String>({
    'BuiltList': 'ListBuilder',
    'BuiltListMultimap': 'ListMultimapBuilder',
    'BuiltMap': 'MapBuilder',
    'BuiltSet': 'SetBuilder',
    'BuiltSetMultimap': 'SetMultimapBuilder',
  });
  BuiltValue get settings;
  @override
  ParsedLibraryResult get parsedLibrary;
  FieldElement get element;
  @override
  FieldElement? get builderElement;

  factory SerializerSourceField(
          BuiltValue settings,
          ParsedLibraryResult parsedLibrary,
          FieldElement element,
          FieldElement? builderElement) =>
      _$SerializerSourceField._(
          settings: settings,
          parsedLibrary: parsedLibrary,
          element: element,
          builderElement: builderElement);
  SerializerSourceField._();

  @memoized
  bool get isSerializable =>
      element.getter != null &&
      element.getter!.isAbstract &&
      !element.isStatic &&
      (builtValueField.serialize ?? settings.defaultSerialize);

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
  bool get isNonNullByDefault => element.library.isNonNullableByDefault;

  @memoized
  String get orNull => isNonNullByDefault ? '?' : '';

  @memoized
  bool get hasNullableAnnotation => element.getter!.metadata
      .any((metadata) => metadataToStringValue(metadata) == 'nullable');

  @memoized
  bool get hasNullableType =>
      element.getter?.returnType.nullabilitySuffix ==
      NullabilitySuffix.question;

  @memoized
  bool get isNullable => hasNullableAnnotation || hasNullableType;

  @memoized
  String get name => element.displayName;

  @memoized
  String get wireName => builtValueField.wireName ?? name;

  @memoized
  String get type => stripNullabilitySuffix(typeWithNullabilitySuffix);

  @memoized
  String get typeWithNullabilitySuffix =>
      DartTypes.getName(element.getter!.returnType,
          withNullabilitySuffix: true);

  /// The [type] plus any import prefix, with any nullability suffix.
  @memoized
  String get typeWithPrefix =>
      stripNullabilitySuffix(typeWithPrefixAndNullabilitySuffix);

  /// The [type] plus any import prefix, without any nullability suffix.
  @memoized
  String get typeWithPrefixAndNullabilitySuffix {
    var declaration = parsedLibrary.getElementDeclaration(element.getter!)!;
    var typeFromAst =
        (declaration.node as MethodDeclaration).returnType?.toString() ??
            'dynamic';
    var typeFromElement = typeWithNullabilitySuffix;

    // If the type is a function, we can't use the element result; it is
    // formatted incorrectly.
    if (typeFromElement.contains('(')) return typeFromAst;

    // If the type does not have an import prefix, prefer the element result.
    // It handles inherited generics correctly.
    if (!typeFromAst.contains('.')) return typeFromElement;

    return typeFromAst;
  }

  /// Returns the type with import prefix if the compilation unit matches,
  /// otherwise the type with no import prefix.
  String typeInCompilationUnit(CompilationUnitElement compilationUnitElement) =>
      stripNullabilitySuffix(
          typeInCompilationUnitWithNullabilitySuffix(compilationUnitElement));

  /// Returns the type with import prefix if the compilation unit matches,
  /// otherwise the type with no import prefix.
  String typeInCompilationUnitWithNullabilitySuffix(
      CompilationUnitElement compilationUnitElement) {
    return compilationUnitElement == element.library.definingCompilationUnit
        ? typeWithPrefixAndNullabilitySuffix
        : typeWithNullabilitySuffix;
  }

  @memoized
  bool get builderFieldElementIsValid =>
      (builderElement?.getter?.isAbstract == false) &&
      !builderElement!.isStatic;

  @memoized
  bool get builderFieldUsesNestedBuilder {
    // If the builder is present, check it to determine whether a nested
    // builder is needed. Otherwise, use the same logic as built_value when
    // it decides whether to use a nested builder.
    return builderFieldElementIsValid
        ? DartTypes.getName(element.getter!.returnType) !=
            DartTypes.getName(builderElement!.getter!.returnType)
        : (builtValueField.nestedBuilder ?? settings.nestedBuilders) &&
            DartTypes.needsNestedBuilder(element.getter!.returnType);
  }

  @memoized
  @override
  String get fullBuildElementType => super.fullBuildElementType;

  @memoized
  bool get builderFieldIsNullable {
    if (!isNonNullByDefault) return true;
    if (!builderFieldElementIsValid) return true;

    return fullBuildElementType == 'dynamic' ||
        fullBuildElementType.endsWith('?');
  }

  @memoized
  bool get builderFieldAutoCreatesNestedBuilder =>
      builtValueField.autoCreateNestedBuilder ??
      settings.autoCreateNestedBuilders;

  @memoized
  String get rawType => _getBareType(type);

  String generateFullType(CompilationUnitElement compilationUnit,
      [BuiltSet<String>? classGenericParameters]) {
    return _generateFullType(
        typeInCompilationUnitWithNullabilitySuffix(compilationUnit),
        classGenericParameters ?? BuiltSet<String>());
  }

  @memoized
  bool get needsBuilder =>
      DartTypes.getName(element.getter!.returnType).contains('<') &&
      DartTypes.isBuilt(element.getter!.returnType);

  Iterable<String> computeErrors() {
    if (isSerializable && element.getter!.returnType is FunctionType) {
      return [
        'Function fields are not serializable. '
            'Remove "$name" or mark it "@BuiltValueField(serialize: false)".'
      ];
    }

    return [];
  }

  /// Generates a cast using 'as' to this field type.
  ///
  /// Generics are cast to the bound of the generic. If there is no bound,
  /// no cast is needed, and an empty string is returned.
  ///
  /// Set [forReplace] to loosen generics of cast where possible for calling
  /// a `replace` method.
  String generateCast(CompilationUnitElement compilationUnit,
      BuiltMap<String, String> classGenericBounds,
      {bool forReplace = false}) {
    var result = _generateCast(
        typeInCompilationUnit(compilationUnit), classGenericBounds,
        forReplace: forReplace);
    return result == 'Object' ? '' : 'as $result';
  }

  String generateBuilder() {
    var bareType = _getBareType(type);
    if (typesWithBuilder.containsKey(bareType)) {
      return 'new ${typesWithBuilder[bareType]}<${_getGenerics(type)}>()';
    } else {
      return 'new ${bareType}Builder<${_getGenerics(type)}>()';
    }
  }

  static String _generateFullType(
      String type, BuiltSet<String> classGenericParameters,
      {bool includeNullability = false}) {
    var bareType = _getBareType(type);
    var generics = _getGenerics(type);
    var genericItems = _splitOnTopLevelCommas(generics);
    var maybeNullability =
        includeNullability && type.endsWith('?') ? '.nullable' : '';

    if (generics.isEmpty) {
      if (classGenericParameters.contains(bareType)) {
        return 'parameter$bareType';
      }
      return 'const FullType$maybeNullability($bareType)';
    } else {
      final parameterFullTypes = genericItems.map((item) => _generateFullType(
          item, classGenericParameters,
          includeNullability: true));
      final canUseConst =
          parameterFullTypes.every((param) => param.startsWith('const '));
      final constOrNew = canUseConst ? 'const' : 'new';
      final constOrEmpty = canUseConst ? 'const' : '';
      return '$constOrNew FullType$maybeNullability('
          '$bareType, $constOrEmpty [${parameterFullTypes.join(', ')}])';
    }
  }

  String _generateCast(String type, BuiltMap<String, String> classGenericBounds,
      {bool topLevel = true, bool forReplace = false}) {
    var resultNullabilitySuffix = (!topLevel && type.endsWith('?')) ? '?' : '';
    var bareType = _getBareType(type);

    // `built_collection` `replace` methods don't care about the full generic
    // type, so we can be less precise about the cast. This doesn't add any
    // particular value for vanilla `built_value` but it allows plugging in
    // serializers that don't get the generic types correct.
    //
    // Only if `forReplace` was passed.
    String generics;
    if (forReplace &&
        topLevel &&
        DartTypes.isBuiltCollectionTypeName(bareType) &&
        builderFieldUsesNestedBuilder) {
      if (bareType == 'BuiltList' || bareType == 'BuiltSet') {
        generics = 'Object$orNull';
      } else if (bareType == 'BuiltMap' ||
          bareType == 'BuiltListMultimap' ||
          bareType == 'BuiltSetMultimap') {
        // Map `replace` methods are even more generous so that they can accept
        // a `Map` or a `BuiltMap`. So, we can just pass `Object`.
        return 'Object';
      } else {
        throw UnsupportedError('Bare type is a built_collection type, but not '
            'one of the known built_collection types: $bareType.');
      }
    } else {
      generics = _getGenerics(type);
    }

    var genericItems = _splitOnTopLevelCommas(generics);

    if (generics.isEmpty) {
      if (classGenericBounds.keys.contains(bareType)) {
        return classGenericBounds[bareType]!;
      }
      return bareType + resultNullabilitySuffix;
    } else {
      final parameterFullTypes = genericItems
          .map((item) =>
              _generateCast(item, classGenericBounds, topLevel: false))
          .join(', ');
      return '$bareType<$parameterFullTypes>$resultNullabilitySuffix';
    }
  }

  static String _getBareType(String name) {
    var genericsStart = name.indexOf('<');
    var result = genericsStart == -1 ? name : name.substring(0, genericsStart);
    if (result.endsWith('?')) result = result.substring(0, result.length - 1);
    return result;
  }

  static String _getGenerics(String name) {
    var genericsStart = name.indexOf('<');
    var hasNullableSuffix = name.endsWith('?');
    return genericsStart == -1
        ? ''
        : name.substring(genericsStart + 1).substring(
            0, name.length - genericsStart - 2 - (hasNullableSuffix ? 1 : 0));
  }

  /// Splits a generic parameter string on top level commas; that means
  /// commas nested inside '<' and '>' are ignored.
  static BuiltList<String> _splitOnTopLevelCommas(String string) {
    var result = ListBuilder<String>();
    var accumulator = StringBuffer();
    var depth = 0;
    for (var i = 0; i != string.length; ++i) {
      if (string[i] == '<') ++depth;
      if (string[i] == '>') --depth;

      if (string[i] == ',' && depth == 0) {
        result.add(accumulator.toString().trim());
        accumulator.clear();
      } else {
        accumulator.write(string[i]);
      }
    }
    if (accumulator.isNotEmpty) {
      result.add(accumulator.toString().trim());
    }
    return result.build();
  }
}
