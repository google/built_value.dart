// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:built_value_generator/src/value_source_class.dart';

BuiltSet<String> _builtCollectionNames = BuiltSet<String>([
  'BuiltList',
  'BuiltListMultimap',
  'BuiltMap',
  'BuiltSet',
  'BuiltSetMultimap',
]);

class DartTypes {
  static bool needsNestedBuilder(
      ParsedLibraryResults parsedLibraryResults, DartType type) {
    return isInstantiableBuiltValue(parsedLibraryResults, type) ||
        isBuiltCollection(type);
  }

  static bool isInstantiableBuiltValue(
      ParsedLibraryResults parsedLibraryResults, DartType type) {
    return isBuiltValue(type) &&
        ValueSourceClass(parsedLibraryResults, type.element as ClassElement)
            .settings
            .instantiable;
  }

  static bool isBuiltValue(DartType type) =>
      type is InterfaceType &&
      type.element.allSupertypes
          .any((interfaceType) => interfaceType.element.name == 'Built');

  static bool isBuiltCollection(DartType type) {
    return _builtCollectionNames
        .any((name) => getName(type).startsWith('$name<'));
  }

  static bool isBuilt(DartType type) =>
      isBuiltValue(type) || isBuiltCollection(type);

  static bool isBuiltCollectionTypeName(String name) =>
      _builtCollectionNames.contains(name);

  /// As [getName] but allows `dartType` to be `null`.
  ///
  /// If it's `null`, returns `null`.
  static String? tryGetName(DartType? dartType,
      {bool withNullabilitySuffix = false}) {
    if (dartType == null) {
      return null;
    }
    return getName(dartType, withNullabilitySuffix: withNullabilitySuffix);
  }

  /// Gets the name of a `DartType`. Supports `Function` types, which will
  /// be returned using the `Function()` syntax.
  static String getName(DartType dartType,
      {bool withNullabilitySuffix = false}) {
    var suffix = withNullabilitySuffix &&
            dartType.nullabilitySuffix == NullabilitySuffix.question
        ? '?'
        : '';

    if (dartType is InvalidType) {
      // InvalidType might indicate a type that has not yet been generated,
      // handle as if the type is unknown.
      return 'dynamic';
    } else if (dartType is DynamicType) {
      return 'dynamic';
    } else if (dartType is FunctionType) {
      final parameters = StringBuffer();

      parameters.write(
          dartType.normalParameterTypes.map((t) => getName(t)).join(', '));

      if (dartType.optionalParameterTypes.isNotEmpty) {
        if (parameters.isNotEmpty) parameters.write(', ');
        parameters.write('[');
        parameters.write(
            dartType.optionalParameterTypes.map((t) => getName(t)).join(', '));
        parameters.write(']');
      }

      if (dartType.namedParameterTypes.isNotEmpty) {
        if (parameters.isNotEmpty) parameters.write(', ');
        parameters.write('{');
        parameters.write(dartType.parameters
            .where((p) => p.isOptionalNamed || p.isRequiredNamed)
            .map((p) => '${p.isRequiredNamed ? 'required ' : ''}'
                '${getName(p.type)} ${p.name}')
            .join(', '));
        parameters.write('}');
      }

      return getName(dartType.returnType) + ' Function($parameters)$suffix';
    } else if (dartType is InterfaceType) {
      var typeArguments = dartType.typeArguments;
      if (typeArguments.isEmpty) {
        return dartType.element.name + suffix;
      } else {
        final typeArgumentsStr = typeArguments
            .map((type) => getName(type, withNullabilitySuffix: true))
            .join(', ');
        return '${dartType.element.name}<$typeArgumentsStr>$suffix';
      }
    } else if (dartType is TypeParameterType) {
      return dartType.element.name + suffix;
    } else if (dartType is RecordType) {
      return dartType.getDisplayString();
    } else if (dartType is VoidType) {
      return 'void';
    } else if (dartType.isBottom) {
      return 'Never' + suffix;
    } else {
      throw UnimplementedError('(${dartType.runtimeType}) $dartType');
    }
  }

  /// Turns a type name, optionally with generics, into just the type name.
  static String stripGenerics(String name) {
    var genericsStart = name.indexOf('<');
    return genericsStart == -1 ? name : name.substring(0, genericsStart);
  }
}
