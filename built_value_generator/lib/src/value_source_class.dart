// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/built_parameters_visitor.dart';
import 'package:built_value_generator/src/memoized_getter.dart';
import 'package:built_value_generator/src/value_source_field.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

part 'value_source_class.g.dart';

abstract class ValueSourceClass
    implements Built<ValueSourceClass, ValueSourceClassBuilder> {
  ClassElement get element;

  factory ValueSourceClass(ClassElement element) =>
      new _$ValueSourceClass._(element: element);
  ValueSourceClass._();

  @memoized
  String get name => element.displayName;

  @memoized
  ClassElement get builderElement => element.library.getType(name + 'Builder');

  @memoized
  bool get implementsBuilt => element.allSupertypes
      .any((interfaceType) => interfaceType.name == 'Built');

  @memoized
  BuiltValue get settings {
    final annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => value?.type?.displayName == 'BuiltValue');
    if (annotations.isEmpty) return const BuiltValue();
    final annotation = annotations.single;
    return new BuiltValue(
        instantiable: annotation.getField('instantiable').toBoolValue(),
        nestedBuilders: annotation.getField('nestedBuilders').toBoolValue());
  }

  @memoized
  BuiltList<String> get genericParameters =>
      new BuiltList<String>(element.typeParameters
          .map((element) => element.computeNode().toString()));

  @memoized
  BuiltList<String> get genericBounds =>
      new BuiltList<String>(element.typeParameters
          .map((element) => (element.bound ?? '').toString()));

  @memoized
  String get builtParameters {
    final visitor = new BuiltParametersVisitor();
    element.computeNode().accept(visitor);
    return visitor.result;
  }

  @memoized
  bool get hasBuilder => builderElement != null;

  @memoized
  String get builderParameters {
    return builderElement.allSupertypes
        .where((interfaceType) => interfaceType.name == 'Builder')
        .single
        .typeArguments
        .map((element) => element.displayName)
        .join(', ');
  }

  @memoized
  BuiltList<ValueSourceField> get fields =>
      ValueSourceField.fromClassElements(settings, element, builderElement);

  @memoized
  String get partStatement {
    final fileName = element.library.source.shortName.replaceAll('.dart', '');
    return "part '$fileName.g.dart';";
  }

  @memoized
  bool get hasPartStatement {
    final expectedCode = partStatement;
    return element.library.source.contents.data.contains(expectedCode);
  }

  @memoized
  bool get valueClassIsAbstract => element.isAbstract;

  @memoized
  BuiltList<String> get valueClassConstructors => new BuiltList<String>(element
      .constructors
      .where(
          (constructor) => !constructor.isFactory && !constructor.isSynthetic)
      .map((constructor) => constructor.computeNode().toSource()));

  @memoized
  BuiltList<String> get valueClassFactories =>
      new BuiltList<String>(element.constructors
          .where((constructor) => constructor.isFactory)
          .map((factory) => factory.computeNode().toSource()));

  @memoized
  bool get builderClassIsAbstract => builderElement.isAbstract;

  @memoized
  BuiltList<String> get builderClassConstructors =>
      new BuiltList<String>(builderElement.constructors
          .where((constructor) =>
              !constructor.isFactory && !constructor.isSynthetic)
          .map((constructor) => constructor.computeNode().toSource()));

  @memoized
  BuiltList<String> get builderClassFactories =>
      new BuiltList<String>(builderElement.constructors
          .where((constructor) => constructor.isFactory)
          .map((factory) => factory.computeNode().toSource()));

  @memoized
  BuiltList<MemoizedGetter> get memoizedGetters =>
      new BuiltList<MemoizedGetter>(MemoizedGetter.fromClassElement(element));

  /// Returns the `implements` clause for the builder.
  ///
  /// All builders implement `Builder`.
  ///
  /// Additionally, if the value class implements other value classes, the
  /// builder implements the corresponding builders.
  @memoized
  BuiltList<String> get builderImplements =>
      new BuiltList<String>.build((b) => b
        ..add('Builder<$name$_generics, ${name}Builder$_generics>')
        ..addAll(element.interfaces
            .where((interface) => needsBuiltValue(interface.element))
            .map((interface) {
          final displayName = interface.displayName;
          if (!displayName.contains('<')) return displayName + 'Builder';
          final index = displayName.indexOf('<');
          return displayName.substring(0, index) +
              'Builder' +
              displayName.substring(index);
        })));

  @memoized
  bool get implementsHashCode => element.getGetter('hashCode') != null;

  @memoized
  bool get implementsOperatorEquals => element.getMethod('==') != null;

  @memoized
  bool get implementsToString => element.getMethod('toString') != null;

  static bool needsBuiltValue(ClassElement classElement) {
    // TODO(davidmorgan): more exact type check.
    return !classElement.displayName.startsWith('_\$') &&
        (classElement.allSupertypes
                .any((interfaceType) => interfaceType.name == 'Built') ||
            classElement.metadata
                .map((annotation) => annotation.computeConstantValue())
                .any((value) => value?.type?.displayName == 'BuiltValue'));
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

    if (settings.instantiable) {
      final expectedBuildParameters =
          '$name$_generics, ${name}Builder$_generics';
      if (builtParameters != expectedBuildParameters) {
        result.add('Make class implement Built<$expectedBuildParameters>. '
            'Currently: Built<$builtParameters>');
      }
    }

    if (settings.instantiable) {
      final expectedConstructor = '$name._()';
      if (valueClassConstructors.length != 1 ||
          !(valueClassConstructors.single.startsWith(expectedConstructor))) {
        result.add(
            'Make class have exactly one constructor: $expectedConstructor;');
      }
    } else {
      if (valueClassConstructors.length != 0) {
        result.add('Remove all constructors or remove "instantiable: false".');
      }
    }

    if (settings.instantiable) {
      if (!valueClassFactories
          .any((factory) => factory.contains('_\$$name$_generics'))) {
        result
            .add('Add a factory so your class can be instantiated. Example:\n\n'
                'factory $name([updates(${name}Builder$_generics b)]) = '
                '_\$$name$_generics;');
      }
    } else {
      if (valueClassFactories.isNotEmpty) {
        result.add('Remove all factories or remove "instantiable: false".');
      }
    }

    if (implementsHashCode) {
      result.add('Stop implementing hashCode; it will be generated for you.');
    }

    if (implementsOperatorEquals) {
      result.add('Stop implementing operator==; it will be generated for you.');
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

  String get _generics =>
      genericParameters.isEmpty ? '' : '<' + genericParameters.join(', ') + '>';

  String get _boundedGenerics => genericParameters.isEmpty
      ? ''
      : '<' +
          zip(<Iterable>[genericParameters, genericBounds]).map((zipped) {
            final parameter = zipped[0] as String;
            final bound = zipped[1] as String;
            return bound.isEmpty ? parameter : '$parameter extends $bound';
          }).join(', ') +
          '>';

  String generateCode() {
    final errors = _computeErrors();
    if (errors.isNotEmpty) throw _makeError(errors);

    final result = new StringBuffer();
    if (settings.instantiable) result.write(_generateImpl());
    if (settings.instantiable) {
      result.write(_generateBuilder());
    } else if (!hasBuilder) {
      result.write(_generateAbstractBuilder());
    }
    return result.toString();
  }

  /// Generates the value class implementation.
  String _generateImpl() {
    final result = new StringBuffer();
    result.writeln('class _\$$name$_boundedGenerics extends $name$_generics {');
    for (final field in fields) {
      result.writeln('@override');
      result.writeln('final ${field.type} ${field.name};');
    }
    for (final memoizedGetter in memoizedGetters) {
      result.writeln('${memoizedGetter.returnType} __${memoizedGetter.name};');
    }
    result.writeln();

    // If there is a manually maintained builder we have to cast the "build()"
    // result to the generated value class. If the builder is generated, that
    // can return the right type directly and needs no cast.
    final cast = hasBuilder ? 'as _\$$name' : '';
    result.writeln(
        'factory _\$$name([void updates(${name}Builder$_generics b)]) '
        '=> (new ${name}Builder$_generics()..update(updates)).build() $cast;');
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

    for (final memoizedGetter in memoizedGetters) {
      result.writeln('@override');
      result.writeln(
          '${memoizedGetter.returnType} get ${memoizedGetter.name} =>');
      result.writeln(
          '__${memoizedGetter.name} ??= super.${memoizedGetter.name};');
      result.writeln();
    }

    result.writeln('@override');
    result.writeln(
        '$name$_generics rebuild(void updates(${name}Builder$_generics b)) '
        '=> (toBuilder()..update(updates)).build();');
    result.writeln();

    result.writeln('@override');
    if (hasBuilder) {
      result.writeln('_\$${name}Builder$_generics toBuilder() '
          '=> new _\$${name}Builder$_generics()..replace(this);');
    } else {
      result.writeln('${name}Builder$_generics toBuilder() '
          '=> new ${name}Builder$_generics()..replace(this);');
    }
    result.writeln();

    result.writeln('@override');
    result.writeln('bool operator==(dynamic other) {');
    result.writeln('  if (identical(other, this)) return true;');
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

    // Only generate toString() if there wasn't one already.
    if (!implementsToString) {
      result.writeln('@override');
      result.writeln('String toString() {');
      if (fields.length == 0) {
        result
            .writeln("return newBuiltValueToStringHelper('$name').toString();");
      } else {
        result.writeln("return (newBuiltValueToStringHelper('$name')");
        result.writeln(fields
            .map((field) => "..add('${field.name}',  ${field.name})")
            .join(''));
        result.writeln(").toString();");
      }
      result.writeln('}');
      result.writeln();
    }

    result.writeln('}');
    return result.toString();
  }

  /// Generates the builder implementation.
  String _generateBuilder() {
    final result = new StringBuffer();
    if (hasBuilder) {
      result.writeln(
          'class _\$${name}Builder$_boundedGenerics extends ${name}Builder$_generics {');
    } else {
      result.writeln('class ${name}Builder$_boundedGenerics implements '
          '${builderImplements.join(", ")} {');
    }

    // Builder holds a reference to a value, copies from it lazily.
    result.writeln('_\$$name$_generics _\$v;');
    result.writeln('');

    if (hasBuilder) {
      for (final field in fields) {
        final type = field.type;
        final typeInBuilder = field.typeInBuilder;
        final name = field.name;

        if (field.isNestedBuilder) {
          result.writeln('@override');
          result.writeln('$typeInBuilder get $name {'
              '_\$this;'
              'return super.$name ??= new $typeInBuilder();'
              '}');
          result.writeln('@override');
          result.writeln('set $name($typeInBuilder $name) {'
              '_\$this;'
              'super.$name = $name;'
              '}');
        } else {
          result.writeln('@override');
          result.writeln('$typeInBuilder get $name {'
              '_\$this;'
              'return super.$name;'
              '}');
          result.writeln('@override');
          result.writeln('set $name($type $name) {'
              '_\$this;'
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
              '_\$this._$name ??= new $typeInBuilder();');
          result.writeln('set $name($typeInBuilder $name) =>'
              '_\$this._$name = $name;');
        } else {
          result.writeln('$type _$name;');
          result.writeln('$type get $name => _\$this._$name;');
          result.writeln('set $name($type $name) =>'
              '_\$this._$name = $name;');
        }
        result.writeln();
      }
    }
    result.writeln();

    if (hasBuilder) {
      result.writeln('_\$${name}Builder() : super._()');
    } else {
      result.writeln('${name}Builder()');
    }
    // If there are generic parameters, check they are not "dynamic".
    if (genericParameters.isEmpty) {
      result.writeln(';');
    } else {
      result.writeln('{');
      for (final genericParameter in genericParameters) {
        result.writeln(
            'if ($genericParameter == dynamic) throw new ArgumentError.value('
            "'dynamic', '$genericParameter', "
            "'All type arguments must be specified.');");
      }
      result.writeln('}');
    }
    result.writeln();

    // Getter for "this" that does lazy copying if needed.
    if (fields.isNotEmpty) {
      result.writeln('${name}Builder$_generics get _\$this {');
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
    }

    result.writeln('@override');
    if (builderImplements.length > 1) {
      // If we're overriding `replace` from other builders, tell the analyzer
      // that this builder only accepts values of exactly the right type, by
      // marking the value `covariant`.
      result.writeln('void replace(covariant $name$_generics other) {');
    } else {
      result.writeln('void replace($name$_generics other) {');
    }

    result.writeln("if (other == null) "
        "throw new ArgumentError.notNull('other');");
    result.writeln('_\$v = other as _\$$name$_generics;');
    result.writeln('}');

    result.writeln('@override');
    result.writeln('void update(void updates(${name}Builder$_generics b)) {'
        ' if (updates != null) updates(this); }');
    result.writeln();

    result.writeln('@override');
    result.writeln('_\$$name$_generics build() {');
    result.writeln('final _\$result = _\$v ?? ');
    result.writeln('new _\$$name$_generics._(');
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
    result.writeln('replace(_\$result);');
    result.writeln('return _\$result;');
    result.writeln('}');
    result.writeln('}');

    return result.toString();
  }

  /// Generates an abstract builder with just abstract setters and getters.
  String _generateAbstractBuilder() {
    final result = new StringBuffer();

    if (implementsBuilt) {
      result.writeln('abstract class ${name}Builder$_boundedGenerics '
          'implements ${builderImplements.join(", ")} {');
    } else {
      // The "Built" interface has been omitted to work around dart2js issue
      // https://github.com/dart-lang/sdk/issues/14729. So, we can't implement
      // "Builder". Add the methods explicitly.
      result.writeln('abstract class ${name}Builder$_boundedGenerics {');

      result.writeln('void replace($name$_generics other);');
      result.writeln('void update(void updates(${name}Builder$_generics b));');
    }

    for (final field in fields) {
      final typeInBuilder = field.typeInBuilder;
      final name = field.name;

      result.writeln('$typeInBuilder get $name;');
      result.writeln('set $name($typeInBuilder $name);');
      result.writeln();
    }

    result.writeln('}');
    return result.toString();
  }
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  final message = new StringBuffer(
      'Please make the following changes to use BuiltValue:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return new InvalidGenerationSourceError(message.toString());
}
