// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/serializer_source_field.dart';

part 'serializer_source_class.g.dart';

abstract class SerializerSourceClass
    implements Built<SerializerSourceClass, SerializerSourceClassBuilder> {
  String get name;
  String get serializerDeclaration;
  BuiltList<String> get genericParameters;
  BuiltList<String> get genericBounds;
  bool get isBuiltValue;
  bool get isEnumClass;
  BuiltList<SerializerSourceField> get fields;

  factory SerializerSourceClass([updates(SerializerSourceClassBuilder b)]) =
      _$SerializerSourceClass;
  SerializerSourceClass._();

  static SerializerSourceClass fromClassElements(
      ClassElement classElement, ClassElement builderClassElement) {
    final result = new SerializerSourceClassBuilder();

    result
      ..name = classElement.name
      ..genericParameters.replace(_getGenericParameters(classElement))
      ..genericBounds.replace(_getGenericBounds(classElement));

    // TODO(davidmorgan): better check.
    result.isBuiltValue = classElement.allSupertypes
            .map((type) => type.name)
            .any((name) => name.startsWith('Built')) &&
        !classElement.name.startsWith(r'_$') &&
        classElement.fields.any((field) => field.name == 'serializer');

    // TODO(davidmorgan): better check.
    result.isEnumClass = classElement.allSupertypes
            .map((type) => type.name)
            .any((name) => name == 'EnumClass') &&
        !classElement.name.startsWith(r'_$') &&
        classElement.fields.any((field) => field.name == 'serializer');

    result.serializerDeclaration = '';
    final serializerFields = classElement.fields
        .where((field) => field.name == 'serializer')
        .toList();
    if (serializerFields.isNotEmpty) {
      final serializerField = serializerFields.single;
      result.serializerDeclaration =
          serializerField.getter?.computeNode()?.toString() ?? '';
    }

    for (final fieldElement in classElement.fields) {
      final builderFieldElement =
          builderClassElement?.getField(fieldElement.displayName);
      final sourceField = SerializerSourceField.fromFieldElements(
          fieldElement, builderFieldElement);
      if (sourceField.isSerializable) {
        result.fields.add(sourceField);
      }
    }

    return result.build();
  }

  static BuiltList<String> _getGenericParameters(ClassElement classElement) =>
      new BuiltList<String>(classElement.typeParameters
          .map((element) => element.computeNode().toString()));

  static BuiltList<String> _getGenericBounds(ClassElement classElement) =>
      new BuiltList<String>(classElement.typeParameters
          .map((element) => (element.bound ?? '').toString()));

  Iterable<String> computeErrors() {
    final camelCaseName =
        name.substring(0, 1).toLowerCase() + name.substring(1);
    final expectedSerializerDeclaration =
        'static Serializer<$name> get serializer => '
        '_\$${camelCaseName}Serializer;';
    if (serializerDeclaration != expectedSerializerDeclaration) {
      return [
        'Declare $name.serializer as: '
            '$expectedSerializerDeclaration got $serializerDeclaration'
      ];
    }

    return [];
  }

  bool get needsBuiltJson => isBuiltValue || isEnumClass;

  String generateTransitiveSerializerAdder() {
    return '..add($name.serializer)';
  }

  String generateBuilderFactoryAdders() {
    return fields
        .where((field) =>
            field.needsBuilder &&
            field
                .generateFullType(genericParameters.toBuiltSet())
                .startsWith('const '))
        .map((field) =>
            '..addBuilderFactory(${field.generateFullType()}, () => ${field.generateBuilder()})')
        .join('\n');
  }

  String generateSerializerDeclaration() {
    final camelCaseName = _toCamelCase(name);
    return 'Serializer<$name> '
        '_\$${camelCaseName}Serializer = '
        'new _\$${name}Serializer();';
  }

  String generateSerializer() {
    if (isBuiltValue) {
      return '''
class _\$${name}Serializer implements StructuredSerializer<$name> {
  @override
  final Iterable<Type> types = const [$name, _\$$name];
  @override
  final String wireName = '$name';

  @override
  Iterable serialize(Serializers serializers, $name object,
      {FullType specifiedType: FullType.unspecified}) {
    ${fields.isEmpty ? 'return [];' : '''
    ${_generateGenericsSerializerPreamble()}
    final result = [${_generateRequiredFieldSerializers()}];
    ${_generateNullableFieldSerializers()}
    return result;
    '''}
  }

  @override
  $name deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    ${_generateGenericsSerializerPreamble()}
    ${fields.isEmpty ? 'return ${_generateNewBuilder()}.build();' : '''
    final result = ${_generateNewBuilder()};

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          ${_generateFieldDeserializers()}
        }
      }
    }

    return result.build();
    '''}
  }
}
''';
    } else if (isEnumClass) {
      return '''
class _\$${name}Serializer implements PrimitiveSerializer<$name> {
  @override
  final Iterable<Type> types = const [$name];
  @override
  final String wireName = '$name';

  @override
  Object serialize(Serializers serializers, $name object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  $name deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return $name.valueOf(serialized);
  }
}
''';
    } else {
      throw new UnsupportedError('not serializable');
    }
  }

  String _generateNewBuilder() {
    final parameters = _genericParametersUsedInFields;
    if (parameters.isEmpty) return 'new ${name}Builder()';
    final boundsOrObject = genericBounds
        .map((bound) => bound.isEmpty ? 'Object' : bound)
        .join(', ');
    return 'isUnderspecified ? '
        'new ${name}Builder<$boundsOrObject>() : '
        'serializers.newBuilder(specifiedType) as ${name}Builder';
  }

  BuiltList<String> get _genericParametersUsedInFields => new BuiltList<String>(
      genericParameters.where((parameter) => fields.any((field) =>
          field.rawType == parameter ||
          field.type.contains(new RegExp('[<, \n]$parameter[>, \n]')))));

  String _generateGenericsSerializerPreamble() {
    final parameters = _genericParametersUsedInFields;
    if (parameters.isEmpty) return '';
    final result = new StringBuffer();
    result.writeln('final isUnderspecified = specifiedType.isUnspecified || '
        'specifiedType.parameters.isEmpty;');
    result.writeln(
        'if (!isUnderspecified) serializers.expectBuilder(specifiedType);');
    for (final parameter in parameters) {
      final index = genericParameters.indexOf(parameter);
      result.writeln('final parameter$parameter = '
          'isUnderspecified '
          '? FullType.object : '
          'specifiedType.parameters[$index];');
    }
    result.writeln();
    return result.toString();
  }

  String _generateRequiredFieldSerializers() {
    return fields
        .where((field) => !field.isNullable)
        .map((field) => "'${field.name}', "
            'serializers.serialize(object.${field.name}, '
            'specifiedType: '
            '${field.generateFullType(genericParameters.toBuiltSet())}),')
        .join('');
  }

  String _generateNullableFieldSerializers() {
    return fields.where((field) => field.isNullable).map((field) => '''
    if (object.${field.name} != null) {
      result.add('${field.name}');
      result.add(serializers.serialize(
          object.${field.name}, specifiedType: ${field.generateFullType(genericParameters.toBuiltSet())}));
    }
''').join('');
  }

  String _generateFieldDeserializers() {
    return fields.map((field) {
      if (field.builderFieldUsesNestedBuilder) {
        return '''
case '${field.name}':
  result.${field.name}.replace(serializers.deserialize(
      value, specifiedType: ${field.generateFullType(genericParameters.toBuiltSet())}) as dynamic);
  break;
''';
      } else {
        return '''
case '${field.name}':
  result.${field.name} = serializers.deserialize(
      value, specifiedType: ${field.generateFullType(genericParameters.toBuiltSet())}) as dynamic;
  break;
''';
      }
    }).join('');
  }

  static String _toCamelCase(String name) {
    var result = '';
    var upperCase = false;
    var firstCharacter = true;
    for (final char in name.split('')) {
      if (char == '_') {
        upperCase = true;
      } else {
        result += firstCharacter
            ? char.toLowerCase()
            : (upperCase ? char.toUpperCase() : char);
        upperCase = false;
        firstCharacter = false;
      }
    }
    return result;
  }
}
