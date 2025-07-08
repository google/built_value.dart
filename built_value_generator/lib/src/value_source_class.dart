// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/fixes.dart';
import 'package:built_value_generator/src/memoized_getter.dart';
import 'package:built_value_generator/src/metadata.dart';
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:built_value_generator/src/strings.dart';
import 'package:built_value_generator/src/value_source_field.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import 'dart_types.dart';
import 'library_elements.dart';

part 'value_source_class.g.dart';

const String _importWithSingleQuotes =
    "import 'package:built_value/built_value.dart'";
const String _importWithDoubleQuotes =
    'import "package:built_value/built_value.dart"';

abstract class ValueSourceClass
    implements Built<ValueSourceClass, ValueSourceClassBuilder> {
  ParsedLibraryResults get parsedLibraryResults;
  InterfaceElement2 get element;

  factory ValueSourceClass(
    ParsedLibraryResults parsedLibraryResults,
    InterfaceElement2 element,
  ) =>
      _$ValueSourceClass._(
        parsedLibraryResults: parsedLibraryResults,
        element: element,
      );
  ValueSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      parsedLibraryResults.parsedLibraryResultOrThrowingMock(element.library2);

  @memoized
  String get name => element.displayName;

  /// Returns `mixin class` if class modifiers are available, `class` otherwise.
  ///
  /// The two are equivalent as class modifiers change the meaning of `class`.
  String get _class => LibraryElements.areClassMixinsEnabled(element.library2)
      ? 'mixin class'
      : 'class';

  /// Returns the class name for the generated implementation. If the manually
  /// maintained class is private then we ignore the underscore here, to avoid
  /// returning a class name starting `_$_`.
  @memoized
  String get implName =>
      name.startsWith('_') ? '_\$${name.substring(1)}' : '_\$$name';

  @memoized
  ClassElement2? get builderElement {
    var result = element.library2.getClass2(name + 'Builder');
    if (result == null) return null;
    // If the builder is in a generated file, then we're analyzing _after_ code
    // generation. Ignore it. This happens when running as an analyzer plugin.
    if (result.library2.firstFragment.source.fullName.endsWith('.g.dart')) {
      return null;
    }
    return result;
  }

  @memoized
  bool get implementsBuilt => element.allSupertypes.any(
        (interfaceType) => interfaceType.element3.name3 == 'Built',
      );

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

    for (var supertype in [
      element.supertype,
      ...element.supertype!.element3.allSupertypes,
    ]) {
      if (DartTypes.tryGetName(supertype) == 'Object') continue;

      // Base class must be abstract.
      final superElement = supertype!.element3;
      if (superElement is! ClassElement2 || !superElement.isAbstract) {
        return false;
      }

      // Base class must have no fields.
      if (supertype.element3.fields2.any(
        (field) => !field.isStatic && !field.isSynthetic,
      )) {
        return false;
      }

      // Base class must have no abstract getters.
      if (supertype.getters.any(
        (accessor) => !accessor.isStatic && accessor.isAbstract,
      )) {
        return false;
      }

      // Base class must not implement operator==, hashCode or toString.
      if (supertype.element3.getMethod2('hashCode') != null) return false;
      if (supertype.element3.getMethod2('==') != null) return false;
      if (supertype.element3.getMethod2('toString') != null) return false;
    }

    return true;
  }

  @memoized
  BuiltValue get settings {
    var annotations = element.metadata2.annotations
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => DartTypes.tryGetName(value?.type) == 'BuiltValue');
    if (annotations.isEmpty) return const BuiltValue();
    var annotation = annotations.single!;
    // If a field does not exist, that means an old `built_value` version; use
    // the default.
    return BuiltValue(
      comparableBuilders:
          annotation.getField('comparableBuilders')?.toBoolValue() ?? false,
      instantiable: annotation.getField('instantiable')?.toBoolValue() ?? true,
      nestedBuilders:
          annotation.getField('nestedBuilders')?.toBoolValue() ?? true,
      autoCreateNestedBuilders:
          annotation.getField('autoCreateNestedBuilders')?.toBoolValue() ??
              true,
      generateBuilderOnSetField:
          annotation.getField('generateBuilderOnSetField')?.toBoolValue() ??
              false,
      defaultCompare:
          annotation.getField('defaultCompare')?.toBoolValue() ?? true,
      defaultSerialize:
          annotation.getField('defaultSerialize')?.toBoolValue() ?? true,
      wireName: annotation.getField('wireName')?.toStringValue(),
    );
  }

  @memoized
  BuiltList<String> get genericParameters =>
      BuiltList<String>(element.typeParameters2.map((e) => e.name3));

  @memoized
  BuiltList<String> get genericBounds => BuiltList<String>(
        element.typeParameters2.map((element) {
          var bound = element.bound;
          if (bound == null) return '';
          return DartTypes.getName(bound) +
              (element.bound!.nullabilitySuffix == NullabilitySuffix.question
                  ? '?'
                  : '');
        }),
      );

  @memoized
  ClassDeclaration get classDeclaration {
    return parsedLibrary.getFragmentDeclaration(element.firstFragment)!.node
        as ClassDeclaration;
  }

  @memoized
  bool get hasBuilder => builderElement != null;

  // The `initializer` methods are no longer recommended, see hooks below.

  @memoized
  bool get hasBuilderInitializer => builderInitializer != null;

  @memoized
  MethodElement2? get builderInitializer =>
      element.getMethod2('_initializeBuilder');

  @memoized
  bool get hasBuilderFinalizer => builderFinalizer != null;

  @memoized
  MethodElement2? get builderFinalizer =>
      element.getMethod2('_finalizeBuilder');

  @memoized
  BuiltMap<String, BuiltValueHook> get hooks {
    var result = MapBuilder<String, BuiltValueHook>();
    for (var method in element.methods2) {
      var annotations = method.metadata2.annotations
          .map((annotation) => annotation.computeConstantValue())
          .where(
            (value) => DartTypes.tryGetName(value?.type) == 'BuiltValueHook',
          );
      if (annotations.isEmpty) continue;
      var annotation = annotations.single!;
      // If a field does not exist, that means an old `built_value` version; use
      // the default.
      result[method.name3!] = BuiltValueHook(
        initializeBuilder:
            annotation.getField('initializeBuilder')?.toBoolValue() ?? false,
        finalizeBuilder:
            annotation.getField('finalizeBuilder')?.toBoolValue() ?? true,
      );
    }
    return result.build();
  }

  @memoized
  String get builderParameters {
    return builderElement!.allSupertypes
        .where((interfaceType) => interfaceType.element3.name3 == 'Builder')
        .single
        .typeArguments
        .map((type) => DartTypes.getName(type))
        .join(', ');
  }

  @memoized
  BuiltList<ValueSourceField> get fields => ValueSourceField.fromClassElements(
        parsedLibraryResults,
        settings,
        parsedLibrary,
        element,
        builderElement,
      );

  @memoized
  String get source => element.library2.firstFragment.source.contents.data;

  @memoized
  String get partStatement {
    var fileName = element.library2.firstFragment.source.shortName.replaceAll(
      '.dart',
      '',
    );
    return "part '$fileName.g.dart';";
  }

  @memoized
  bool get hasPartStatement {
    var expectedCode = partStatement;
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
  bool get valueClassIsAbstract {
    final element = this.element;
    return element is ClassElement2 && element.isAbstract;
  }

  @memoized
  BuiltList<ConstructorDeclaration> get valueClassConstructors =>
      BuiltList<ConstructorDeclaration>(
        element.constructors2
            .where(
              (constructor) =>
                  !constructor.isFactory && !constructor.isSynthetic,
            )
            .map(
              (constructor) => parsedLibrary
                  .getFragmentDeclaration(constructor.firstFragment)!
                  .node as ConstructorDeclaration,
            ),
      );

  @memoized
  BuiltList<ConstructorDeclaration> get valueClassFactories =>
      BuiltList<ConstructorDeclaration>(
        element.constructors2.where((constructor) => constructor.isFactory).map(
              (factory) => parsedLibrary
                  .getFragmentDeclaration(factory.firstFragment)!
                  .node as ConstructorDeclaration,
            ),
      );

  @memoized
  bool get builderClassIsAbstract => builderElement!.isAbstract;

  @memoized
  BuiltList<String> get builderClassConstructors => BuiltList<String>(
        builderElement!.constructors2
            .where(
              (constructor) =>
                  !constructor.isFactory && !constructor.isSynthetic,
            )
            .map(
              (constructor) => parsedLibrary
                  .getFragmentDeclaration(constructor.firstFragment)!
                  .node
                  .toSource(),
            ),
      );

  @memoized
  BuiltList<String> get builderClassFactories => BuiltList<String>(
        builderElement!.constructors2
            .where((constructor) => constructor.isFactory)
            .map(
              (factory) => parsedLibrary
                  .getFragmentDeclaration(factory.firstFragment)!
                  .node
                  .toSource(),
            ),
      );

  @memoized
  BuiltList<MemoizedGetter> get memoizedGetters =>
      BuiltList<MemoizedGetter>(MemoizedGetter.fromClassElement(element));

  /// Returns the `implements` clause for the builder.
  ///
  /// All builders implement `Builder`.
  ///
  /// Additionally, if the value class implements other value classes, the
  /// builder implements the corresponding builders.
  @memoized
  BuiltList<String> get builderImplements => BuiltList<String>.build(
        (b) => b
          ..add('Builder<$name$_generics, ${name}Builder$_generics>')
          ..addAll(
            element.interfaces
                .where((interface) => needsBuiltValue(interface.element3))
                .map(_parentBuilderInterfaceName),
          ),
      );

  /// Returns the `with` clause for the builder.
  ///
  /// If the value class mixes in other value classes, the builder mixes in
  /// the corresponding builders.
  @memoized
  BuiltList<String> get builderMixins => element.mixins
      .where((interface) => needsBuiltValue(interface.element3))
      .map(_parentBuilderInterfaceName)
      .toBuiltList();

  String _parentBuilderInterfaceName(InterfaceType interface) {
    final displayName = DartTypes.getName(interface);
    if (!displayName.contains('<')) return displayName + 'Builder';
    final index = displayName.indexOf('<');
    return displayName.substring(0, index) +
        'Builder' +
        displayName.substring(index);
  }

  bool get _implementsParentBuilder =>
      builderImplements.length + builderMixins.length > 1;

  @memoized
  bool get implementsHashCode {
    var getter = element.getGetter2('hashCode');
    return getter != null && !getter.isAbstract;
  }

  @memoized
  bool get declaresMemoizedHashCode {
    var getter = element.getGetter2('hashCode');
    return getter != null &&
        getter.isAbstract &&
        getter.metadata2.annotations.any(
          (metadata) => metadataToStringValue(metadata) == 'memoized',
        );
  }

  @memoized
  bool get implementsOperatorEquals => element.getMethod2('==') != null;

  @memoized
  bool get implementsToString {
    // Check for any `toString` implementation apart from the one defined on
    // `Object`.
    var method = element.lookUpConcreteMethod('toString', element.library2)!;
    var clazz = method.enclosingElement2;
    return clazz is! ClassElement2 || clazz.name3 != 'Object';
  }

  @memoized
  LibraryFragment get libraryFragment => element.library2.firstFragment;

  static bool needsBuiltValue(InterfaceElement2 classElement) {
    // TODO(davidmorgan): more exact type check.
    return !classElement.displayName.startsWith('_\$') &&
        (classElement.allSupertypes.any(
              (interfaceType) => interfaceType.element3.name3 == 'Built',
            ) ||
            classElement.metadata2.annotations
                .map((annotation) => annotation.computeConstantValue())
                .any(
                  (value) => DartTypes.tryGetName(value?.type) == 'BuiltValue',
                ));
  }

  Iterable<GeneratorError> computeErrors() {
    return [
      ..._checkPart(),
      ..._checkSettings(),
      ..._checkValueClass(),
      ..._checkBuilderClass(),
      ..._checkFieldList(),
      for (var field in fields) ...field.computeErrors(),
    ];
  }

  Iterable<GeneratorError> _checkPart() {
    if (hasPartStatement) return [];

    var directives = (classDeclaration.parent as CompilationUnit).directives;
    if (directives.isEmpty) {
      return [
        GeneratorError(
          (b) => b
            ..message = 'Import generated part: $partStatement'
            ..offset = 0
            ..length = 0
            ..fix = '$partStatement\n\n',
        ),
      ];
    } else {
      return [
        GeneratorError(
          (b) => b
            ..message = 'Import generated part: $partStatement'
            ..offset = directives.last.offset + directives.last.length
            ..length = 0
            ..fix = '\n\n$partStatement\n\n',
        ),
      ];
    }
  }

  Iterable<GeneratorError> _checkSettings() {
    // Not allowed to have comparable builders with nested builders; this
    // would break comparing because the nested builders may not be comparable.
    // (Collection builders, in particularly, are definitely not comparable).
    if (settings.comparableBuilders && settings.nestedBuilders) {
      return [
        GeneratorError(
          (b) => b
            ..message = 'Set `nestedBuilders: false`'
                ' in order to use `comparableBuilders: true`.',
        ),
      ];
    } else {
      return [];
    }
  }

  Iterable<GeneratorError> _checkValueClass() {
    var result = <GeneratorError>[];

    if (!valueClassIsAbstract) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Make class abstract.'
            ..offset = classDeclaration.offset
            ..length = 0
            ..fix = 'abstract ',
        ),
      );
    }

    if (hasBuiltValueImportWithShow) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Stop using "show" when importing '
                '"package:built_value/built_value.dart". It prevents the '
                'generated code from finding helper methods.',
        ),
      );
    }

    if (hasBuiltValueImportWithAs) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Stop using "as" when importing '
                '"package:built_value/built_value.dart". It prevents the generated '
                'code from finding helper methods.',
        ),
      );
    }

    var implementsClause = classDeclaration.implementsClause;
    var expectedInterface = 'Built<$name$_generics, ${name}Builder$_generics>';

    var implementsClauseIsCorrect = implementsClause != null &&
        implementsClause.interfaces.any(
          (type) => type.toSource() == expectedInterface,
        );

    // Built parameters need fixing if they are not as expected, unless 1) the
    // class is marked `@BuiltValue(instantiable: false)` and 2) there is no
    // case of the `Built` interface being implemented. This is to allow
    // omitting the `Built` interface to work around having to implement the
    // same interface twice with different type parameters.
    var implementsClauseIsAllowedToBeIncorrect = !settings.instantiable &&
        (implementsClause == null ||
            !implementsClause.interfaces.any(
              (type) =>
                  type.toSource() == 'Built' ||
                  type.toSource().startsWith('Built<'),
            ));

    if (!implementsClauseIsCorrect && !implementsClauseIsAllowedToBeIncorrect) {
      if (implementsClause == null) {
        result.add(
          GeneratorError(
            (b) => b
              ..message = 'Make class implement $expectedInterface.'
              ..offset = classDeclaration.leftBracket.offset - 1
              ..length = 0
              ..fix = 'implements $expectedInterface',
          ),
        );
      } else {
        var found = false;
        final interfaces = implementsClause.interfaces.map((type) {
          if (type.name2.lexeme == 'Built') {
            found = true;
            return expectedInterface;
          } else {
            return type.toSource();
          }
        }).toList();
        if (!found) interfaces.add(expectedInterface);

        result.add(
          GeneratorError(
            (b) => b
              ..message = 'Make class implement $expectedInterface.'
              ..offset = implementsClause.offset
              ..length = implementsClause.length
              ..fix = 'implements ${interfaces.join(", ")}',
          ),
        );
      }
    }

    if (!extendsIsAllowed) {
      result.add(
        GeneratorError(
          (b) => b
            ..message = 'Stop class extending other classes. '
                'Only "implements" and "extends Object with" are allowed.',
        ),
      );
    }

    bool isStaticBuilderHook(MethodElement2 method) {
      return method.isStatic &&
          method.returnType is VoidType &&
          method.formalParameters.length == 1 &&
          parsedLibrary
              .getFragmentDeclaration(
                method.formalParameters[0].firstFragment,
              )!
              .node is SimpleFormalParameter &&
          DartTypes.stripGenerics(
                (parsedLibrary
                        .getFragmentDeclaration(
                          method.formalParameters[0].firstFragment,
                        )!
                        .node as SimpleFormalParameter)
                    .type!
                    .toSource(),
              ) ==
              '${name}Builder';
    }

    if (settings.instantiable) {
      if (hasBuilderInitializer) {
        if (!isStaticBuilderHook(builderInitializer!)) {
          result.add(
            GeneratorError(
              (b) => b
                ..message = 'Fix _initializeBuilder signature: '
                    'static void _initializeBuilder(${name}Builder b)',
            ),
          );
        }
        if (hooks.containsKey('_initializeBuilder')) {
          result.add(
            GeneratorError(
              (b) => b
                ..message = 'Remove @BuiltValueHook from _initializeBuilder. '
                    'It is a magic method name that is always a hook. '
                    'Or, to use the annotation, please rename the method.',
            ),
          );
        }
      }
      if (hasBuilderFinalizer) {
        if (!isStaticBuilderHook(builderFinalizer!)) {
          result.add(
            GeneratorError(
              (b) => b
                ..message = 'Fix _finalizeBuilder signature: '
                    'static void _finalizeBuilder(${name}Builder b)',
            ),
          );
        }
        if (hooks.containsKey('_finalizeBuilder')) {
          result.add(
            GeneratorError(
              (b) => b
                ..message = 'Remove @BuiltValueHook from _finalizeBuilder. '
                    'It is a magic method name that is always a hook. '
                    'Or, to use the annotation, please rename the method.',
            ),
          );
        }
      }
      for (var hook in hooks.entries.where(
        (hook) => hook.value.initializeBuilder || hook.value.finalizeBuilder,
      )) {
        if (hook.key == '_initializeBuilder') continue;
        if (hook.key == '_finalizeBuilder') continue;
        var method =
            element.methods2.where((method) => method.name3 == hook.key).single;
        if (!isStaticBuilderHook(method)) {
          result.add(
            GeneratorError(
              (b) => b
                ..message =
                    'Fix ${hook.key} signature to use it with @BuiltValueHook: '
                        'static void ${hook.key}(${name}Builder b)',
            ),
          );
        }
      }

      final expectedConstructor = '$name._()';
      if (valueClassConstructors.isEmpty) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Make class have exactly one constructor: $expectedConstructor;'
              ..offset = classDeclaration.rightBracket.offset
              ..length = 0
              ..fix = '  $expectedConstructor;\n',
          ),
        );
      } else if (valueClassConstructors.length > 1) {
        var found = false;
        for (var constructor in valueClassConstructors) {
          if (constructor.toSource().contains(expectedConstructor)) {
            found = true;
          } else {
            result.add(
              GeneratorError(
                (b) => b
                  ..message = 'Remove invalid constructor.'
                  ..offset = constructor.offset
                  ..length = constructor.length
                  ..fix = '',
              ),
            );
          }
        }
        if (!found) {
          result.add(
            GeneratorError(
              (b) => b
                ..message =
                    'Make class have exactly one constructor: $expectedConstructor;'
                ..offset = classDeclaration.rightBracket.offset
                ..length = 0
                ..fix = '  $expectedConstructor;\n',
            ),
          );
        }
      } else if (!(valueClassConstructors.single.toSource().contains(
            expectedConstructor,
          ))) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Make class have exactly one constructor: $expectedConstructor'
              ..offset = valueClassConstructors.single.offset
              ..length = valueClassConstructors.single.length
              ..fix = expectedConstructor + ';',
          ),
        );
      }
    } else {
      if (valueClassConstructors.isNotEmpty) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Remove all constructors or remove "instantiable: false".',
          ),
        );
      }
    }

    if (settings.instantiable) {
      if (!valueClassFactories.any(
        (factory) => factory.toSource().contains('$implName$_generics'),
      )) {
        final exampleFactory = 'factory $name('
            '[void Function(${name}Builder$_generics)? updates]) = '
            '$implName$_generics;';
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Add a factory so your class can be instantiated. Example:\n\n'
                      '$exampleFactory'
              ..offset = classDeclaration.rightBracket.offset
              ..length = 0
              ..fix = '  $exampleFactory\n',
          ),
        );
      }
    } else {
      if (valueClassFactories.isNotEmpty) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Remove all factories or remove "instantiable: false".',
          ),
        );
      }
    }

    if (implementsHashCode) {
      result.add(
        GeneratorError(
          (b) => b
            ..message =
                'Stop implementing hashCode; it will be generated for you.',
        ),
      );
    }

    if (implementsOperatorEquals) {
      result.add(
        GeneratorError(
          (b) => b
            ..message =
                'Stop implementing operator==; it will be generated for you.',
        ),
      );
    }

    return result;
  }

  Iterable<GeneratorError> _checkBuilderClass() {
    var result = <GeneratorError>[];
    if (!hasBuilder) return result;

    if (!builderClassIsAbstract) {
      result.add(
        GeneratorError((b) => b..message = 'Make builder class abstract.'),
      );
    }

    if (settings.instantiable) {
      final expectedBuilderParameters =
          '$name$_generics, ${name}Builder$_generics';
      if (builderParameters != expectedBuilderParameters) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Make builder class implement Builder<$expectedBuilderParameters>. '
                      'Currently: Builder<$builderParameters>',
          ),
        );
      }
    }

    if (settings.instantiable) {
      final expectedConstructor = '${name}Builder._()';
      if (builderClassConstructors.length != 1 ||
          !(builderClassConstructors.single.contains(expectedConstructor))) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Make builder class have exactly one constructor: $expectedConstructor;',
          ),
        );
      }
    } else {
      if (builderClassConstructors.isNotEmpty) {
        result.add(
          GeneratorError(
            (b) => b
              ..message = 'Remove all builder constructors '
                  'or remove "instantiable: false".',
          ),
        );
      }
    }

    if (settings.instantiable) {
      final expectedFactory =
          'factory ${name}Builder() = ${implName}Builder$_generics;';
      if (builderClassFactories.length != 1 ||
          !builderClassFactories.single.contains(expectedFactory)) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Make builder class have exactly one factory: $expectedFactory',
          ),
        );
      }
    } else {
      if (builderClassFactories.isNotEmpty) {
        result.add(
          GeneratorError(
            (b) => b
              ..message =
                  'Remove all builder factories or remove "instantiable: false".',
          ),
        );
      }
    }

    return result;
  }

  Iterable<GeneratorError> _checkFieldList() {
    if (!hasBuilder || !settings.instantiable) return <GeneratorError>[];
    return fields.any((field) => !field.builderFieldExists)
        ? [
            GeneratorError(
              (b) => b
                ..message = 'Make builder have exactly these fields: ' +
                    fields.map((field) => field.name).join(', '),
            ),
          ]
        : [];
  }

  String get _generics =>
      genericParameters.isEmpty ? '' : '<' + genericParameters.join(', ') + '>';

  String get _boundedGenerics => genericParameters.isEmpty
      ? ''
      : '<' +
          IterableZip([genericParameters, genericBounds]).map((zipped) {
            final parameter = zipped[0];
            final bound = zipped[1];
            return bound.isEmpty ? parameter : '$parameter extends $bound';
          }).join(', ') +
          '>';

  String generateCode() {
    var errors = computeErrors();
    if (errors.isNotEmpty) throw _makeError(errors);

    var result = StringBuffer();
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
    var result = StringBuffer();
    result.writeln(
      'class $implName$_boundedGenerics '
      'extends $name$_generics {',
    );
    for (var field in fields) {
      final type = field.typeInLibraryFragment(libraryFragment);
      result.writeln('@override');
      result.writeln(
        'final $type${field.isNullable ? '?' : ''} ${field.name};',
      );
    }
    for (var memoizedGetter in memoizedGetters) {
      result.writeln('${memoizedGetter.returnType}? __${memoizedGetter.name};');
      if (memoizedGetter.isNullable) {
        // Nullable memoiozed getters needs a field to store whether they are
        // initialized.
        result.writeln('bool ___${memoizedGetter.name} = false;');
      }
    }
    result.writeln();

    // If there is a manually maintained builder we have to cast the "build()"
    // result to the generated value class. If the builder is generated, that
    // returns the right type directly in private `_build` so there is no need
    // to cast.
    if (hasBuilder) {
      result.writeln(
        'factory $implName(['
        'void Function(${name}Builder$_generics)? updates]) '
        '=> (${name}Builder$_generics()..update(updates)).build()'
        ' as $implName$_generics;',
      );
    } else {
      result.writeln(
        'factory $implName(['
        'void Function(${name}Builder$_generics)? updates]) '
        '=> (${name}Builder$_generics()..update(updates))._build();',
      );
    }

    result.writeln();

    if (fields.isEmpty) {
      result.write('$implName._() : super._();');
    } else {
      result.write('$implName._({');
      result.write(
        fields.map((field) {
          var maybeRequired = field.isNullable ? '' : 'required ';
          return '${maybeRequired}this.${field.name}';
        }).join(', '),
      );
      result.write('}) : super._();');
    }
    result.writeln();

    for (var memoizedGetter in memoizedGetters) {
      result.writeln('@override');
      if (memoizedGetter.isNullable) {
        result.writeln(
          '${memoizedGetter.returnType}? get ${memoizedGetter.name} {',
        );
        result.writeln('if (!___${memoizedGetter.name}) {');
        result.writeln(
          '__${memoizedGetter.name} = super.${memoizedGetter.name};',
        );
        result.writeln('___${memoizedGetter.name} = true;');
        result.writeln('}');
        result.writeln('return __${memoizedGetter.name};');
        result.writeln('}');
      } else {
        result.writeln(
          '${memoizedGetter.returnType} get ${memoizedGetter.name} =>',
        );
        result.writeln(
          '__${memoizedGetter.name} ??= super.${memoizedGetter.name};',
        );
      }
      result.writeln();
    }

    result.writeln('@override');
    result.writeln(
      '$name$_generics rebuild(void Function(${name}Builder$_generics) updates) '
      '=> (toBuilder()..update(updates)).build();',
    );
    result.writeln();

    result.writeln('@override');
    if (hasBuilder) {
      result.writeln(
        '${implName}Builder$_generics toBuilder() '
        '=> ${implName}Builder$_generics()..replace(this);',
      );
    } else {
      result.writeln(
        '${name}Builder$_generics toBuilder() '
        '=> ${name}Builder$_generics()..replace(this);',
      );
    }
    result.writeln();

    result.write(_generateEqualsAndHashcode());

    // Only generate toString() if there wasn't one already.
    if (!implementsToString) {
      result.writeln('@override');
      result.writeln('String toString() {');
      if (fields.isEmpty) {
        result.writeln(
          "return newBuiltValueToStringHelper(r'$name').toString();",
        );
      } else {
        result.writeln("return (newBuiltValueToStringHelper(r'$name')");
        result.writeln(
          fields
              .map(
                (field) =>
                    "..add('${escapeString(field.name)}',  ${field.name})",
              )
              .join(''),
        );
        result.writeln(').toString();');
      }
      result.writeln('}');
      result.writeln();
    }

    result.writeln('}');
    return result.toString();
  }

  /// Generates the builder implementation.
  String _generateBuilder() {
    var result = StringBuffer();
    if (hasBuilder) {
      result.writeln(
        'class ${implName}Builder$_boundedGenerics '
        'extends ${name}Builder$_generics {',
      );
    } else if (builderMixins.isNotEmpty) {
      result.writeln(
        'class ${name}Builder$_boundedGenerics '
        'with ${builderMixins.join(", ")} '
        'implements ${builderImplements.join(", ")} {',
      );
    } else {
      result.writeln(
        'class ${name}Builder$_boundedGenerics '
        'implements ${builderImplements.join(", ")} {',
      );
    }

    // Builder holds a reference to a value, copies from it lazily.
    result.writeln('$implName$_generics? _\$v;');
    result.writeln('');

    for (var field in fields) {
      late final String type;

      if (field.isNestedBuilder) {
        type = hasBuilder
            ? field.builderElementTypeWithPrefix
            : field.typeInBuilder(libraryFragment)!;
      } else {
        type = field.typeInLibraryFragment(libraryFragment);
      }

      final name = field.name;

      final isNullableNestedBuilder = field.isAutoCreateNestedBuilder &&
          field.isNestedBuilder &&
          (!hasBuilder || field.builderElementSetterIsNullable);
      final hasNullableSetter = !hasBuilder ||
          isNullableNestedBuilder ||
          field.builderElementSetterIsNullable;
      final getterMaybeOrNull = hasNullableSetter &&
              (!field.isNestedBuilder || !field.isAutoCreateNestedBuilder)
          ? '?'
          : '';
      final setterMaybeOrNull = hasNullableSetter ? '?' : '';
      final maybeLate = !hasNullableSetter ? 'late ' : '';

      late String trackedVariable;

      if (field.builderFieldExists && !field.builderFieldIsAbstract) {
        trackedVariable = 'super.$name';
      } else {
        result.writeln('$maybeLate$type$setterMaybeOrNull _$name;');
        trackedVariable = hasBuilder ? '_$name' : '_\$this._$name';
      }

      if (hasBuilder) result.writeln('@override');
      result.write('$type$getterMaybeOrNull get $name ');
      if (hasBuilder) {
        result.writeln('{');
        result.writeln('_\$this;');
        result.write('return');
      } else {
        result.writeln('=>');
      }
      result.write(' $trackedVariable');
      if (isNullableNestedBuilder) {
        result.write('??= $type()');
      }
      result.writeln(';');
      if (hasBuilder) result.writeln('}');

      final shouldGenerateOnSet =
          !hasBuilder && settings.generateBuilderOnSetField;
      // Add `covariant` if we're implementing one or more parent builders.
      final maybeCovariant =
          !hasBuilder && _implementsParentBuilder ? 'covariant ' : '';

      if (shouldGenerateOnSet) {
        result.writeln('void Function() onSet = () {};');
        result.writeln();
      }

      final isMultilineSetter = hasBuilder || shouldGenerateOnSet;
      if (hasBuilder) result.writeln('@override');
      result.write('set $name($maybeCovariant$type$setterMaybeOrNull $name) ');
      result.writeln(isMultilineSetter ? '{' : '=>');
      if (hasBuilder) result.writeln('_\$this;');
      result.writeln('$trackedVariable = $name;');
      if (shouldGenerateOnSet) {
        result.writeln('onSet();');
      }
      if (isMultilineSetter) result.writeln('}');

      result.writeln();
    }

    result.writeln();

    if (hasBuilder) {
      result.writeln('${implName}Builder() : super._()');
    } else {
      result.writeln('${name}Builder()');
    }
    if (hasBuilderInitializer ||
        hooks.values.any((hook) => hook.initializeBuilder)) {
      result.writeln('{');
      if (hasBuilderInitializer) {
        result.writeln('$name._initializeBuilder(this);');
      }
      for (var hook in hooks.entries) {
        if (hook.value.initializeBuilder) {
          result.writeln('$name.${hook.key}(this);');
        }
      }
      result.writeln('}');
    } else {
      result.writeln(';');
    }
    result.writeln('');

    // Getter for "this" that does lazy copying if needed.
    if (fields.isNotEmpty) {
      result.writeln('${name}Builder$_generics get _\$this {');
      result.writeln('final \$v = _\$v;');
      result.writeln('if (\$v != null) {');
      for (var field in fields) {
        final name = field.name;
        final nameInBuilder =
            field.builderFieldExists && !field.builderFieldIsAbstract
                ? 'super.$name'
                : '_$name';
        if (field.isNestedBuilder) {
          var maybeOrNull = field.isNullable ? '?' : '';
          result.writeln(
            '$nameInBuilder = '
            '\$v.$name$maybeOrNull.toBuilder();',
          );
        } else {
          result.writeln('$nameInBuilder = \$v.$name;');
        }
      }
      result.writeln('_\$v = null;');
      result.writeln('}');
      result.writeln('return this;');
      result.writeln('}');
    }

    result.writeln('@override');
    if (_implementsParentBuilder) {
      // If we're overriding `replace` from other builders, tell the analyzer
      // that this builder only accepts values of exactly the right type, by
      // marking the value `covariant`.

      if (builderImplements.length + builderMixins.length > 2) {
        // Add this `ignore` as a workaround for analyzer issue:
        // https://github.com/dart-lang/sdk/issues/32025
        result.writeln('// ignore: override_on_non_overriding_method');
      }
      result.writeln('void replace(covariant $name$_generics other) {');
    } else {
      result.writeln('void replace($name$_generics other) {');
    }

    result.writeln('_\$v = other as $implName$_generics;');
    result.writeln('}');

    result.writeln('@override');
    result.writeln(
      'void update(void Function(${name}Builder$_generics)? updates) {'
      ' if (updates != null) updates(this); }',
    );
    result.writeln();

    result.writeln('@override');
    result.writeln('$name$_generics build() => _build();');
    result.writeln();
    result.writeln('$implName$_generics _build() {');

    if (hasBuilderFinalizer) {
      result.writeln('$name._finalizeBuilder(this);');
    }
    for (var hook in hooks.entries) {
      if (hook.value.finalizeBuilder) {
        result.writeln('$name.${hook.key}(this);');
      }
    }

    // Construct a map from field to how it's built. If it's a normal field,
    // this is just the field name; if it's a nested builder, this is an
    // invocation of the nested builder taking into account nullability.
    var fieldBuilders = <String, String>{};
    var needsNullCheck = <String>{};
    var genericFields = <String, String>{};
    fields.forEach((field) {
      final name = field.name;
      if (!field.isNestedBuilder) {
        fieldBuilders[name] = name;
        if (!field.isNullable) {
          needsNullCheck.add(name);
        }
        if (field.hasNullableGenericType) {
          genericFields[name] =
              field.element.getter2!.returnType.element3!.displayName;
        }
      } else if (!field.isNullable && field.isAutoCreateNestedBuilder) {
        // If not nullable, go via the public accessor, which instantiates
        // if needed provided `autoCreateNestedBuilders` is true.
        fieldBuilders[name] = '$name.build()';
      } else if (hasBuilder && !field.builderFieldIsAbstract) {
        // Otherwise access the private field: in super if there's a manually
        // maintained builder.
        fieldBuilders[name] = 'super.$name?.build()';
        if (!field.isNullable) needsNullCheck.add(name);
      } else {
        // Or, directly if there is no manually maintained builder.
        fieldBuilders[name] = '_$name?.build()';
        if (!field.isNullable) needsNullCheck.add(name);
      }
    });

    // If there are nested builders then wrap the build in a try/catch so we
    // can add information should a nested builder fail.
    var needsTryCatchOnBuild = fieldBuilders.keys.any(
      (field) => fieldBuilders[field] != field,
    );

    if (needsTryCatchOnBuild) {
      result.writeln('$implName$_generics _\$result;');
      result.writeln('try {');
    } else {
      result.write('final ');
    }
    result.writeln('_\$result = _\$v ?? ');
    result.writeln('$implName$_generics._(');
    result.write(
      fieldBuilders.keys
          .map((field) {
            final fieldBuilder = fieldBuilders[field];
            if (needsNullCheck.contains(field)) {
              if (genericFields.containsKey(field)) {
                final genericType = genericFields[field];
                return '$field: null is $genericType ? $fieldBuilder as $genericType '
                    ': BuiltValueNullFieldError.checkNotNull($fieldBuilder'
                    ", r'$name', '${escapeString(field)}')";
              }
              return '$field: BuiltValueNullFieldError.checkNotNull($fieldBuilder, '
                  "r'$name', '${escapeString(field)}')";
            }
            return '$field: $fieldBuilder';
          })
          .map((fieldBuilder) => '$fieldBuilder,')
          .join(''),
    );
    result.writeln(');');

    if (needsTryCatchOnBuild) {
      // Handle errors by re-running all nested builders; if there's an error
      // in a nested builder then throw with more information. Otherwise,
      // just rethrow.
      result.writeln('} catch (_) {');
      result.writeln('late String _\$failedField;');
      result.writeln('try {');
      result.write(
        fieldBuilders.keys.map((field) {
          final fieldBuilder = fieldBuilders[field];
          if (fieldBuilder == field) return '';
          return "_\$failedField = '${escapeString(field)}'; $fieldBuilder;";
        }).join('\n'),
      );

      result.writeln('} catch (e) {');
      result.writeln(
        'throw BuiltValueNestedFieldError('
        "r'$name', _\$failedField, e.toString());",
      );
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
    var result = StringBuffer();

    var comparedFields = fields
        .where(
          (field) => field.builtValueField.compare ?? settings.defaultCompare,
        )
        .toList();
    var comparedFunctionFields =
        comparedFields.where((field) => field.isFunctionType).toList();
    result.writeln('@override');
    result.writeln('bool operator==(Object other) {');
    result.writeln('  if (identical(other, this)) return true;');

    if (comparedFunctionFields.isNotEmpty) {
      result.writeln('  final dynamic _\$dynamicOther = other;');
    }
    result.writeln('  return other is $name${forBuilder ? 'Builder' : ''}');
    if (comparedFields.isNotEmpty) {
      result.writeln('&&');
      result.writeln(
        comparedFields.map((field) {
          var nameOrThisDotName =
              field.name == 'other' ? 'this.other' : field.name;
          return field.isFunctionType
              ? '$nameOrThisDotName == _\$dynamicOther.${field.name}'
              : '$nameOrThisDotName == other.${field.name}';
        }).join('&&'),
      );
    }
    result.writeln(';');
    result.writeln('}');
    result.writeln();

    var generateMemoizedHashCode =
        declaresMemoizedHashCode && comparedFields.isNotEmpty;
    if (generateMemoizedHashCode) {
      result.writeln('int? __hashCode;');
    }

    result.writeln('@override');
    result.writeln('int get hashCode {');

    if (comparedFields.isEmpty) {
      result.writeln('return ${name.hashCode};');
    } else {
      if (generateMemoizedHashCode) {
        result.writeln('if (__hashCode != null) return __hashCode!;');
      }

      // Use a different seed for builders than for values, so they do not have
      // identical hashCodes if the values are identical.
      final seed = forBuilder ? 1 : 0;
      result.writeln('var _\$hash  = $seed;');

      for (var field in comparedFields) {
        result.writeln('_\$hash = \$jc(_\$hash, ${field.name}.hashCode);');
      }

      result.writeln('_\$hash = \$jf(_\$hash);');

      if (generateMemoizedHashCode) {
        result.writeln('return __hashCode ??= _\$hash;');
      } else {
        result.writeln('return _\$hash;');
      }
    }
    result.writeln('}');
    result.writeln();

    return result.toString();
  }

  /// Generates an abstract builder with just abstract setters and getters.
  String _generateAbstractBuilder() {
    var result = StringBuffer();

    // The "Built" interface has been omitted to work around dart2js issue
    // https://github.com/dart-lang/sdk/issues/14729. So, we can't implement
    // "Builder". Add the methods explicitly. We can however implement any
    // other built_value interfaces.
    var interfaces = [...builderImplements.skip(1), ...builderMixins];

    if (implementsBuilt) {
      result.writeln(
        'abstract $_class ${name}Builder$_boundedGenerics '
        'implements ${builderImplements.join(", ")} {',
      );
    } else {
      result.writeln(
        'abstract $_class ${name}Builder$_boundedGenerics '
        '${interfaces.isEmpty ? '' : 'implements ' + interfaces.join(', ')}'
        '{',
      );

      // Add `covariant` if we're implementing one or more parent builders.
      result.writeln(
        'void replace(${interfaces.isEmpty ? '' : 'covariant '}'
        '$name$_generics other);',
      );
      result.writeln(
        'void update(void Function(${name}Builder$_generics) updates);',
      );
    }

    for (var field in fields) {
      var type = field.isNestedBuilder
          ? field.typeInBuilder(libraryFragment)
          : field.typeInLibraryFragment(libraryFragment);
      final name = field.name;

      final autoCreatedNestedBuilder =
          field.isNestedBuilder && settings.autoCreateNestedBuilders;
      final maybeOrNull = autoCreatedNestedBuilder ? '' : '?';

      result.writeln('$type$maybeOrNull get $name;');
      // Add `covariant` if we're implementing one or more parent builders.
      result.writeln(
        'set $name(${interfaces.isEmpty ? '' : 'covariant '} '
        '$type? $name);',
      );

      result.writeln();
    }

    result.writeln('}');
    return result.toString();
  }
}

InvalidGenerationSourceError _makeError(Iterable<GeneratorError> todos) {
  var message = StringBuffer(
    'Please make the following changes to use BuiltValue:\n',
  );
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i).message}');
  }

  return InvalidGenerationSourceError(message.toString());
}
