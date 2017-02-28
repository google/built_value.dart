// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

part 'serializer_source_field.g.dart';

BuiltSet<String> _builtCollectionNames = new BuiltSet<String>([
  'BuiltList',
  'BuiltListMultimap',
  'BuiltMap',
  'BuiltSet',
  'BuiltSetMultimap',
]);

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

  bool get isSerializable;
  bool get isNullable;
  String get name;
  String get type;
  bool get builderFieldUsesNestedBuilder;

  factory SerializerSourceField([updates(SerializerSourceFieldBuilder b)]) =
      _$SerializerSourceField;
  SerializerSourceField._();

  String get rawType => _getBareType(type);

  static SerializerSourceField fromFieldElements(
      FieldElement fieldElement, FieldElement builderFieldElement) {
    final result = new SerializerSourceFieldBuilder();
    final isSerializable = fieldElement.getter != null &&
        fieldElement.getter.isAbstract &&
        !fieldElement.isStatic;

    result.isSerializable = isSerializable;

    if (isSerializable) {
      result.isNullable = fieldElement.getter.metadata.any(
          (metadata) => metadata.constantValue.toStringValue() == 'nullable');
      result.name = fieldElement.displayName;

      // Go via AST to pull in any import prefix.
      result.type = (fieldElement.getter.computeNode() as MethodDeclaration)
              ?.returnType
              ?.toString() ??
          'dynamic';

      final builderFieldElementIsValid =
          (builderFieldElement?.getter?.isAbstract ?? false) &&
              !builderFieldElement.isStatic;

      // If the builder is present, check it to determine whether a nested
      // builder is needed. Otherwise, use the same logic as built_value when
      // it decides whether to use a nested builder.
      result.builderFieldUsesNestedBuilder = builderFieldElementIsValid
          ? fieldElement.getter.returnType.displayName !=
              builderFieldElement.getter.returnType.displayName
          : _needsNestedBuilder(fieldElement.getter.returnType);
    }

    return result.build();
  }

  String generateFullType([BuiltSet<String> classGenericParameters]) {
    return _generateFullType(
        type, classGenericParameters ?? new BuiltSet<String>());
  }

  /// Generates a cast using 'as' to this field type.
  ///
  /// Generics are cast to the bound of the generic. If there is no bound,
  /// no cast is needed, and an empty string is returned.
  String generateCast(BuiltMap<String, String> classGenericBounds) {
    final result = _generateCast(type, classGenericBounds);
    return result == 'Object' ? '' : 'as $result';
  }

  bool get needsBuilder => type.contains('<');

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
    // TODO(davidmorgan): support more than one level of nesting.
    final bareType = _getBareType(type);
    final generics = _getGenerics(type);
    final genericItems = generics.split(', ');

    if (generics.isEmpty) {
      if (classGenericParameters.contains(bareType))
        return 'parameter$bareType';
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
      String type, BuiltMap<String, String> classGenericBounds) {
    final bareType = _getBareType(type);
    final generics = _getGenerics(type);
    final genericItems = generics.split(', ');

    if (generics.isEmpty) {
      if (classGenericBounds.keys.contains(bareType))
        return classGenericBounds[bareType];
      return bareType;
    } else {
      final parameterFullTypes = genericItems
          .map((item) => _generateCast(item, classGenericBounds))
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

  // These three methods are copied from built_value to match the behaviour
  // when a builder is not explicitly defined.
  // TODO(davidmorgan): dedupe.
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
        .any((name) => type.displayName.startsWith('$name<'));
  }
}

abstract class SerializerSourceFieldBuilder
    implements Builder<SerializerSourceField, SerializerSourceFieldBuilder> {
  @virtual
  bool isSerializable;
  @virtual
  bool isNullable = false;
  @virtual
  String name = '';
  @virtual
  String type = '';
  @virtual
  bool builderFieldUsesNestedBuilder = false;

  factory SerializerSourceFieldBuilder() = _$SerializerSourceFieldBuilder;
  SerializerSourceFieldBuilder._();
}
