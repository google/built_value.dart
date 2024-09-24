// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.enum_source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/dart_types.dart';
import 'package:built_value_generator/src/enum_source_field.dart';
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:built_value_generator/src/strings.dart';
import 'package:collection/collection.dart' show IterableExtension;

import 'library_elements.dart';

part 'enum_source_class.g.dart';

abstract class EnumSourceClass
    implements Built<EnumSourceClass, EnumSourceClassBuilder> {
  ParsedLibraryResults get parsedLibraryResults;

  InterfaceElement get element;

  factory EnumSourceClass(ParsedLibraryResults parsedLibraryResults,
          InterfaceElement element) =>
      _$EnumSourceClass._(
          parsedLibraryResults: parsedLibraryResults, element: element);
  EnumSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      parsedLibraryResults.parsedLibraryResultOrThrowingMock(element.library);

  @memoized
  String get name => element.name;

  /// Returns `mixin` if class modifiers are available, `abstract class`
  /// otherwise.
  ///
  /// The two are equivalent as class modifiers change the meaning of `class`.
  String get _mixin => LibraryElements.areClassMixinsEnabled(element.library)
      ? 'mixin'
      : 'abstract class';

  @memoized
  String get wireName => settings.wireName ?? name;

  @memoized
  BuiltValueEnum get settings {
    var annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where(
            (value) => DartTypes.tryGetName(value?.type) == 'BuiltValueEnum');
    if (annotations.isEmpty) return const BuiltValueEnum();
    var annotation = annotations.single!;
    return BuiltValueEnum(
        wireName: annotation.getField('wireName')?.toStringValue());
  }

  @memoized
  bool get isAbstract {
    final element = this.element;
    return element is ClassElement && element.isAbstract;
  }

  @memoized
  BuiltList<EnumSourceField> get fields =>
      EnumSourceField.fromClassElement(parsedLibrary, element);

  @memoized
  BuiltList<String> get constructors =>
      BuiltList<String>(element.constructors.map((element) {
        final declaration = parsedLibrary.getElementDeclaration(element);
        return declaration?.node.toSource() ?? '';
      }));

  @memoized
  String? get valuesIdentifier {
    var getter = element.getGetter('values');
    if (getter == null) return null;
    var source = parsedLibrary.getElementDeclaration(getter)!.node.toSource();
    var matches = RegExp(r'static BuiltSet<' +
            RegExp.escape(element.displayName) +
            r'> get values => (_\$[\w$]+)\;')
        .allMatches(source);
    return matches.isEmpty ? null : matches.first.group(1);
  }

  @memoized
  String? get valueOfIdentifier {
    var getter = element.getMethod('valueOf');
    if (getter == null) return null;
    var source = parsedLibrary.getElementDeclaration(getter)!.node.toSource();
    var matches = RegExp(r'static ' +
            RegExp.escape(element.displayName) +
            r' valueOf\((?:final )?String name\) \=\> (\_\$[\w$]+)\(name\)\;')
        .allMatches(source);
    return matches.isEmpty ? null : matches.first.group(1);
  }

  @memoized
  bool get usesMixin =>
      element.library.getClass(name + 'Mixin') != null ||
      element.library.definingCompilationUnit.typeAliases
          .any((a) => a.name == name + 'Mixin');

  @memoized
  Iterable<String> get identifiers {
    return [
      valuesIdentifier,
      valueOfIdentifier,
      for (var field in fields) field.generatedIdentifier,
    ].nonNulls.toList();
  }

  static bool needsEnumClass(ClassElement classElement) {
    // `Object` and mixins return `null` for `supertype`.
    return DartTypes.tryGetName(classElement.supertype) == 'EnumClass';
  }

  Iterable<String> computeErrors() {
    return [
      ..._checkAbstract(),
      ..._checkFields(),
      ..._checkFallbackFields(),
      ..._checkConstructor(),
      ..._checkValuesGetter(),
      ..._checkValueOf(),
    ];
  }

  Iterable<String> _checkAbstract() {
    return isAbstract ? ['Make $name concrete; remove "abstract".'] : [];
  }

  Iterable<String> _checkFields() {
    return fields.expand((field) => field.errors);
  }

  Iterable<String> _checkFallbackFields() {
    var result = <String>[];

    var fallbackFields =
        fields.where((field) => field.settings.fallback).toList();
    if (fallbackFields.length > 1) {
      result.add('Remove `fallback = true` '
          'so that at most one constant is the fallback. '
          'Currently on "$name" fields '
          '${fallbackFields.map((field) => '"${field.name}"').join(', ')}.');
    }
    return result;
  }

  Iterable<String> _checkConstructor() {
    var expectedCode = RegExp(
        'const ${RegExp.escape(name)}._\\((?:final )?String name\\) : super\\(name\\);');
    var expectedCode217 =
        RegExp('const ${RegExp.escape(name)}._\\(super.name\\);');
    return constructors.length == 1 &&
            (constructors.single.contains(expectedCode) ||
                constructors.single.contains(expectedCode217))
        ? <String>[]
        : <String>[
            'Have exactly one constructor: '
                'const $name._(String name) : super(name); or in Dart>=2.17: const $name._(super.name);'
          ];
  }

  Iterable<String> _checkValuesGetter() {
    var result = <String>[];
    if (valuesIdentifier == null) {
      result.add('Add getter: static BuiltSet<$name> get values => _\$values');
    }
    return result;
  }

  Iterable<String> _checkValueOf() {
    var result = <String>[];
    if (valueOfIdentifier == null) {
      result.add('Add method: '
          'static $name valueOf(String name) => _\$valueOf(name)');
    }
    return result;
  }

  String generateCode() {
    var result = StringBuffer();

    for (var field in fields) {
      result.writeln('const $name ${field.generatedIdentifier} = '
          'const $name._(\'${escapeString(field.name)}\');');
    }

    result.writeln('');

    result.writeln('$name $valueOfIdentifier(String name) {'
        'switch (name) {');
    for (var field in fields) {
      result.writeln("case '${escapeString(field.name)}':"
          ' return ${field.generatedIdentifier};');
    }

    var fallback = fields.firstWhereOrNull((field) => field.settings.fallback);
    if (fallback == null) {
      result.writeln('default: throw new ArgumentError(name);');
    } else {
      result.writeln('default: return ${fallback.generatedIdentifier};');
    }
    result.writeln('}}');

    result.writeln('');

    result.writeln('final BuiltSet<$name> $valuesIdentifier ='
        'new BuiltSet<$name>(const <$name>[');
    for (var field in fields) {
      result.writeln('${field.generatedIdentifier},');
    }
    result.writeln(']);');

    if (usesMixin) {
      result.write(_generateMixin());
    }

    return result.toString();
  }

  String _generateMixin() {
    var result = StringBuffer();

    result
      ..writeln('class _\$${name}Meta {')
      ..writeln('const _\$${name}Meta();');
    for (var field in fields) {
      result
          .writeln('$name get ${field.name} => ${field.generatedIdentifier};');
    }
    result
      ..writeln('$name valueOf(String name) => $valueOfIdentifier(name);')
      ..writeln('BuiltSet<$name> get values => $valuesIdentifier;')
      ..writeln('}')
      ..writeln('$_mixin _\$${name}Mixin {')
      ..writeln('  // ignore: non_constant_identifier_names')
      ..writeln('_\$${name}Meta get $name => const _\$${name}Meta();')
      ..writeln('}');

    return result.toString();
  }
}
