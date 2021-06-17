// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.11

library built_value_generator.source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/analyzer.dart';
import 'package:built_value_generator/src/enum_source_class.dart';
import 'package:built_value_generator/src/enum_source_field.dart';
import 'package:built_value_generator/src/fields.dart' show collectFields;
import 'package:built_value_generator/src/serializer_source_field.dart';
import 'package:built_value_generator/src/strings.dart';
import 'package:built_value_generator/src/value_source_class.dart';

import 'dart_types.dart';

part 'serializer_source_class.g.dart';

abstract class SerializerSourceClass
    implements Built<SerializerSourceClass, SerializerSourceClassBuilder> {
  ClassElement get element;

  @nullable
  ClassElement get builderElement;

  factory SerializerSourceClass(ClassElement element) =>
      _$SerializerSourceClass._(
          element: element,
          builderElement:
              element.library.getType(element.displayName + 'Builder'));

  SerializerSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      parsedLibraryResultOrThrowingMock(element.library);

  // TODO(davidmorgan): share common code in a nicer way.
  @memoized
  BuiltValue get builtValueSettings => ValueSourceClass(element).settings;

  @memoized
  bool get hasBuilder => builderElement != null;

  @memoized
  BuiltValueSerializer get serializerSettings {
    var serializerFields =
        element.fields.where((field) => field.name == 'serializer').toList();
    if (serializerFields.isEmpty) return const BuiltValueSerializer();
    var serializerField = serializerFields.single;
    if (serializerField.getter == null) return const BuiltValueSerializer();

    var annotations = serializerField.getter.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) =>
            DartTypes.getName(value?.type) == 'BuiltValueSerializer');
    if (annotations.isEmpty) return const BuiltValueSerializer();

    var annotation = annotations.single;
    // If a field does not exist, that means an old `built_value` version; use
    // the default.
    return BuiltValueSerializer(
      custom: annotation.getField('custom')?.toBoolValue() ?? false,
      serializeNulls:
          annotation.getField('serializeNulls')?.toBoolValue() ?? false,
    );
  }

  // TODO(davidmorgan): share common code in a nicer way.
  @memoized
  BuiltValueEnum get enumClassSettings =>
      EnumSourceClass(parsedLibrary, element).settings;

  @memoized
  String get name => element.name;

  @memoized
  bool get isNonNullByDefault => element.library.isNonNullableByDefault;

  @memoized
  String get orNull => isNonNullByDefault ? '?' : '';

  @memoized
  String get notNull => isNonNullByDefault ? '!' : '';

  @memoized
  String get wireName {
    if (isBuiltValue) {
      return builtValueSettings.wireName ?? name;
    } else if (isEnumClass) {
      return enumClassSettings.wireName ?? name;
    } else {
      return name;
    }
  }

  @memoized
  String get serializerDeclaration {
    var serializerFields =
        element.fields.where((field) => field.name == 'serializer').toList();
    if (serializerFields.isEmpty) return '';
    var serializerField = serializerFields.single;
    var result = parsedLibrary
            .getElementDeclaration(serializerField.getter)
            ?.node
            ?.toSource() ??
        '';
    // Strip off annotations.
    if (result.startsWith('@')) {
      // First thing after the annotations should be `static`.
      if (result.contains(' static ')) {
        result = result.substring(result.indexOf(' static ') + 1);
      }
    }
    return result;
  }

  @memoized
  BuiltList<String> get genericParameters =>
      BuiltList<String>(element.typeParameters.map((e) => e.name));

  @memoized
  BuiltList<String> get genericBounds =>
      BuiltList<String>(element.typeParameters
          .map((element) => DartTypes.getName(element.bound) ?? ''));

  @memoized
  String get genericBoundsOrObjectString => genericBounds.isEmpty
      ? ''
      : '<' +
          genericBounds
              .map((bound) => bound.isEmpty ? 'Object$orNull' : bound)
              .join(', ') +
          '>';

  String get genericName => '$name$genericBoundsOrObjectString';

  // TODO(davidmorgan): better check.
  @memoized
  bool get isBuiltValue =>
      element.allSupertypes
          .map((type) => type.element.name)
          .any((name) => name.startsWith('Built')) &&
      !element.name.startsWith(r'_$') &&
      element.fields.any((field) => field.name == 'serializer');

  // TODO(davidmorgan): better check.
  @memoized
  bool get isEnumClass =>
      element.allSupertypes
          .map((type) => type.element.name)
          .any((name) => name == 'EnumClass') &&
      !element.name.startsWith(r'_$') &&
      element.fields.any((field) => field.name == 'serializer');

  @memoized
  BuiltList<SerializerSourceField> get fields {
    var result = ListBuilder<SerializerSourceField>();
    for (var fieldElement in collectFields(element)) {
      final builderFieldElement =
          builderElement?.getField(fieldElement.displayName);
      final sourceField = SerializerSourceField(
          builtValueSettings, parsedLibrary, fieldElement, builderFieldElement);
      if (sourceField.isSerializable) {
        result.add(sourceField);
      }
    }
    return result.build();
  }

  /// Returns all the serializable classes used, transitively, by fields of
  /// this class.
  @memoized
  BuiltSet<SerializerSourceClass> get fieldClasses =>
      _fieldClassesWith(BuiltSet<SerializerSourceClass>());

  /// Returns all the serializable classes used, transitively, by fields of
  /// this class.
  ///
  /// [initialClasses] may be empty, or may include classes that are already
  /// being evaluated. These will not be re-evaluated, preventing infinite
  /// recursion when there is a loop in field types. For example, when `FooA`
  /// has a field of type `FooB`, and `FooB `has a field of type `FooA`.
  BuiltSet<SerializerSourceClass> _fieldClassesWith(
      BuiltSet<SerializerSourceClass> initialClasses) {
    var result = initialClasses.toBuilder();
    for (var fieldElement in collectFields(element)) {
      if (fieldElement.isStatic) continue;
      if (fieldElement.setter != null) continue;

      // Type is not fully specified, ignore.
      if (fieldElement.type.element is! ClassElement) continue;

      // Also find classes used as generic parameters; for example a field
      // of type List<Foo> means we need to be able to serialize Foo.
      if (fieldElement.type is ParameterizedType) {
        for (var type
            in (fieldElement.type as ParameterizedType).typeArguments) {
          // Type is not fully specified, ignore.
          if (type.element is! ClassElement) continue;

          final sourceClass =
              SerializerSourceClass(type.element as ClassElement);

          if (sourceClass != this &&
              !result.build().contains(sourceClass) &&
              sourceClass.isSerializable) {
            result.add(sourceClass);
            result.replace(sourceClass._fieldClassesWith(result.build()));
          }
        }
      }

      final sourceClass =
          SerializerSourceClass(fieldElement.type.element as ClassElement);
      if (sourceClass != this &&
          !result.build().contains(sourceClass) &&
          sourceClass.isSerializable) {
        result.add(sourceClass);
        result.replace(sourceClass._fieldClassesWith(result.build()));
      }
    }

    return result.build();
  }

  @memoized
  CompilationUnitElement get compilationUnit =>
      element.library.definingCompilationUnit;

  /// Returns the serializer class name for the generated implementation.
  @memoized
  String get serializerImplName => '_\$${name}Serializer';

  /// Returns the serializer instance name for the generated implementation,
  /// referenced by the user as a `static serializer` attribute.
  @memoized
  String get serializerInstanceName => '_\$${_toCamelCase(name)}Serializer';

  Iterable<String> computeErrors() {
    var result = <String>[];

    if (!serializerSettings.custom) {
      final expectedSerializerDeclaration =
          'static Serializer<$genericName> get serializer => $serializerInstanceName;';
      // We used to recommend raw types; recommend the full type now, but still
      // allow raw types.
      final expectedSerializerDeclarationRaw =
          'static Serializer<$name> get serializer => $serializerInstanceName;';
      if (serializerDeclaration != expectedSerializerDeclaration &&
          serializerDeclaration != expectedSerializerDeclarationRaw) {
        result.add('Declare $name.serializer as: '
            '$expectedSerializerDeclaration got $serializerDeclaration');
      }
      if (name.startsWith('_')) {
        result.add('Cannot generate serializers for private class $name');
      }
    }

    for (var field in fields) {
      result.addAll(field.computeErrors());
    }

    return result;
  }

  @memoized
  bool get isSerializable => isBuiltValue || isEnumClass;

  @memoized
  bool get needsGeneratedSerializer => !serializerSettings.custom;

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

  String generateSerializerDeclaration() =>
      'Serializer<$genericName> $serializerInstanceName = new $serializerImplName();';

  /// Returns the class name for the generated implementation. If the manually
  /// maintained class is private then we ignore the underscore here, to avoid
  /// returning a class name starting `_$_`.
  @memoized
  String get implName =>
      name.startsWith('_') ? '_\$${name.substring(1)}' : '_\$$name';

  String generateSerializer() {
    if (isBuiltValue) {
      return '''
class $serializerImplName implements StructuredSerializer<$genericName> {
  @override
  final Iterable<Type> types = const [$name, $implName];
  @override
  final String wireName = '${escapeString(wireName)}';

  @override
  Iterable<Object$orNull> serialize(Serializers serializers, $genericName object,
      {FullType specifiedType = FullType.unspecified}) {
    ${fields.isEmpty ? 'return <Object$orNull>[];' : '''
    ${_generateGenericsSerializerPreamble()}
    final result = <Object$orNull>[${_generateRequiredFieldSerializers()}];
    ${_generateNullableFieldSerializers()}
    return result;
    '''}
  }

  @override
  $genericName deserialize(Serializers serializers, Iterable<Object$orNull> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    ${_generateGenericsSerializerPreamble()}
    ${fields.isEmpty ? 'return ${_generateNewBuilder()}.build();' : '''
    final result = ${_generateNewBuilder()};

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object$orNull value = iterator.current;
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
      final wireNameMapping = BuiltMap<String, Object>.build((b) => element
              .fields
              .where((field) => field.isConst && field.isStatic)
              .forEach((field) {
            final enumSourceField = EnumSourceField(parsedLibrary, field);
            if (enumSourceField.settings.wireName != null) {
              b[field.name] = enumSourceField.settings.wireName;
            } else if (enumSourceField.settings.wireNumber != null) {
              b[field.name] = enumSourceField.settings.wireNumber;
            }
          }));

      if (wireNameMapping.isEmpty) {
        // No wire names. Just use the enum names directly.
        return '''
class $serializerImplName implements PrimitiveSerializer<$genericName> {
  @override
  final Iterable<Type> types = const <Type>[$name];
  @override
  final String wireName = '${escapeString(wireName)}';

  @override
  Object serialize(Serializers serializers, $genericName object,
      {FullType specifiedType = FullType.unspecified}) =>
    object.name;

  @override
  $name deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) =>
    $name.valueOf(serialized as String);
}''';
      } else {
        // Generate maps between enum names and wire names.
        final toWire = '''
         static const Map<String, Object> _toWire = const <String, Object>{
           ${wireNameMapping.keys.map((key) => "'$key': ${_toCode(wireNameMapping[key])},").join('\n')}
         };''';
        final fromWire = '''
         static const Map<Object, String> _fromWire = const <Object, String>{
           ${wireNameMapping.keys.map((key) => "${_toCode(wireNameMapping[key])}: '$key',").join('\n')}
         };''';

        return '''
class $serializerImplName implements PrimitiveSerializer<$genericName> {
  $toWire
  $fromWire

  @override
  final Iterable<Type> types = const <Type>[$name];
  @override
  final String wireName = '${escapeString(wireName)}';

  @override
  Object serialize(Serializers serializers, $genericName object,
      {FullType specifiedType = FullType.unspecified}) =>
    _toWire[object.name] ?? object.name;

  @override
  $genericName deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) =>
    $name.valueOf(_fromWire[serialized] ?? (
        serialized is String ? serialized : ''));
}''';
      }
    } else {
      throw UnsupportedError('not serializable');
    }
  }

  static String _toCode(Object object) {
    if (object is String) {
      return "'${escapeString(object)}'";
    } else if (object is int) {
      return object.toString();
    } else {
      throw UnsupportedError(object);
    }
  }

  String _generateNewBuilder() {
    var parameters = _genericParametersUsedInFields;
    if (parameters.isEmpty) {
      return 'new ${name}Builder$genericBoundsOrObjectString()';
    }
    return 'isUnderspecified ? '
        'new ${name}Builder$genericBoundsOrObjectString() : '
        'serializers.newBuilder(specifiedType) as '
        '${name}Builder$genericBoundsOrObjectString';
  }

  BuiltList<String> get _genericParametersUsedInFields => BuiltList<String>(
      genericParameters.where((parameter) => fields.any((field) =>
          field.rawType == parameter ||
          field.type.contains(RegExp('[<, \n]$parameter[>, \n]')))));

  String _generateGenericsSerializerPreamble() {
    var parameters = _genericParametersUsedInFields;
    if (parameters.isEmpty) return '';
    var result = StringBuffer();
    result.writeln('final isUnderspecified = specifiedType.isUnspecified || '
        'specifiedType.parameters.isEmpty;');
    result.writeln(
        'if (!isUnderspecified) serializers.expectBuilder(specifiedType);');
    for (var parameter in parameters) {
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
        .map((field) => "'${escapeString(field.wireName)}', "
            'serializers.serialize(object.${field.name}, '
            'specifiedType: '
            '${field.generateFullType(compilationUnit, genericParameters.toBuiltSet())}),')
        .join('');
  }

  String _generateNullableFieldSerializers() {
    var nullableFields = fields.where((field) => field.isNullable).toList();
    if (nullableFields.isEmpty) return '';

    return 'Object$orNull value;' +
        nullableFields.map((field) {
          var serializeField = '''serializers.serialize(
          value,
          specifiedType:
          ${field.generateFullType(compilationUnit, genericParameters.toBuiltSet())})''';

          return '''
          value = object.${field.name};
          ${serializerSettings.serializeNulls ? '' : 'if (value != null) {'}
            result
              ..add('${escapeString(field.wireName)}')
              ..add($serializeField);
          ${serializerSettings.serializeNulls ? '' : '}'}''';
        }).join('');
  }

  /// Gets a map from generic parameter to its bound.
  ///
  /// 'Object' is substituted where there is no bound.
  BuiltMap<String, String> get _genericBoundsAsMap {
    var genericBoundsOrObject =
        genericBounds.map((bound) => bound.isEmpty ? 'Object' : bound).toList();
    var result = MapBuilder<String, String>();
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
        if (field.builderFieldAutoCreatesNestedBuilder || hasBuilder) {
          return '''
case '${escapeString(field.wireName)}':
  result.${field.name}.replace(serializers.deserialize(
      value, specifiedType: $fullType)$notNull $cast);
  break;
''';
        } else {
          return '''
case '${escapeString(field.wireName)}':
  result.${field.name} = (serializers.deserialize(
      value, specifiedType: $fullType) $cast).toBuilder();
  break;
''';
        }
      } else {
        // `cast` is empty if no cast is needed.
        var maybeOrNull = field.isNullable && cast.isNotEmpty ? orNull : '';
        return '''
case '${escapeString(field.wireName)}':
  result.${field.name} = serializers.deserialize(
      value, specifiedType: $fullType) $cast$maybeOrNull;
  break;
''';
      }
    }).join('');
  }

  static String _toCamelCase(String name) {
    var result = '';
    var upperCase = false;
    var firstCharacter = true;
    for (var char in name.split('')) {
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
