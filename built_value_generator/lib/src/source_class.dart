// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/built_parameters_visitor.dart';
import 'package:built_value_generator/src/source_field.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

part 'source_class.g.dart';

abstract class SourceClass implements Built<SourceClass, SourceClassBuilder> {
  String get name;
  String get builtParameters;
  bool get hasBuilder;
  String get builderParameters;
  BuiltList<SourceField> get fields;

  String get partStatement;
  bool get hasPartStatement;

  bool get valueClassIsAbstract;
  BuiltList<String> get valueClassConstructors;
  BuiltList<String> get valueClassFactories;

  bool get builderClassIsAbstract;
  BuiltList<String> get builderClassConstructors;
  BuiltList<String> get builderClassFactories;

  SourceClass._();
  factory SourceClass([updates(SourceClassBuilder b)]) = _$SourceClass;

  factory SourceClass.fromClassElement(ClassElement classElement) {
    final name = classElement.displayName;
    final builderClassElement = classElement.library.getType(name + 'Builder');
    final hasBuilder = builderClassElement != null;

    final result = new SourceClassBuilder();
    result
      ..name = name
      ..builtParameters = _getBuiltParameters(classElement)
      ..hasBuilder = hasBuilder
      ..partStatement = _getPartStatement(classElement)
      ..hasPartStatement = _getHasPartStatement(classElement)
      ..valueClassIsAbstract = classElement.isAbstract
      ..valueClassConstructors.replace(classElement.constructors
          .where((constructor) =>
              !constructor.isFactory && !constructor.isSynthetic)
          .map((constructor) => constructor.computeNode().toSource()))
      ..valueClassFactories.replace(classElement.constructors
          .where((constructor) => constructor.isFactory)
          .map((factory) => factory.computeNode().toSource()))
      ..fields.replace(
          SourceField.fromClassElements(classElement, builderClassElement));

    if (hasBuilder) {
      result
        ..builderParameters = _getBuilderParameters(builderClassElement)
        ..builderClassIsAbstract = builderClassElement.isAbstract
        ..builderClassConstructors.replace(builderClassElement.constructors
            .where((constructor) =>
                !constructor.isFactory && !constructor.isSynthetic)
            .map((constructor) => constructor.computeNode().toSource()))
        ..builderClassFactories.replace(builderClassElement.constructors
            .where((constructor) => constructor.isFactory)
            .map((factory) => factory.computeNode().toSource()));
    }

    return result.build();
  }

  static String _getBuiltParameters(ClassElement classElement) {
    final visitor = new BuiltParametersVisitor();
    classElement.computeNode().accept(visitor);
    return visitor.result;
  }

  static String _getBuilderParameters(ClassElement classElement) {
    return classElement.allSupertypes
        .where((interfaceType) => interfaceType.name == 'Builder')
        .single
        .typeArguments
        .map((element) => element.displayName)
        .join(', ');
  }

  static String _getPartStatement(ClassElement classElement) {
    final fileName =
        classElement.library.source.shortName.replaceAll('.dart', '');
    return "part '$fileName.g.dart';";
  }

  static bool _getHasPartStatement(ClassElement classElement) {
    final expectedCode = _getPartStatement(classElement);
    return classElement.library.source.contents.data.contains(expectedCode);
  }

  static bool needsBuiltValue(ClassElement classElement) {
    // TODO(davidmorgan): more exact type check.
    return classElement.allSupertypes
            .any((interfaceType) => interfaceType.name == 'Built') &&
        !classElement.displayName.startsWith('_\$');
  }

  Iterable<String> _computeErrors() {
    return concat([
      _checkPart(),
      _checkValueClass(),
      _checkBuilderClass(),
      _checkFieldList(),
      concat(fields.map((field) => field.computeErrors()))
    ]);
  }

  Iterable<String> _checkPart() {
    return hasPartStatement ? [] : ['Import generated part: $partStatement'];
  }

  Iterable<String> _checkValueClass() {
    final result = <String>[];

    if (!valueClassIsAbstract) {
      result.add('Make class abstract.');
    }

    final expectedBuildParameters = '$name, ${name}Builder';
    if (builtParameters != expectedBuildParameters) {
      result.add('Make class implement Built<$expectedBuildParameters>. '
          'Currently: Built<$builtParameters>');
    }

    final expectedConstructor = '$name._()';
    if (valueClassConstructors.length != 1 ||
        !(valueClassConstructors.single.startsWith(expectedConstructor))) {
      result.add(
          'Make class have exactly one constructor: $expectedConstructor;');
    }

    final expectedFactory =
        'factory $name([updates(${name}Builder b)]) = _\$$name;';
    if (!valueClassFactories.any((factory) => factory == expectedFactory)) {
      result.add(
          'Make class have factory: $expectedFactory -- got $valueClassFactories');
    }

    return result;
  }

  Iterable<String> _checkBuilderClass() {
    final result = <String>[];
    if (!hasBuilder) return result;

    if (!builderClassIsAbstract) {
      result.add('Make builder class abstract.');
    }

    final expectedBuilderParameters = '$name, ${name}Builder';
    if (builderParameters != expectedBuilderParameters) {
      result.add('Make builder class implement Builder<$expectedBuilderParameters>. '
          'Currently: Builder<$builderParameters>');
    }

    final expectedConstructor = '${name}Builder._()';
    if (builderClassConstructors.length != 1 ||
        !(builderClassConstructors.single.startsWith(expectedConstructor))) {
      result.add(
          'Make builder class have exactly one constructor: $expectedConstructor;');
    }

    final expectedFactory = 'factory ${name}Builder() = _\$${name}Builder;';
    if (builderClassFactories.length != 1 ||
        builderClassFactories.single != expectedFactory) {
      result
          .add('Make builder class have exactly one factory: $expectedFactory');
    }

    return result;
  }

