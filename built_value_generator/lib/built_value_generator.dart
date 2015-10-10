// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator;

import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:quiver/iterables.dart' show concat;

import 'package:analyzer/src/generated/element.dart';
import 'package:source_gen/source_gen.dart';

/// Generator for Built Values.
///
/// See <https://github.com/google/built_value.dart/tree/master/example>
class BuiltValueGenerator extends Generator {
  Future<String> generate(Element element) async {
    if (element is! ClassElement) {
      return null;
    }
    final classElement = element as ClassElement;
    final className = classElement.displayName;

    // TODO(davidmorgan): more exact type check.
    if (!classElement.allSupertypes
        .any((interfaceType) => interfaceType.name == 'Built')) {
      return null;
    }

    if (classElement.displayName.startsWith('_\$')) {
      return null;
    }

    final fields = getFields(classElement);

    final builderClassElement =
        element.library.getType(classElement.displayName + 'Builder');
    final builderFields = getBuilderFields(builderClassElement);
    final errors = concat([
      checkPart(classElement),
      checkValueClass(classElement),
      checkBuilderClass(className, builderClassElement),
      checkFields(fields, builderFields),
    ]);

    if (errors.isNotEmpty) {
      throw new InvalidGenerationSourceError(
          'Please make changes to use built_value.',
          todo: errors.join(' '));
    }

    return generateCode(className, fields, builderFields);
  }

  Iterable<String> checkPart(ClassElement classElement) {
    final fileName =
        classElement.library.source.shortName.replaceAll('.dart', '');
    final expectedCode = "part '$fileName.g.dart';";
    return classElement.library.source.contents.data.contains(expectedCode)
        ? <String>[]
        : <String>['Import generated part: $expectedCode'];
  }

  Iterable<String> checkValueClass(ClassElement classElement) {
    final result = <String>[];
    final name = classElement.displayName;

    if (!classElement.isAbstract) {
      result.add('Make class abstract');
    }

    final expectedConstructor = '$name._();';
    final constructors = classElement.constructors
        .where((constructor) => !constructor.isFactory);
    if (constructors.length != 1 ||
        constructors.single.isSynthetic ||
        constructors.single.computeNode().toSource() != expectedConstructor) {
      result
          .add('Make class have exactly one constructor: $expectedConstructor');
    }

    final expectedFactory =
        'factory $name([updates(${name}Builder b)]) = _\$$name;';
    final factories =
        classElement.constructors.where((constructor) => constructor.isFactory);
    if (factories.length != 1 ||
        factories.single.computeNode().toSource() != expectedFactory) {
      result.add('Make class have exactly one factory: $expectedFactory');
    }

    return result;
  }

  Iterable<String> checkBuilderClass(
      String className, ClassElement classElement) {
    if (classElement == null) {
      return <String>['Add abstract class ${className}Builder'];
    }

    final result = <String>[];
    final name = classElement.displayName;

    if (!classElement.isAbstract) {
      result.add('Make builder class abstract');
    }

    final expectedConstructor = '$name._();';
    final constructors = classElement.constructors
        .where((constructor) => !constructor.isFactory);
    if (constructors.length != 1 ||
        constructors.single.isSynthetic ||
        constructors.single.computeNode().toSource() != expectedConstructor) {
      result.add(
          'Make builder class have exactly one constructor: $expectedConstructor');
    }

    final expectedFactory = 'factory $name() = _\$$name;';
    final factories =
        classElement.constructors.where((constructor) => constructor.isFactory);
    if (factories.length != 1 ||
        factories.single.computeNode().toSource() != expectedFactory) {
      result
          .add('Make builder class have exactly one factory: $expectedFactory');
    }

    return result;
  }

  List<FieldElement> getFields(ClassElement classElement) {
    final result = <FieldElement>[];
    for (final field in classElement.fields) {
      if (!field.isStatic &&
          (field.getter.isAbstract || field.getter.isSynthetic)) result
          .add(field);
    }
    return result;
  }

  List<FieldElement> getBuilderFields(ClassElement classElement) {
    final result = <FieldElement>[];
    if (classElement == null) {
      return result;
    }
    for (final field in classElement.fields) {
      if (!field.isStatic && field.getter != null) result.add(field);
    }
    return result;
  }

