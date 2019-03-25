// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.enum_source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/analysis/results.dart'; // ignore: implementation_imports
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/enum_source_field.dart';
import 'package:built_value_generator/src/strings.dart';
import 'package:quiver/iterables.dart';

part 'enum_source_class.g.dart';

abstract class EnumSourceClass
    implements Built<EnumSourceClass, EnumSourceClassBuilder> {
  ClassElement get element;

  factory EnumSourceClass(
          ParsedLibraryResult parsedLibrary, ClassElement element) =>
      new _$EnumSourceClass._(element: element);
  EnumSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      // ignore: deprecated_member_use
      ParsedLibraryResultImpl.tmp(element.library);

  @memoized
  String get name => element.name;

  @memoized
  String get wireName => settings.wireName ?? name;

  @memoized
  BuiltValueEnum get settings {
    final annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => value?.type?.displayName == 'BuiltValueEnum');
    if (annotations.isEmpty) return const BuiltValueEnum();
    final annotation = annotations.single;
    return new BuiltValueEnum(
        wireName: annotation.getField('wireName').toStringValue());
  }

  @memoized
  bool get isAbstract => element.isAbstract;

  @memoized
  BuiltList<EnumSourceField> get fields =>
      EnumSourceField.fromClassElement(parsedLibrary, element);

  @memoized
  BuiltList<String> get constructors =>
      new BuiltList<String>(element.constructors.map((element) {
        final declaration = parsedLibrary.getElementDeclaration(element);
        return declaration?.node?.toSource() ?? '';
      }));

  @memoized
  String get valuesIdentifier {
    final getter = element.getGetter('values');
    if (getter == null) return null;
    final source = parsedLibrary.getElementDeclaration(getter).node.toSource();
    final matches = new RegExp(r'static BuiltSet<' +
            element.displayName +
            r'> get values => (_\$\w+)\;')
        .allMatches(source);
    return matches.isEmpty ? null : matches.first.group(1);
  }

  @memoized
  String get valueOfIdentifier {
    final getter = element.getMethod('valueOf');
    if (getter == null) return null;
    final source = parsedLibrary.getElementDeclaration(getter).node.toSource();
    final matches = new RegExp(r'static ' +
            element.displayName +
            r' valueOf\(String name\) \=\> (\_\$\w+)\(name\)\;')
        .allMatches(source);
    return matches.isEmpty ? null : matches.first.group(1);
  }

  @memoized
  bool get usesMixin => element.library.getType(name + 'Mixin') != null;

  @memoized
  String get mixinDeclaration {
    final mixinElement = element.library.getType(name + 'Mixin');
    if (mixinElement == null) return null;
    return parsedLibrary.getElementDeclaration(mixinElement).node.toSource();
  }

  @memoized
  Iterable<String> get identifiers {
    return concat([
      [valuesIdentifier, valueOfIdentifier],
      fields.map((field) => field.generatedIdentifier)
    ]);
  }

  static bool needsEnumClass(ClassElement classElement) {
    // `Object` and mixins return `null` for `supertype`.
    return classElement.supertype?.displayName == 'EnumClass';
  }

  Iterable<String> computeErrors() {
    return concat([
      _checkAbstract(),
      _checkFields(),
      _checkConstructor(),
      _checkValuesGetter(),
      _checkValueOf(),
      _checkMixin()
    ]).toList();
  }

  Iterable<String> _checkAbstract() {
    return isAbstract ? ['Make $name concrete; remove "abstract".'] : [];
  }

  Iterable<String> _checkFields() {
    return concat(fields.map((field) => field.errors));
  }

  Iterable<String> _checkConstructor() {
    final expectedCode = 'const $name._(String name) : super(name);';
    return constructors.length == 1 && constructors.single == expectedCode
        ? <String>[]
        : <String>['Have exactly one constructor: $expectedCode'];
  }

  Iterable<String> _checkValuesGetter() {
    final result = <String>[];
    if (valuesIdentifier == null) {
      result.add('Add getter: static BuiltSet<$name> get values => _\$values');
    }
    return result;
  }

  Iterable<String> _checkValueOf() {
    final result = <String>[];
    if (valueOfIdentifier == null) {
      result.add('Add method: '
          'static $name valueOf(String name) => _\$valueOf(name)');
    }
    return result;
  }

  Iterable<String> _checkMixin() {
    if (usesMixin) {
      final expectedCode =
          'abstract class ${name}Mixin = Object with _\$${name}Mixin;';
      if (!mixinDeclaration.contains(expectedCode)) {
        return ['Remove mixin or declare using exactly: $expectedCode'];
      }
    }
    return [];
  }

  String generateCode() {
    final result = new StringBuffer();

    for (final field in fields) {
      result.writeln('const $name ${field.generatedIdentifier} = '
          'const $name._(\'${escapeString(field.name)}\');');
    }

    result.writeln('');

    result.writeln('$name $valueOfIdentifier(String name) {'
        'switch (name) {');
    for (final field in fields) {
      result.writeln("case '${escapeString(field.name)}':"
          ' return ${field.generatedIdentifier};');
    }
    result.writeln('default: throw new ArgumentError(name);');
    result.writeln('}}');

    result.writeln('');

    result.writeln('final BuiltSet<$name> $valuesIdentifier ='
        'new BuiltSet<$name>(const <$name>[');
    for (final field in fields) {
      result.writeln('${field.generatedIdentifier},');
    }
    result.writeln(']);');

    if (usesMixin) {
      result.write(_generateMixin());
    }

    return result.toString();
  }

  String _generateMixin() {
    final result = new StringBuffer();

    result
      ..writeln('class _\$${name}Meta {')
      ..writeln('const _\$${name}Meta();');
    for (final field in fields) {
      result
          .writeln('$name get ${field.name} => ${field.generatedIdentifier};');
    }
    result
      ..writeln('$name valueOf(String name) => $valueOfIdentifier(name);')
      ..writeln('BuiltSet<$name> get values => $valuesIdentifier;')
      ..writeln('}')
      ..writeln('abstract class _\$${name}Mixin {')
      ..writeln('  // ignore: non_constant_identifier_names')
      ..writeln('_\$${name}Meta get $name => const _\$${name}Meta();')
      ..writeln('}');

    return result.toString();
  }
}