  Iterable<String> _checkFieldList() {
    if (!hasBuilder) return <String>[];
    return fields.any((field) => !field.builderFieldExists)
        ? [
            'Make builder have exactly these fields: ' +
                fields.map((field) => field.name).join(', ')
          ]
        : [];
  }

  String generateCode() {
    final errors = _computeErrors();
    if (errors.isNotEmpty) throw _makeError(errors);

    final result = new StringBuffer();

    result.writeln('class _\$$name extends $name {');
    for (final field in fields) {
      result.writeln('final ${field.type} ${field.name};');
    }
    result.writeln();

    if (fields.isEmpty) {
      result.write('_\$$name._() : super._()');
    } else {
      result.write('_\$$name._({');
      result.write(fields.map((field) => 'this.${field.name}').join(', '));
      result.write('}) : super._()');
    }
    final requiredFields = fields.where((field) => !field.isNullable);
    if (requiredFields.isEmpty){
      result.writeln(';');
    } else {
      result.writeln('{');
      for (final field in requiredFields) {
        result.writeln("if (${field.name} == null) "
            "throw new ArgumentError.notNull('${field.name}');");
      }
      result.writeln('}');
    }
    result.writeln();

    result.writeln('factory _\$$name([updates(${name}Builder b)]) '
        '=> (new ${name}Builder()..update(updates)).build();');
    result.writeln();

    result.writeln('$name rebuild(updates(${name}Builder b)) '
        '=> (toBuilder()..update(updates)).build();');
    result.writeln();

    if (hasBuilder) {
      result.writeln('_\$${name}Builder toBuilder() '
          '=> new _\$${name}Builder()..replace(this);');
    } else {
      result.writeln('${name}Builder toBuilder() '
          '=> new ${name}Builder()..replace(this);');
    }
    result.writeln();

    result.writeln('bool operator==(other) {');
    result.writeln('  if (other is! $name) return false;');
    if (fields.length == 0) {
      result.writeln('return true;');
    } else {
      result.writeln('return');
      result.writeln(fields
          .map((field) => '${field.name} == other.${field.name}')
          .join('&&'));
      result.writeln(';');
    }
    result.writeln('}');
    result.writeln();

    result.writeln('int get hashCode {');
    if (fields.length == 0) {
      result.writeln('return ${name.hashCode};');
    } else {
      result.writeln(r'return $jf(');
      result.writeln(r'$jc(' * fields.length);
      result.writeln('0, ');
      result.write(fields.map((field) => '${field.name}.hashCode').join('), '));
      result.writeln('));');
    }
    result.writeln('}');
    result.writeln();

    result.writeln('String toString() {');
    if (fields.length == 0) {
      result.writeln("return '$name {}';");
    } else {
      result.writeln("return '$name {'");
      result.writeln(fields
          .map((field) => "'${field.name}=\${${field.name}.toString()},\\n'")
          .join(''));
      result.writeln("'}'");
      result.writeln(';');
    }
    result.writeln('}');
    result.writeln();

    result.writeln('}');

    if (hasBuilder) {
      result.writeln('class _\$${name}Builder extends ${name}Builder {');
      result.writeln('_\$${name}Builder() : super._();');
    } else {
      result.writeln(
          'class ${name}Builder implements Builder<$name, ${name}Builder>{');
      result.writeln('${name}Builder();');
    }

    if (!hasBuilder) {
      for (final field in fields) {
        // Nested builders are initialized to an empty builder, unless the
        // field is nullable.
        if (field.isNestedBuilder && !field.isNullable) {
          result.writeln(
              '${field.typeInBuilder} ${field.name} = new ${field.typeInBuilder}();');
        } else {
          result.writeln('${field.typeInBuilder} ${field.name};');
        }
      }
      result.writeln();
    }

    result.writeln('void replace(${name} other) {');
    result.writeln((fields.map((field) {
      final superOrThis = hasBuilder ? 'super' : 'this';
      return field.isNestedBuilder
          ? '$superOrThis.${field.name} = other.${field.name}?.toBuilder();'
          : '$superOrThis.${field.name} = other.${field.name};';
    }))
        .join('\n'));
    result.writeln('}');
    result.writeln();

    result.writeln('void update(updates(${name}Builder b)) {'
        ' if (updates != null) updates(this); }');
    result.writeln();

    result.writeln('$name build() {');
    result.writeln('return new _\$$name._(');
    result.write(fields.map((field) {
      return field.isNestedBuilder
          ? '${field.name}: ${field.name}?.build()'
          : '${field.name}: ${field.name}';
    }).join(', '));
    result.write(');');
    result.writeln('}');
    result.writeln('}');

    return result.toString();
  }
}

abstract class SourceClassBuilder
    implements Builder<SourceClass, SourceClassBuilder> {
  String name;
  String builtParameters;
  bool hasBuilder;
  String builderParameters = '';
  ListBuilder<SourceField> fields = new ListBuilder<SourceField>();

  String partStatement;
  bool hasPartStatement;

  bool valueClassIsAbstract;
  ListBuilder<String> valueClassConstructors = new ListBuilder<String>();
  ListBuilder<String> valueClassFactories = new ListBuilder<String>();

  bool builderClassIsAbstract = true;
  ListBuilder<String> builderClassConstructors = new ListBuilder<String>();
  ListBuilder<String> builderClassFactories = new ListBuilder<String>();

  SourceClassBuilder._();
  factory SourceClassBuilder() = _$SourceClassBuilder;
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  final message = new StringBuffer(
      'Please make the following changes to use BuiltValue:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return new InvalidGenerationSourceError(message.toString());
}
