// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/enum_source_class.dart';
import 'package:built_value_generator/src/enum_source_field.dart';
import 'package:built_value_generator/src/fields.dart' show collectFields;
import 'package:built_value_generator/src/serializer_source_field.dart';
import 'package:built_value_generator/src/value_source_class.dart';

part 'serializer_source_class.g.dart';

abstract class SerializerSourceClass
    implements Built<SerializerSourceClass, SerializerSourceClassBuilder> {
  ClassElement get element;
  @nullable
  ClassElement get builderElement;

  factory SerializerSourceClass(ClassElement element) =>
      new _$SerializerSourceClass._(
          element: element,
          builderElement:
              element.library.getType(element.displayName + 'Builder'));
  SerializerSourceClass._();

  // TODO(davidmorgan): share common code in a nicer way.
  @memoized
  BuiltValue get builtValueSettings => new ValueSourceClass(element).settings;

  // TODO(davidmorgan): share common code in a nicer way.
  @memoized
  BuiltValueEnum get enumClassSettings => new EnumSourceClass(element).settings;

  @memoized
  String get name => element.name;

  @memoized
  String get wireName =>
      (isBuiltValue
          ? builtValueSettings.wireName
          : isEnumClass ? enumClassSettings.wireName : null) ??
      name;

  @memoized
  String get serializerDeclaration {
    final serializerFields =
        element.fields.where((field) => field.name == 'serializer').toList();
    if (serializerFields.isEmpty) return '';
    final serializerField = serializerFields.single;
    return serializerField.getter?.computeNode()?.toString() ?? '';
  }

  @memoized
  BuiltList<String> get genericParameters => new BuiltList<String>(
      element.typeParameters.map((e) => e.computeNode().toString()));

  @memoized
  BuiltList<String> get genericBounds =>
      new BuiltList<String>(element.typeParameters
          .map((element) => (element.bound ?? '').toString()));

  // TODO(davidmorgan): better check.
  @memoized
  bool get isBuiltValue =>
      element.allSupertypes
          .map((type) => type.name)
          .any((name) => name.startsWith('Built')) &&
      !element.name.startsWith(r'_$') &&
      element.fields.any((field) => field.name == 'serializer');

  // TODO(davidmorgan): better check.
  @memoized
  bool get isEnumClass =>
      element.allSupertypes
          .map((type) => type.name)
          .any((name) => name == 'EnumClass') &&
      !element.name.startsWith(r'_$') &&
      element.fields.any((field) => field.name == 'serializer');

  @memoized
  BuiltList<SerializerSourceField> get fields {
    final result = new ListBuilder<SerializerSourceField>();
    for (final fieldElement in collectFields(element)) {
      final builderFieldElement =
          builderElement?.getField(fieldElement.displayName);
      final sourceField = new SerializerSourceField(
          builtValueSettings, fieldElement, builderFieldElement);
      if (sourceField.isSerializable) {
        result.add(sourceField);
      }
    }
    return result.build();
  }

  /// Returns all the serializable classes used, transitively, by fields of
  /// this class.
  @memoized
  BuiltSet<SerializerSourceClass> get fieldClasses {
    final result = new SetBuilder<SerializerSourceClass>();
    for (final fieldElement in collectFields(element)) {
      if (fieldElement.isStatic) continue;
      if (fieldElement.setter != null) continue;

      // Type is not fully specified, ignore.
      if (fieldElement.type.element is! ClassElement) continue;

      // Also find classes used as generic parameters; for example a field
      // of type List<Foo> means we need to be able to serialize Foo.
      if (fieldElement.type is ParameterizedType) {
        for (final type
            in (fieldElement.type as ParameterizedType).typeArguments) {
          // Type is not fully specified, ignore.
          if (type.element is! ClassElement) continue;

          final sourceClass =
              new SerializerSourceClass(type.element as ClassElement);

          if (sourceClass != this &&
              !result.build().contains(sourceClass) &&
              sourceClass.needsBuiltJson) {
            result.add(sourceClass);
            result.addAll(sourceClass.fieldClasses);
          }
        }
      }

      final sourceClass =
          new SerializerSourceClass(fieldElement.type.element as ClassElement);
      if (sourceClass != this &&
          !result.build().contains(sourceClass) &&
          sourceClass.needsBuiltJson) {
        result.add(sourceClass);
        result.addAll(sourceClass.fieldClasses);
      }
    }

    return result.build();
  }

  @memoized
  CompilationUnitElement get compilationUnit =>
      element.library.definingCompilationUnit;

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

  /// Returns a string with `addBuilderFactory` calls to add the needed builder
  /// factories. Specify the [compilationUnit] the code will run in, so the
  /// code can be generated correctly (with or without import prefixes).
  String generateBuilderFactoryAdders(CompilationUnitElement compilationUnit) {
    return fields
        .where((field) =>
            field.needsBuilder &&
            field
                .generateFullType(
                    compilationUnit, genericParameters.toBuiltSet())
                .startsWith('const '))
        .map((field) =>
            '..addBuilderFactory(${field.generateFullType(compilationUnit)}, '
            ' () => ${field.generateBuilder()})')
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
  final String wireName = '$wireName';

  @override
  Iterable serialize(Serializers serializers, $name object,
      {FullType specifiedType: FullType.unspecified}) {
    ${fields.isEmpty ? 'return <Object>[];' : '''
    ${_generateGenericsSerializerPreamble()}
    final result = <Object>[${_generateRequiredFieldSerializers()}];
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

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        ${_generateFieldDeserializers()}
      }
    }

    return result.build();
    '''}
  }
}
''';
    } else if (isEnumClass) {
      final wireNameMapping = new BuiltMap<String, String>.build((b) => element
              .fields
              .where((field) => field.isConst && field.isStatic)
              .forEach((field) {
            final enumSourceField = new EnumSourceField(field);
            if (enumSourceField.settings.wireName != null) {
              b[field.name] = enumSourceField.settings.wireName;
            }
          }));

      if (wireNameMapping.isEmpty) {
        // No wire names. Just use the enum names directly.
        return '''
class _\$${name}Serializer implements PrimitiveSerializer<$name> {
  @override
  final Iterable<Type> types = const <Type>[$name];
  @override
  final String wireName = '$wireName';

  @override
  Object serialize(Serializers serializers, $name object,
      {FullType specifiedType: FullType.unspecified}) =>
    object.name;

  @override
  $name deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) =>
    $name.valueOf(serialized as String);
}''';
      } else {
        // Generate maps between enum names and wire names.
        final toWire = '''
         static const Map<String, String> _toWire = const <String, String>{
           ${wireNameMapping.keys.map(
                (key) => "'$key': '${wireNameMapping[key]}',").join('\n')}
         };''';
        final fromWire = '''
         static const Map<String, String> _fromWire = const <String, String>{
           ${wireNameMapping.keys.map(
                (key) => "'${wireNameMapping[key]}': '$key',").join('\n')}
         };''';

        return '''
