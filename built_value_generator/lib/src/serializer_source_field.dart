// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
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
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;

part 'serializer_source_field.g.dart';

abstract class SerializerSourceField
    implements Built<SerializerSourceField, SerializerSourceFieldBuilder> {
  static final BuiltMap<String, String> typesWithBuilder =
      new BuiltMap<String, String>({
    'BuiltList': 'ListBuilder',
    'BuiltListMultimap': 'ListMultimapBuilder',
    'BuiltMap': 'MapBuilder',
    'BuiltSet': 'SetBuilder',
    'BuiltSetMultimap': 'SetMultimapBuilder',
  });
  BuiltValue get settings;
  ParsedLibraryResult get parsedLibrary;
  FieldElement get element;
  @nullable
  FieldElement get builderElement;

  factory SerializerSourceField(
          BuiltValue settings,
          ParsedLibraryResult parsedLibrary,
          FieldElement element,
          FieldElement builderElement) =>
      new _$SerializerSourceField._(
          settings: settings,
          parsedLibrary: parsedLibrary,
          element: element,
          builderElement: builderElement);
  SerializerSourceField._();

  @memoized
  bool get isSerializable =>
      element.getter != null &&
      element.getter.isAbstract &&
      !element.isStatic &&
      builtValueField.serialize;

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
  bool get isNullable => element.getter.metadata
      .any((metadata) => metadataToStringValue(metadata) == 'nullable');

  @memoized
  String get name => element.displayName;

  @memoized
  String get wireName => builtValueField.wireName ?? name;

  @memoized
  String get type => element.getter.returnType.displayName;

  /// The [type] plus any import prefix.
  @memoized
  String get typeWithPrefix {
    final declaration = parsedLibrary.getElementDeclaration(element.getter);
    final typeFromAst =
        (declaration.node as MethodDeclaration)?.returnType?.toString() ??
            'dynamic';
    final typeFromElement = type;

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
  String typeInCompilationUnit(CompilationUnitElement compilationUnitElement) {
    return compilationUnitElement == element.library.definingCompilationUnit
        ? typeWithPrefix
        : type;
  }

  @memoized
  bool get builderFieldUsesNestedBuilder {
    final builderFieldElementIsValid =
        (builderElement?.getter?.isAbstract == false) &&
            !builderElement.isStatic;

    // If the builder is present, check it to determine whether a nested
    // builder is needed. Otherwise, use the same logic as built_value when
    // it decides whether to use a nested builder.
    return builderFieldElementIsValid
        ? element.getter.returnType.displayName !=
            builderElement.getter.returnType.displayName
        : settings.nestedBuilders &&
            DartTypes.needsNestedBuilder(element.getter.returnType);
  }

  @memoized
  String get rawType => _getBareType(type);

  String generateFullType(CompilationUnitElement compilationUnit,
      [BuiltSet<String> classGenericParameters]) {
    return _generateFullType(typeInCompilationUnit(compilationUnit),
        classGenericParameters ?? new BuiltSet<String>());
  }

  @memoized
  bool get needsBuilder => element.getter.returnType.displayName.contains('<');

  Iterable<String> computeErrors() {
    if (isSerializable && element.getter.returnType is FunctionType) {
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
  String generateCast(CompilationUnitElement compilationUnit,
      BuiltMap<String, String> classGenericBounds) {
    final result = _generateCast(
        typeInCompilationUnit(compilationUnit), classGenericBounds);
    return result == 'Object' ? '' : 'as $result';
  }

  String generateBuilder() {
    final bareType = _getBareType(type);
    if (typesWithBuilder.containsKey(bareType)) {
      return 'new ${typesWithBuilder[bareType]}<${_getGenerics(type)}>()';
    } else {
      return 'new ${bareType}Builder<${_getGenerics(type)}>()';
    }
  }

  static String _generateFullType(
      String type, BuiltSet<String> classGenericParameters) {
    final bareType = _getBareType(type);
    final generics = _getGenerics(type);
    final genericItems = _splitOnTopLevelCommas(generics);

    if (generics.isEmpty) {
      if (classGenericParameters.contains(bareType)) {
        return 'parameter$bareType';
      }
      return 'const FullType($bareType)';
    } else {
      final parameterFullTypes = genericItems
          .map((item) => _generateFullType(item, classGenericParameters))
          .join(', ');
      final canUseConst = parameterFullTypes.startsWith('const ');
      final constOrNew = canUseConst ? 'const' : 'new';
      final constOrEmpty = canUseConst ? 'const' : '';
      return '$constOrNew FullType($bareType, $constOrEmpty [$parameterFullTypes])';
    }
  }

  static String _generateCast(
      String type, BuiltMap<String, String> classGenericBounds,
      {bool topLevel = true}) {
    final bareType = _getBareType(type);

    // For built collections we can cast to the bare type when deserializing,
    // instead of the full generic type. This is because the `replace` method
    // checks the generic type and copies if needed.
    final generics = topLevel && DartTypes.isBuiltCollectionTypeName(bareType)
        ? ''
        : _getGenerics(type);
    final genericItems = _splitOnTopLevelCommas(generics);

    if (generics.isEmpty) {
      if (classGenericBounds.keys.contains(bareType)) {
        return classGenericBounds[bareType];
      }
      return bareType;
    } else {
      final parameterFullTypes = genericItems
          .map((item) =>
              _generateCast(item, classGenericBounds, topLevel: false))
          .join(', ');
      return '$bareType<$parameterFullTypes>';
    }
  }

  static String _getBareType(String name) {
    final genericsStart = name.indexOf('<');
    return genericsStart == -1 ? name : name.substring(0, genericsStart);
  }

  static String _getGenerics(String name) {
    final genericsStart = name.indexOf('<');
    return genericsStart == -1
        ? ''
        : name
            .substring(genericsStart + 1)
            .substring(0, name.length - genericsStart - 2);
  }

  /// Splits a generic parameter string on top level commas; that means
  /// commas nested inside '<' and '>' are ignored.
  static BuiltList<String> _splitOnTopLevelCommas(String string) {
    final result = new ListBuilder<String>();
    final accumulator = new StringBuffer();
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
