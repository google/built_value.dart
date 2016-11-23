// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_field;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

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
    'BuiltMap': 'MapBuilder',
    'BuiltSet': 'SetBuilder',
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
      result.type = fieldElement.getter.returnType.displayName;

      // If the builder is present, check it to determine whether a nested
      // builder is needed. Otherwise, use the same logic as built_value when
      // it decides whether to use a nested builder.
      result.builderFieldUsesNestedBuilder = builderFieldElement == null
          ? _needsNestedBuilder(fieldElement.getter.returnType)
          : fieldElement.getter.returnType.displayName !=
              builderFieldElement.getter.returnType.displayName;
    }

    return result.build();
  }

  String generateFullType() {
    return _generateFullType(type);
  }

  bool get needsBuilder => typesWithBuilder.containsKey(_getBareType(type));

  String generateBuilder() {
    return 'new ${typesWithBuilder[_getBareType(type)]}<${_getGenerics(type)}>()';
  }

  static String _generateFullType(String type) {
    // TODO(davidmorgan): support more than one level of nesting.
    final bareType = _getBareType(type);
    final generics = _getGenerics(type);
    final genericItems = generics.split(', ');

    if (generics.isEmpty) {
      return 'const FullType($bareType)';
    } else {
      return 'const FullType($bareType, const [${genericItems.map(_generateFullType).join(', ')}])';
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
        .any((name) => type.displayName.startsWith('${name}<'));
  }
}

abstract class SerializerSourceFieldBuilder
    implements Builder<SerializerSourceField, SerializerSourceFieldBuilder> {
  bool isSerializable;
  bool isNullable = false;
  String name = '';
  String type = '';
  bool builderFieldUsesNestedBuilder = false;

  factory SerializerSourceFieldBuilder() = _$SerializerSourceFieldBuilder;
  SerializerSourceFieldBuilder._();
}