class _\$${name}Serializer implements PrimitiveSerializer<$name> {
  $toWire
  $fromWire

  @override
  final Iterable<Type> types = const <Type>[$name];
  @override
  final String wireName = '$wireName';

  @override
  Object serialize(Serializers serializers, $name object,
      {FullType specifiedType: FullType.unspecified}) =>
    _toWire[object.name] ?? object.name;

  @override
  $name deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) =>
    $name.valueOf(_fromWire[serialized] ?? serialized as String);
}''';
      }
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
        .map((field) => "'${field.wireName}', "
            'serializers.serialize(object.${field.name}, '
            'specifiedType: '
            '${field.generateFullType(compilationUnit, genericParameters.toBuiltSet())}),')
        .join('');
  }

  String _generateNullableFieldSerializers() {
    return fields.where((field) => field.isNullable).map((field) => '''
    if (object.${field.name} != null) {
      result
          ..add('${field.wireName}')
          ..add(serializers.serialize(
          object.${field.name}, 
          specifiedType:
              ${field.generateFullType(compilationUnit, genericParameters.toBuiltSet())}));
    }
''').join('');
  }

  /// Gets a map from generic parameter to its bound.
  ///
  /// 'Object' is substituted where there is no bound.
  BuiltMap<String, String> get _genericBoundsAsMap {
    final genericBoundsOrObject =
        genericBounds.map((bound) => bound.isEmpty ? 'Object' : bound).toList();
    final result = new MapBuilder<String, String>();
    for (var i = 0; i != genericParameters.length; ++i) {
      result[genericParameters[i]] = genericBoundsOrObject[i];
    }
    return result.build();
  }

  String _generateFieldDeserializers() {
    return fields.map((field) {
      final fullType = field.generateFullType(
          compilationUnit, genericParameters.toBuiltSet());
      final cast = field.generateCast(compilationUnit, _genericBoundsAsMap);
      if (field.builderFieldUsesNestedBuilder) {
        return '''
case '${field.wireName}':
  result.${field.name}.replace(serializers.deserialize(
      value, specifiedType: $fullType) $cast);
  break;
''';
      } else {
        return '''
case '${field.wireName}':
  result.${field.name} = serializers.deserialize(
      value, specifiedType: $fullType) $cast;
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
