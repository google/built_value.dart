// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/enum_source_class.dart';
import 'package:built_value_generator/src/enum_source_field.dart';
import 'package:built_value_generator/src/fields.dart' show collectFields;
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:built_value_generator/src/serializer_source_field.dart';
import 'package:built_value_generator/src/strings.dart';
import 'package:built_value_generator/src/value_source_class.dart';

import 'dart_types.dart';

part 'serializer_source_class.g.dart';

abstract class SerializerSourceClass
    implements Built<SerializerSourceClass, SerializerSourceClassBuilder> {
  ParsedLibraryResults get parsedLibraryResults;
  InterfaceElement2 get element;

  ClassElement2? get builderElement;

  factory SerializerSourceClass(ParsedLibraryResults parsedLibraryResults,
          InterfaceElement2 element) =>
      _$SerializerSourceClass._(
          parsedLibraryResults: parsedLibraryResults,
          element: element,
          builderElement:
              element.library2.getClass2(element.displayName + 'Builder'));

  SerializerSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      parsedLibraryResults.parsedLibraryResultOrThrowingMock(element.library2);

  // TODO(davidmorgan): share common code in a nicer way.
  @memoized
  BuiltValue get builtValueSettings =>
      ValueSourceClass(parsedLibraryResults, element).settings;

  @memoized
  bool get hasBuilder => builderElement != null;

  @memoized
  BuiltValueSerializer get serializerSettings {
    var serializerFields =
        element.fields2.where((field) => field.name3 == 'serializer').toList();
    if (serializerFields.isEmpty) return const BuiltValueSerializer();
    var serializerField = serializerFields.single;
    if (serializerField.getter2 == null) return const BuiltValueSerializer();

    var annotations = serializerField.getter2!.metadata2.annotations
        .map((annotation) => annotation.computeConstantValue())
        .where((value) =>
            DartTypes.tryGetName(value?.type) == 'BuiltValueSerializer');
    if (annotations.isEmpty) return const BuiltValueSerializer();

    var annotation = annotations.single!;
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
      EnumSourceClass(parsedLibraryResults, element).settings;

  @memoized
  String get name => element.name3!;

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
        element.fields2.where((field) => field.name3 == 'serializer').toList();
    if (serializerFields.isEmpty) return '';
    var serializerField = serializerFields.single;
    var result = parsedLibrary
            .getElementDeclaration2(serializerField.getter2!.firstFragment)
            ?.node
            .toSource() ??
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
      BuiltList<String>(element.typeParameters2.map((e) => e.name3!));

  @memoized
  BuiltList<String> get genericBounds =>
      BuiltList<String>(element.typeParameters2
          .map((element) => DartTypes.tryGetName(element.bound) ?? ''));

  @memoized
  String get genericBoundsOrObjectString => genericBounds.isEmpty
      ? ''
      : '<' +
          genericBounds
              .map((bound) => bound.isEmpty ? 'Object?' : bound)
              .join(', ') +
          '>';

  String get genericName => '$name$genericBoundsOrObjectString';

  // TODO(davidmorgan): better check.
  @memoized
  bool get isBuiltValue =>
      element.allSupertypes
          .map((type) => type.element3.name3!)
          .any((name) => name.startsWith('Built')) &&
      !element.name3!.startsWith(r'_$') &&
      element.fields2.any((field) => field.name3 == 'serializer');

  // TODO(davidmorgan): better check.
  @memoized
  bool get isEnumClass =>
      element.allSupertypes
          .map((type) => type.element3.name3!)
          .any((name) => name == 'EnumClass') &&
      !element.name3!.startsWith(r'_$') &&
      element.fields2.any((field) => field.name3 == 'serializer');

  @memoized
  BuiltList<SerializerSourceField> get fields {
    var result = ListBuilder<SerializerSourceField>();
    for (var fieldElement in collectFields(element)) {
      final builderFieldElement =
          builderElement?.getField2(fieldElement.displayName);
      final sourceField = SerializerSourceField(parsedLibraryResults,
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
      if (fieldElement.setter2 != null) continue;

      final fieldType = fieldElement.type;
      final fieldTypeElement = fieldType.element3;

      // Type is not fully specified, ignore.
      if (fieldTypeElement is! ClassElement2) continue;

      // Also find classes used as generic parameters; for example a field
      // of type List<Foo> means we need to be able to serialize Foo.
      if (fieldType is ParameterizedType) {
        for (final type in fieldType.typeArguments) {
          final typeElement = type.element3;

          // Type is not fully specified, ignore.
          if (typeElement is! ClassElement2) continue;

          final sourceClass =
              SerializerSourceClass(parsedLibraryResults, typeElement);

          if (sourceClass != this &&
              !result.build().contains(sourceClass) &&
              sourceClass.isSerializable) {
            result.add(sourceClass);
            result.replace(sourceClass._fieldClassesWith(result.build()));
          }
        }
      }

      final sourceClass =
          SerializerSourceClass(parsedLibraryResults, fieldTypeElement);
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
  LibraryFragment get compilationUnit => element.library2.firstFragment;

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
  String generateBuilderFactoryAdders(LibraryFragment compilationUnit) {
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
      // Add local $cast function if it will be used in code generated by
      // _generateFieldDeserializers.
      var needsCastFn = hasBuilder &&
          fields.any((f) =>
              f.builderFieldUsesNestedBuilder && f.builderFieldIsNullable);
      var maybeCastFn = needsCastFn
          ? r'''
T $cast<T>(dynamic any) => any as T;
'''
          : '';

      return '''
class $serializerImplName implements StructuredSerializer<$genericName> {
  @override
  final Iterable<Type> types = const [$name, $implName];
  @override
  final String wireName = '${escapeString(wireName)}';

  @override
  Iterable<Object?> serialize(Serializers serializers, $genericName object,
      {FullType specifiedType = FullType.unspecified}) {
    ${fields.isEmpty ? 'return <Object?>[];' : '''
    ${_generateGenericsSerializerPreamble()}
    final result = <Object?>[${_generateRequiredFieldSerializers()}];
    ${_generateNullableFieldSerializers()}
    return result;
    '''}
  }

  @override
  $genericName deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    ${_generateGenericsSerializerPreamble()}
    $maybeCastFn
    ${fields.isEmpty ? 'return ${_generateNewBuilder()}.build();' : '''
    final result = ${_generateNewBuilder()};

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
              .fields2
              .where((field) => field.isConst && field.isStatic)
              .forEach((field) {
            final enumSourceField = EnumSourceField(parsedLibrary, field);
            if (enumSourceField.settings.wireName != null) {
              b[field.name3!] = enumSourceField.settings.wireName!;
            } else if (enumSourceField.settings.wireNumber != null) {
              b[field.name3!] = enumSourceField.settings.wireNumber!;
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
           ${wireNameMapping.keys.map((key) => "'${escapeString(key)}': ${_toCode(wireNameMapping[key])},").join('\n')}
         };''';
        final fromWire = '''
         static const Map<Object, String> _fromWire = const <Object, String>{
           ${wireNameMapping.keys.map((key) => "${_toCode(wireNameMapping[key])}: '${escapeString(key)}',").join('\n')}
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

  static String _toCode(Object? object) {
    if (object is String) {
      return "'${escapeString(object)}'";
    } else if (object is int) {
      return object.toString();
    } else {
      throw UnsupportedError('$object');
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

    return 'Object? value;' +
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
      // If cast exists and is not nullable.
      var maybeNotNull = !field.isNullable && cast.isNotEmpty ? '!' : '';
      if (field.builderFieldUsesNestedBuilder) {
        if (hasBuilder && field.builderFieldIsNullable) {
          // The manually implemented builder might or might not return a
          // builder. If it does, use `replace` as usual. If not, use `$cast`
          // to avoid computing a new type of static cast.
          return '''
case '${escapeString(field.wireName)}':
  var maybeBuilder = result.${field.name};
  var fieldValue = serializers.deserialize(
      value, specifiedType: $fullType)! $cast;
  if (maybeBuilder == null) {
    result.${field.name} = \$cast(fieldValue.toBuilder());
  } else {
    maybeBuilder.replace(fieldValue);
  }
  break;
''';
        } else if (field.builderFieldAutoCreatesNestedBuilder) {
          // Use a looser cast where possible for calls to `replace`.
          final looseCast = field.generateCast(
              compilationUnit, _genericBoundsAsMap,
              forReplace: true);
          return '''
case '${escapeString(field.wireName)}':
  result.${field.name}.replace(serializers.deserialize(
      value, specifiedType: $fullType)! $looseCast);
  break;
''';
        } else {
          return '''
case '${escapeString(field.wireName)}':
  result.${field.name} = (serializers.deserialize(
      value, specifiedType: $fullType)$maybeNotNull $cast).toBuilder();
  break;
''';
        }
      } else {
        // `cast` is empty if no cast is needed.
        var maybeOrNull = field.isNullable && cast.isNotEmpty ? '?' : '';
        return '''
case '${escapeString(field.wireName)}':
  result.${field.name} = serializers.deserialize(
      value, specifiedType: $fullType)$maybeNotNull $cast$maybeOrNull;
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
      } else if (char == '\$') {
        result += '\$';
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
