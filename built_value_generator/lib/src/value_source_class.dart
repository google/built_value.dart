// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/built_parameters_visitor.dart';
import 'package:built_value_generator/src/value_source_field.dart';
import 'package:meta/meta.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

part 'value_source_class.g.dart';

abstract class ValueSourceClass
    implements Built<ValueSourceClass, ValueSourceClassBuilder> {
  String get name;
  String get builtParameters;
  bool get hasBuilder;
  String get builderParameters;
  BuiltList<ValueSourceField> get fields;

  String get partStatement;
  bool get hasPartStatement;

  bool get valueClassIsAbstract;
  BuiltList<String> get valueClassConstructors;
  BuiltList<String> get valueClassFactories;

  bool get builderClassIsAbstract;
  BuiltList<String> get builderClassConstructors;
  BuiltList<String> get builderClassFactories;

  factory ValueSourceClass([updates(ValueSourceClassBuilder b)]) =
      _$ValueSourceClass;
  ValueSourceClass._();

  factory ValueSourceClass.fromClassElement(ClassElement classElement) {
    final name = classElement.displayName;
    final builderClassElement = classElement.library.getType(name + 'Builder');
    final hasBuilder = builderClassElement != null;

    final result = new ValueSourceClassBuilder();
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
      ..fields.replace(ValueSourceField.fromClassElements(
          classElement, builderClassElement));

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
    final alternativeExpectedFactory =
        'factory $name([void updates(${name}Builder b)]) = _\$$name;';
    if (!valueClassFactories.any((factory) =>
        factory == expectedFactory || factory == alternativeExpectedFactory)) {
      result.add('Make class have factory: $expectedFactory');
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
      result.add(
          'Make builder class implement Builder<$expectedBuilderParameters>. '
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
      result.writeln('@override');
      result.writeln('final ${field.type} ${field.name};');
    }
    result.writeln();

    result.writeln('factory _\$$name([updates(${name}Builder b)]) '
        '=> (new ${name}Builder()..update(updates)).build();');
    result.writeln();

    if (fields.isEmpty) {
      result.write('_\$$name._() : super._()');
    } else {
      result.write('_\$$name._({');
      result.write(fields.map((field) => 'this.${field.name}').join(', '));
      result.write('}) : super._()');
    }
    final requiredFields = fields.where((field) => !field.isNullable);
    if (requiredFields.isEmpty) {
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

    result.writeln('@override');
    result.writeln('$name rebuild(updates(${name}Builder b)) '
        '=> (toBuilder()..update(updates)).build();');
    result.writeln();

    result.writeln('@override');
    if (hasBuilder) {
      result.writeln('_\$${name}Builder toBuilder() '
          '=> new _\$${name}Builder()..replace(this);');
    } else {
      result.writeln('${name}Builder toBuilder() '
          '=> new ${name}Builder()..replace(this);');
    }
    result.writeln();

    result.writeln('@override');
    result.writeln('bool operator==(dynamic other) {');
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

    result.writeln('@override');
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

    result.writeln('@override');
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
    } else {
      result.writeln(
          'class ${name}Builder implements Builder<$name, ${name}Builder>{');
    }

    // Builder holds a reference to a value, copies from it lazily.
    result.writeln('$name _\$v;');
    result.writeln('');

    if (hasBuilder) {
      for (final field in fields) {
        final type = field.type;
        final typeInBuilder = field.typeInBuilder;
        final name = field.name;

        if (field.isNestedBuilder) {
          result.writeln('@override');
          result.writeln('$typeInBuilder get $name {'
              '_\$writableBuilder;'
              'return super.$name ??= new $typeInBuilder();'
              '}');
          result.writeln('@override');
          result.writeln('set $name($typeInBuilder $name) {'
              '_\$writableBuilder;'
              'super.$name = $name;'
              '}');
        } else {
          result.writeln('@override');
          result.writeln('$type get $name => super.$name;');
          result.writeln('@override');
          result.writeln('set $name($type $name) {'
              '_\$writableBuilder;'
              'super.$name = $name;'
              '}');
        }
        result.writeln();
      }
    } else {
      for (final field in fields) {
        final type = field.type;
        final typeInBuilder = field.typeInBuilder;
        final name = field.name;

        if (field.isNestedBuilder) {
          result.writeln('$typeInBuilder _$name;');
          result.writeln('$typeInBuilder get $name =>'
              '_\$writableBuilder._$name ??= new $typeInBuilder();');
          result.writeln('set $name($typeInBuilder $name) =>'
              '_\$writableBuilder._$name = $name;');
        } else {
          result.writeln('$type _$name;');
          result.writeln('$type get $name => _$name;');
          result.writeln('set $name($type $name) =>'
              '_\$writableBuilder._$name = $name;');
        }
        result.writeln();
      }
    }
    result.writeln();

    if (hasBuilder) {
      result.writeln('_\$${name}Builder() : super._();');
    } else {
      result.writeln('${name}Builder();');
    }
    result.writeln();

    // Getter for "this" that does lazy copying if needed.
    result.writeln('${name}Builder get _\$writableBuilder {');
    result.writeln('if (_\$v != null) {');
    for (final field in fields) {
      final name = field.name;
      final nameInBuilder = hasBuilder ? 'super.$name' : '_$name';
      if (field.isNestedBuilder) {
        result.writeln('$nameInBuilder = _\$v.$name?.toBuilder();');
      } else {
        result.writeln('$nameInBuilder = _\$v.$name;');
      }
    }
    result.writeln('_\$v = null;');
    result.writeln('}');
    result.writeln('return this;');
    result.writeln('}');

    result.writeln('@override');
    result.writeln('void replace($name other) {');
    result.writeln('_\$v = other;');
    result.writeln('}');

    result.writeln('@override');
    result.writeln('void update(updates(${name}Builder b)) {'
        ' if (updates != null) updates(this); }');
    result.writeln();

    result.writeln('@override');
    result.writeln('$name build() {');
    result.writeln('final result = _\$v ?? ');
    result.writeln('new _\$$name._(');
    result.write(fields.map((field) {
      final name = field.name;
      if (!field.isNestedBuilder) return '$name: $name';
      // If not nullable, go via the public accessor, which instantiates
      // if needed.
      if (!field.isNullable) return '$name: $name?.build()';
      // Otherwise access the private field: in super if there's a manually
      // maintaned builder, otherwise here.
      return hasBuilder
          ? '$name: super.$name?.build()'
          : '$name: _$name?.build()';
    }).join(', '));
    result.writeln(');');
    // Set _$v to the built value, so it will be lazily copied if needed.
    result.writeln('replace(result);');
    result.writeln('return result;');
    result.writeln('}');
    result.writeln('}');

    return result.toString();
  }
}

abstract class ValueSourceClassBuilder
    implements Builder<ValueSourceClass, ValueSourceClassBuilder> {
  @virtual
  String name;
  @virtual
  String builtParameters;
  @virtual
  bool hasBuilder;
  @virtual
  String builderParameters = '';
  @virtual
  ListBuilder<ValueSourceField> fields = new ListBuilder<ValueSourceField>();

  @virtual
  String partStatement;
  @virtual
  bool hasPartStatement;

  @virtual
  bool valueClassIsAbstract;
  @virtual
  ListBuilder<String> valueClassConstructors = new ListBuilder<String>();
  @virtual
  ListBuilder<String> valueClassFactories = new ListBuilder<String>();

  @virtual
  bool builderClassIsAbstract = true;
  @virtual
  ListBuilder<String> builderClassConstructors = new ListBuilder<String>();
  @virtual
  ListBuilder<String> builderClassFactories = new ListBuilder<String>();

  factory ValueSourceClassBuilder() = _$ValueSourceClassBuilder;
  ValueSourceClassBuilder._();
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  final message = new StringBuffer(
      'Please make the following changes to use BuiltValue:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return new InvalidGenerationSourceError(message.toString());
}
