// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/analysis/results.dart'; // ignore: implementation_imports
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/fixes.dart';
import 'package:built_value_generator/src/memoized_getter.dart';
import 'package:built_value_generator/src/value_source_field.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

part 'value_source_class.g.dart';

const String _importWithSingleQuotes =
    "import 'package:built_value/built_value.dart'";
const String _importWithDoubleQuotes =
    'import "package:built_value/built_value.dart"';

abstract class ValueSourceClass
    implements Built<ValueSourceClass, ValueSourceClassBuilder> {
  ClassElement get element;

  factory ValueSourceClass(ClassElement element) =>
      new _$ValueSourceClass._(element: element);
  ValueSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      // ignore: deprecated_member_use
      ParsedLibraryResultImpl.tmp(element.library);

  @memoized
  String get name => element.displayName;

  /// Returns the class name for the generated implementation. If the manually
  /// maintained class is private then we ignore the underscore here, to avoid
  /// returning a class name starting `_$_`.
  @memoized
  String get implName =>
      name.startsWith('_') ? '_\$${name.substring(1)}' : '_\$$name';

  @memoized
  ClassElement get builderElement {
    final result = element.library.getType(name + 'Builder');
    if (result == null) return null;
    // If the builder is in a generated file, then we're analyzing _after_ code
    // generation. Ignore it. This happens when running as an analyzer plugin.
    if (result.source.fullName.endsWith('.g.dart')) return null;
    return result;
  }

  @memoized
  bool get implementsBuilt => element.allSupertypes
      .any((interfaceType) => interfaceType.name == 'Built');

  @memoized
  bool get extendsIsAllowed {
    // Usually `extends` is not allowed. But, allow one special case:
    //
    // A `built_value` class may share code with a `const` class by extending
    // a `const` base class. There's no other way to do this sharing because
    // a `const` class is not allowed to use a mixin.
    //
    // To avoid causing problems for `built_value` the base class must be
    // abstract, must have no fields, must have no abstract getters, and
    // must not implement `operator==`, `hashCode` or `toString`.
    // This means it _is_ allowed to have concrete getters as well as
    // concrete and abstract methods.

    for (var supertype in [element.supertype]
      ..addAll(element.supertype.element.allSupertypes)) {
      if (supertype.displayName == 'Object') continue;

      // Base class must be abstract.
      if (!supertype.element.isAbstract) return false;

      // Base class must have no fields.
      if (supertype.element.fields
          .any((field) => !field.isStatic && !field.isSynthetic)) {
        return false;
      }

      // Base class must have no abstract getters.
      if (supertype.accessors.any((accessor) =>
          !accessor.isStatic && accessor.isGetter && accessor.isAbstract)) {
        return false;
      }

      // Base class must not implement operator==, hashCode or toString.
      if (supertype.element.getMethod('hashCode') != null) return false;
      if (supertype.element.getMethod('==') != null) return false;
      if (supertype.element.getMethod('toString') != null) return false;
    }

    return true;
  }

  @memoized
  BuiltValue get settings {
    final annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => value?.type?.displayName == 'BuiltValue');
    if (annotations.isEmpty) return const BuiltValue();
    final annotation = annotations.single;
    // If a field does not exist, that means an old `built_value` version; use
    // the default.
    return new BuiltValue(
        comparableBuilders:
            annotation.getField('comparableBuilders')?.toBoolValue() ?? false,
        instantiable:
            annotation.getField('instantiable')?.toBoolValue() ?? true,
        nestedBuilders:
            annotation.getField('nestedBuilders')?.toBoolValue() ?? true,
        autoCreateNestedBuilders:
            annotation.getField('autoCreateNestedBuilders')?.toBoolValue() ??
                true,
        wireName: annotation.getField('wireName')?.toStringValue());
  }

  @memoized
  BuiltList<String> get genericParameters =>
      new BuiltList<String>(element.typeParameters.map((e) => e.name));

  @memoized
  BuiltList<String> get genericBounds =>
      new BuiltList<String>(element.typeParameters
          .map((element) => (element.bound ?? '').toString()));

  @memoized
  ClassDeclaration get classDeclaration {
    return parsedLibrary.getElementDeclaration(element).node
        as ClassDeclaration;
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
  BuiltList<ValueSourceField> get fields => ValueSourceField.fromClassElements(
      settings, parsedLibrary, element, builderElement);

  @memoized
  String get source =>
      element.library.definingCompilationUnit.source.contents.data;

  @memoized
  String get partStatement {
    final fileName = element.library.source.shortName.replaceAll('.dart', '');
    return "part '$fileName.g.dart';";
  }

  @memoized
  bool get hasPartStatement {
    final expectedCode = partStatement;
    return source.contains(expectedCode);
  }

  @memoized
  bool get hasBuiltValueImportWithShow {
    // It would be more accurate to check using the AST, but this is
    // potentially expensive. We already have the source for the "part of"
    // check, use that.
    return source.contains('$_importWithSingleQuotes show') ||
        source.contains('$_importWithDoubleQuotes show');
  }

  @memoized
  bool get hasBuiltValueImportWithAs {
    // It would be more accurate to check using the AST, but this is
    // potentially expensive. We already have the source for the "part of"
    // check, use that.
    return source.contains('$_importWithSingleQuotes as') ||
        source.contains('$_importWithDoubleQuotes as');
  }

  @memoized
  bool get valueClassIsAbstract => element.isAbstract;

  @memoized
  BuiltList<ConstructorDeclaration> get valueClassConstructors =>
      new BuiltList<ConstructorDeclaration>(element.constructors
          .where((constructor) =>
              !constructor.isFactory && !constructor.isSynthetic)
          .map((constructor) =>
              parsedLibrary.getElementDeclaration(constructor).node));

  @memoized
  BuiltList<ConstructorDeclaration> get valueClassFactories =>
      new BuiltList<ConstructorDeclaration>(element.constructors
          .where((constructor) => constructor.isFactory)
          .map((factory) => parsedLibrary.getElementDeclaration(factory).node));

  @memoized
  bool get builderClassIsAbstract => builderElement.isAbstract;

  @memoized
  BuiltList<String> get builderClassConstructors =>
      new BuiltList<String>(builderElement.constructors
          .where((constructor) =>
              !constructor.isFactory && !constructor.isSynthetic)
          .map((constructor) => parsedLibrary
              .getElementDeclaration(constructor)
              .node
              .toSource()));

  @memoized
  BuiltList<String> get builderClassFactories =>
      new BuiltList<String>(builderElement.constructors
          .where((constructor) => constructor.isFactory)
          .map((factory) =>
              parsedLibrary.getElementDeclaration(factory).node.toSource()));

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

  @memoized
  CompilationUnitElement get compilationUnit =>
      element.library.definingCompilationUnit;

  static bool needsBuiltValue(ClassElement classElement) {
    // TODO(davidmorgan): more exact type check.
    return !classElement.displayName.startsWith('_\$') &&
        (classElement.allSupertypes
                .any((interfaceType) => interfaceType.name == 'Built') ||
            classElement.metadata
                .map((annotation) => annotation.computeConstantValue())
                .any((value) => value?.type?.displayName == 'BuiltValue'));
  }

  Iterable<GeneratorError> computeErrors() {
    return concat([
      _checkPart(),
      _checkSettings(),
      _checkValueClass(),
      _checkBuilderClass(),
      _checkFieldList(),
      concat(fields.map((field) => field.computeErrors()))
    ]);
  }

  Iterable<GeneratorError> _checkPart() {
    if (hasPartStatement) return [];

    final directives = (classDeclaration.parent as CompilationUnit).directives;
    if (directives.isEmpty) {
      return [
        new GeneratorError((b) => b
          ..message = 'Import generated part: $partStatement'
          ..offset = 0
          ..length = 0
          ..fix = '$partStatement\n\n')
      ];
    } else {
      return [
        new GeneratorError((b) => b
          ..message = 'Import generated part: $partStatement'
          ..offset = directives.last.offset + directives.last.length
          ..length = 0
          ..fix = '\n\n$partStatement\n\n')
      ];
    }
  }

  Iterable<GeneratorError> _checkSettings() {
    // Not allowed to have comparable builders with nested builders; this
    // would break comparing because the nested builders may not be comparable.
    // (Collection builders, in particularly, are definitely not comparable).
    if (settings.comparableBuilders && settings.nestedBuilders) {
      return [
        new GeneratorError((b) => b
          ..message = 'Set `nestedBuilders: false`'
              ' in order to use `comparableBuilders: true`.')
      ];
    } else {
      return [];
    }
  }

  Iterable<GeneratorError> _checkValueClass() {
    final result = <GeneratorError>[];

    if (!valueClassIsAbstract) {
      result.add(new GeneratorError((b) => b
        ..message = 'Make class abstract.'
        ..offset = classDeclaration.offset
        ..length = 0
        ..fix = 'abstract '));
    }

    if (hasBuiltValueImportWithShow) {
      result.add(new GeneratorError((b) => b
        ..message = 'Stop using "show" when importing '
            '"package:built_value/built_value.dart". It prevents the '
            'generated code from finding helper methods.'));
    }

    if (hasBuiltValueImportWithAs) {
      result.add(new GeneratorError((b) => b
        ..message = 'Stop using "as" when importing '
            '"package:built_value/built_value.dart". It prevents the generated '
            'code from finding helper methods.'));
    }

    final implementsClause = classDeclaration.implementsClause;
    final expectedInterface =
        'Built<$name$_generics, ${name}Builder$_generics>';

    final implementsClauseIsCorrect = implementsClause != null &&
        implementsClause.interfaces
            .any((type) => type.toSource() == expectedInterface);

    // Built parameters need fixing if they are not as expected, unless 1) the
    // class is marked `@BuiltValue(instantiable: false)` and 2) there is no
    // case of the `Built` interface being implemented. This is to allow
    // omitting the `Built` interface to work around having to implement the
    // same interface twice with different type parameters.
    final implementsClauseIsAllowedToBeIncorrect = !settings.instantiable &&
        (implementsClause == null ||
            !implementsClause.interfaces.any((type) =>
                type.toSource() == 'Built' ||
                type.toSource().startsWith('Built<')));

    if (!implementsClauseIsCorrect && !implementsClauseIsAllowedToBeIncorrect) {
      if (implementsClause == null) {
        result.add(new GeneratorError((b) => b
          ..message = 'Make class implement $expectedInterface.'
          ..offset = classDeclaration.leftBracket.offset - 1
          ..length = 0
          ..fix = 'implements $expectedInterface'));
      } else {
        var found = false;
        final interfaces = implementsClause.interfaces.map((type) {
          if (type.name.name == 'Built') {
            found = true;
            return expectedInterface;
          } else {
            return type.toSource();
          }
        }).toList();
        if (!found) interfaces.add(expectedInterface);

        result.add(new GeneratorError((b) => b
          ..message = 'Make class implement $expectedInterface.'
          ..offset = implementsClause.offset
          ..length = implementsClause.length
          ..fix = 'implements ${interfaces.join(", ")}'));
      }
    }

    if (!extendsIsAllowed) {
      result.add(new GeneratorError((b) => b
        ..message = 'Stop class extending other classes. '
            'Only "implements" and "extends Object with" are allowed.'));
    }

    if (settings.instantiable) {
      final expectedConstructor = '$name._()';
      if (valueClassConstructors.isEmpty) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Make class have exactly one constructor: $expectedConstructor;'
          ..offset = classDeclaration.rightBracket.offset
          ..length = 0
          ..fix = '  $expectedConstructor;\n'));
      } else if (valueClassConstructors.length > 1) {
        var found = false;
        for (final constructor in valueClassConstructors) {
          if (constructor.toSource().startsWith(expectedConstructor)) {
            found = true;
          } else {
            result.add(new GeneratorError((b) => b
              ..message = 'Remove invalid constructor.'
              ..offset = constructor.offset
              ..length = constructor.length
              ..fix = ''));
          }
        }
        if (!found) {
          result.add(new GeneratorError((b) => b
            ..message =
                'Make class have exactly one constructor: $expectedConstructor;'
            ..offset = classDeclaration.rightBracket.offset
            ..length = 0
            ..fix = '  $expectedConstructor;\n'));
        }
      } else if (!(valueClassConstructors.single
          .toSource()
          .startsWith(expectedConstructor))) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Make class have exactly one constructor: $expectedConstructor;'
          ..offset = valueClassConstructors.single.offset
          ..length = valueClassConstructors.single.length
          ..fix = expectedConstructor + ';'));
      }
    } else {
      if (valueClassConstructors.isNotEmpty) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Remove all constructors or remove "instantiable: false".'));
      }
    }

    if (settings.instantiable) {
      if (!valueClassFactories.any(
          (factory) => factory.toSource().contains('$implName$_generics'))) {
        final exampleFactory =
            'factory $name([updates(${name}Builder$_generics b)]) = '
            '$implName$_generics;';
        result.add(new GeneratorError((b) => b
          ..message =
              'Add a factory so your class can be instantiated. Example:\n\n'
              '$exampleFactory'
          ..offset = classDeclaration.rightBracket.offset
          ..length = 0
          ..fix = '  $exampleFactory\n'));
      }
    } else {
      if (valueClassFactories.isNotEmpty) {
        result.add(new GeneratorError((b) => b
          ..message = 'Remove all factories or remove "instantiable: false".'));
      }
    }

    if (implementsHashCode) {
      result.add(new GeneratorError((b) => b
        ..message =
            'Stop implementing hashCode; it will be generated for you.'));
    }

    if (implementsOperatorEquals) {
      result.add(new GeneratorError((b) => b
        ..message =
            'Stop implementing operator==; it will be generated for you.'));
    }

    return result;
  }

  Iterable<GeneratorError> _checkBuilderClass() {
    final result = <GeneratorError>[];
    if (!hasBuilder) return result;

    if (!builderClassIsAbstract) {
      result.add(new GeneratorError(
          (b) => b..message = 'Make builder class abstract.'));
    }

    if (settings.instantiable) {
      final expectedBuilderParameters =
          '$name$_generics, ${name}Builder$_generics';
      if (builderParameters != expectedBuilderParameters) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Make builder class implement Builder<$expectedBuilderParameters>. '
              'Currently: Builder<$builderParameters>'));
      }
    }

    if (settings.instantiable) {
      final expectedConstructor = '${name}Builder._()';
      if (builderClassConstructors.length != 1 ||
          !(builderClassConstructors.single.startsWith(expectedConstructor))) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Make builder class have exactly one constructor: $expectedConstructor;'));
      }
    } else {
      if (builderClassConstructors.isNotEmpty) {
        result.add(new GeneratorError((b) => b
          ..message = 'Remove all builder constructors '
              'or remove "instantiable: false".'));
      }
    }

    if (settings.instantiable) {
      final expectedFactory =
          'factory ${name}Builder() = _\$${name}Builder$_generics;';
      if (builderClassFactories.length != 1 ||
          builderClassFactories.single != expectedFactory) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Make builder class have exactly one factory: $expectedFactory'));
      }
    } else {
      if (builderClassFactories.isNotEmpty) {
        result.add(new GeneratorError((b) => b
          ..message =
              'Remove all builder factories or remove "instantiable: false".'));
      }
    }

    return result;
  }

  Iterable<GeneratorError> _checkFieldList() {
    if (!hasBuilder || !settings.instantiable) return <GeneratorError>[];
    return fields.any((field) => !field.builderFieldExists)
        ? [
            new GeneratorError((b) => b
              ..message = 'Make builder have exactly these fields: ' +
                  fields.map((field) => field.name).join(', '))
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
    final errors = computeErrors();
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
    result.writeln('class $implName$_boundedGenerics '
        'extends $name$_generics {');
    for (final field in fields) {
      final type = field.typeInCompilationUnit(compilationUnit);
      result.writeln('@override');
      result.writeln('final $type ${field.name};');
    }
    for (final memoizedGetter in memoizedGetters) {
      result.writeln('${memoizedGetter.returnType} __${memoizedGetter.name};');
    }
    result.writeln();

    // If there is a manually maintained builder we have to cast the "build()"
    // result to the generated value class. If the builder is generated, that
    // can return the right type directly and needs no cast.
    final cast = hasBuilder ? 'as _\$$name$_generics' : '';
    result.writeln('factory $implName(['
        'void updates(${name}Builder$_generics b)]) '
        '=> (new ${name}Builder$_generics()..update(updates)).build() $cast;');
    result.writeln();

    if (fields.isEmpty) {
      result.write('$implName._() : super._()');
    } else {
      result.write('$implName._({');
      result.write(fields.map((field) => 'this.${field.name}').join(', '));
      result.write('}) : super._()');
    }
    final requiredFields = fields.where((field) => !field.isNullable);
    if (requiredFields.isEmpty && genericParameters.isEmpty) {
      result.writeln(';');
    } else {
      result.writeln('{');
      for (final field in requiredFields) {
        result.writeln('if (${field.name} == null) {');
        result.writeln(
            "throw new BuiltValueNullFieldError('$name', '${field.name}');");
        result.writeln('}');
      }
      // If there are generic parameters, check they are not "dynamic".
      if (genericParameters.isNotEmpty) {
        for (final genericParameter in genericParameters) {
          result.writeln('if ($genericParameter == dynamic) {');
          result.writeln('throw new BuiltValueMissingGenericsError('
              "'$name', '$genericParameter');");
          result.writeln('}');
        }
      }
      result.writeln();
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
      result.writeln('${implName}Builder$_generics toBuilder() '
          '=> new ${implName}Builder$_generics()..replace(this);');
    } else {
      result.writeln('${name}Builder$_generics toBuilder() '
          '=> new ${name}Builder$_generics()..replace(this);');
    }
    result.writeln();

    result.write(_generateEqualsAndHashcode());

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
      result.writeln('class ${implName}Builder$_boundedGenerics '
          'extends ${name}Builder$_generics {');
    } else {
      result.writeln('class ${name}Builder$_boundedGenerics '
          'implements ${builderImplements.join(", ")} {');
    }

    // Builder holds a reference to a value, copies from it lazily.
    result.writeln('$implName$_generics _\$v;');
    result.writeln('');

    if (hasBuilder) {
      for (final field in fields) {
        final type = field.typeInCompilationUnit(compilationUnit);
        final typeInBuilder = field.typeInBuilder(compilationUnit);
        final name = field.name;

        if (field.isNestedBuilder) {
          result.writeln('@override');
          result.writeln('$typeInBuilder get $name {'
              '_\$this;');
          if (settings.autoCreateNestedBuilders) {
            result.writeln('return super.$name ??= new $typeInBuilder();');
          } else {
            result.writeln('return super.$name;');
          }
          result.writeln('}');
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
        final type = field.typeInCompilationUnit(compilationUnit);
        final typeInBuilder = field.typeInBuilder(compilationUnit);
        final name = field.name;

        if (field.isNestedBuilder) {
          result.writeln('$typeInBuilder _$name;');
          result.writeln('$typeInBuilder get $name =>');
          if (settings.autoCreateNestedBuilders) {
            result.writeln('_\$this._$name ??= new $typeInBuilder();');
          } else {
            result.writeln('_\$this._$name;');
          }
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
      result.writeln('${implName}Builder() : super._();');
    } else {
      result.writeln('${name}Builder();');
    }
    result.writeln('');

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

      if (builderImplements.length > 2) {
        // Add this `ignore` as a workaround for analyzer issue:
        // https://github.com/dart-lang/sdk/issues/32025
        result.writeln('// ignore: override_on_non_overriding_method');
      }
      result.writeln('void replace(covariant $name$_generics other) {');
    } else {
      result.writeln('void replace($name$_generics other) {');
    }

    result.writeln('if (other == null) {');
    result.writeln("throw new ArgumentError.notNull('other');");
    result.writeln('}');
    result.writeln('_\$v = other as $implName$_generics;');
    result.writeln('}');

    result.writeln('@override');
    result.writeln('void update(void updates(${name}Builder$_generics b)) {'
        ' if (updates != null) updates(this); }');
    result.writeln();

    result.writeln('@override');
    result.writeln('$implName$_generics build() {');

    // Construct a map from field to how it's built. If it's a normal field,
    // this is just the field name; if it's a nested builder, this is an
    // invocation of the nested builder taking into account nullability.
    final fieldBuilders = <String, String>{};
    fields.forEach((field) {
      final name = field.name;
      if (!field.isNestedBuilder) {
        fieldBuilders[name] = name;
      } else if (!field.isNullable) {
        // If not nullable, go via the public accessor, which instantiates
        // if needed.
        fieldBuilders[name] = '$name.build()';
      } else if (hasBuilder) {
        // Otherwise access the private field: in super if there's a manually
        // maintained builder.
        fieldBuilders[name] = 'super.$name?.build()';
      } else {
        // Or, directly if there is no manually maintained builder.
        fieldBuilders[name] = '_$name?.build()';
      }
    });

    // If there are nested builders then wrap the build in a try/catch so we
    // can add information should a nested builder fail.
    final needsTryCatchOnBuild =
        fieldBuilders.keys.any((field) => fieldBuilders[field] != field);

    if (needsTryCatchOnBuild) {
      result.writeln('$implName$_generics _\$result;');
      result.writeln('try {');
    } else {
      result.write('final ');
    }
    result.writeln('_\$result = _\$v ?? ');
    result.writeln('new $implName$_generics._(');
    result.write(fieldBuilders.keys
        .map((field) => '$field: ${fieldBuilders[field]}')
        .join(','));
    result.writeln(');');

    if (needsTryCatchOnBuild) {
      // Handle errors by re-running all nested builders; if there's an error
      // in a nested builder then throw with more information. Otherwise,
      // just rethrow.
      result.writeln('} catch (_) {');
      result.writeln('String _\$failedField;');
      result.writeln('try {');
      result.write(fieldBuilders.keys.map((field) {
        final fieldBuilder = fieldBuilders[field];
        if (fieldBuilder == field) return '';
        return "_\$failedField = '$field'; $fieldBuilder;";
      }).join('\n'));

      result.writeln('} catch (e) {');
      result.writeln('throw new BuiltValueNestedFieldError('
          "'$name', _\$failedField, e.toString());");
      result.writeln('}');
      result.writeln('rethrow;');
      result.writeln('}');
    }

    // Set _$v to the built value, so it will be lazily copied if needed.
    result.writeln('replace(_\$result);');
    result.writeln('return _\$result;');
    result.writeln('}');

    if (settings.comparableBuilders) {
      result.write(_generateEqualsAndHashcode(forBuilder: true));
    }

    result.writeln('}');

    return result.toString();
  }

  String _generateEqualsAndHashcode({bool forBuilder = false}) {
    final result = StringBuffer();

    final comparedFields =
        fields.where((field) => field.builtValueField.compare).toList();
    final comparedFunctionFields =
        comparedFields.where((field) => field.isFunctionType).toList();
    result.writeln('@override');
    result.writeln('bool operator==(Object other) {');
    result.writeln('  if (identical(other, this)) return true;');

    if (comparedFunctionFields.isNotEmpty) {
      result.writeln('  final _\$dynamicOther = other as dynamic;');
    }
    result.writeln('  return other is $name${forBuilder ? 'Builder' : ''}');
    if (comparedFields.isNotEmpty) {
      result.writeln('&&');
      result.writeln(comparedFields
          .map((field) => field.isFunctionType
              ? '${field.name} == _\$dynamicOther.${field.name}'
              : '${field.name} == other.${field.name}')
          .join('&&'));
    }
    result.writeln(';');
    result.writeln('}');
    result.writeln();

    result.writeln('@override');
    result.writeln('int get hashCode {');

    if (comparedFields.length == 0) {
      result.writeln('return ${name.hashCode};');
    } else {
      result.writeln(r'return $jf(');
      result.writeln(r'$jc(' * comparedFields.length);
      // Use a different seed for builders than for values, so they do not have
      // identical hashCodes if the values are identical.
      result.writeln(forBuilder ? '1, ' : '0, ');
      result.write(
          comparedFields.map((field) => '${field.name}.hashCode').join('), '));
      result.writeln('));');
    }
    result.writeln('}');
    result.writeln();

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
      final typeInBuilder = field.typeInBuilder(compilationUnit);
      final name = field.name;

      result.writeln('$typeInBuilder get $name;');
      result.writeln('set $name($typeInBuilder $name);');
      result.writeln();
    }

    result.writeln('}');
    return result.toString();
  }
}

InvalidGenerationSourceError _makeError(Iterable<GeneratorError> todos) {
  final message = new StringBuffer(
      'Please make the following changes to use BuiltValue:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i).message}');
  }

  return new InvalidGenerationSourceError(message.toString());
}