  Iterable<String> checkFields(
      Iterable<FieldElement> fields, Iterable<FieldElement> builderFields) {
    final result = <String>[];
    var checkFieldTypes = true;

    for (final field in fields) {
      final fieldName = field.displayName;
      if (field.getter == null || field.getter.isSynthetic) {
        checkFieldTypes = false;
        result.add('Make field $fieldName a getter');
      }
    }

    for (final field in builderFields) {
      final fieldName = field.displayName;
      if (field.getter == null ||
          field.getter.isAbstract ||
          !field.getter.isSynthetic) {
        checkFieldTypes = false;
        result.add('Make builder field $fieldName a normal field');
      }
    }

    final fieldNames =
        new BuiltList<String>(fields.map((field) => field.displayName));
    final builderFieldNames =
        new BuiltList<String>(builderFields.map((field) => field.displayName));
    if (fieldNames != builderFieldNames) {
      result.add(
          'Make builder have exactly these fields: ' + fieldNames.join(', '));
      checkFieldTypes = false;
    }

    if (checkFieldTypes) {
      for (int i = 0; i != fields.length; ++i) {
        final field = fields.elementAt(i);
        final fieldType = field.getter.returnType.displayName;
        final builderField = builderFields.elementAt(i);
        final builderFieldType = builderField.getter.returnType.displayName;
        if (fieldType != builderFieldType &&
            // TODO(davidmorgan): smarter check for builder types.
            fieldType.replaceAll('Built', '') !=
                builderFieldType.replaceAll('Builder', '')) {
          result.add(
              'Make builder field ${field.displayName} have type $fieldType');
        }
      }
    }

    return result;
  }

  String generateCode(String className, List<FieldElement> fields,
      List<FieldElement> builderFields) {
    final result = new StringBuffer();

    final fieldNames = fields.map((field) => field.displayName);

    final nullableFields = fields.where((field) => field.getter.metadata.any(
        (metadata) => metadata.evaluationResult.value.value == 'nullable'));
    final nullableFieldNames = nullableFields.map((field) => field.displayName);

    final buildableFields = builderFields.where(
        (field) => field.getter.returnType.displayName.contains('Builder'));
    final buildableFieldNames =
        buildableFields.map((field) => field.displayName);

    result.writeln('class _\$$className extends $className {');
    for (final field in fields) {
      final fieldName = field.displayName;
      final fieldType = field.getter.returnType.displayName;
      result.writeln('final $fieldType $fieldName;');
    }

    result.write('_\$$className._({');
    result.write(fieldNames.map((name) => 'this.$name').join(', '));
    result.write('}) : super._() {');
    for (final fieldName in fieldNames) {
      if (!nullableFieldNames.contains(fieldName)) {
        result.writeln(
            "if ($fieldName == null) throw new ArgumentError('null $fieldName');");
      }
    }
    result.write('}');

    result.writeln('factory _\$$className([updates(${className}Builder b)]) '
        '=> (new ${className}Builder()..update(updates)).build();');
    result.writeln('$className rebuild(updates(${className}Builder b)) '
        '=> (toBuilder()..update(updates)).build();');
    result.writeln('_\$${className}Builder toBuilder() '
        '=> new _\$${className}Builder()..replace(this);');

    result.writeln('bool operator==(other) {');
    result.writeln('  if (other is! $className) return false;');
    if (fields.length == 0) {
      result.writeln('return true;');
    } else {
      result.writeln('return');
      result.writeln(fieldNames
          .map((fieldName) => '$fieldName == other.$fieldName')
          .join('&&'));
      result.writeln(';');
    }
    result.writeln('}');

    result.writeln('int get hashCode {');
    if (fields.length == 0) {
      result.writeln('return ${className.hashCode};');
    } else {
      result.writeln('return hashObjects([');
      result.writeln(fieldNames.join(', '));
      result.writeln(']);');
    }
    result.writeln('}');

    result.writeln('String toString() {');
    if (fields.length == 0) {
      result.writeln("return '$className {}';");
    } else {
      result.writeln("return '$className {'");
      result.writeln(fieldNames
          .map((fieldName) => "'$fieldName=\${$fieldName.toString()}\\n'")
          .join(''));
      result.writeln("'}'");
      result.writeln(';');
    }
    result.writeln('}');

    result.writeln('}');

    result
        .writeln('class _\$${className}Builder extends ${className}Builder {');
    result.writeln();
    result.writeln('_\$${className}Builder() : super._();');

    for (final field in builderFields) {
      final fieldName = field.displayName;
      final fieldType = field.getter.returnType.displayName;
      result.writeln('$fieldType get $fieldName => super.$fieldName;');
      result.writeln('void set $fieldName($fieldType $fieldName) {');
      if (!nullableFieldNames.contains(fieldName)) {
        result.writeln(
            "if ($fieldName == null) throw new ArgumentError('null $fieldName');");
      }
      result.writeln('super.$fieldName = $fieldName;');
      result.writeln('}');
      result.writeln();
    }

    result.writeln('void replace(${className} other) {');
    result.writeln((fieldNames.map((name) {
      return buildableFieldNames.contains(name)
          ? 'super.$name = other.$name.toBuilder();'
          : 'super.$name = other.$name;';
    })).join('\n'));
    result.writeln('}');

    result.writeln('void update(updates(${className}Builder b)) {'
        ' if (updates != null) updates(this); }');
    result.writeln('$className build() => new _\$$className._(');
    result.write(builderFields.map((field) {
      final fieldName = field.displayName;

      return buildableFieldNames.contains(fieldName)
          ? '$fieldName: $fieldName.build()'
          : '$fieldName: $fieldName';
    }).join(', '));
    result.write(');');
    result.writeln('}');

    return result.toString();
  }
}
