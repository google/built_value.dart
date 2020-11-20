// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// @dart=2.11

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value_generator/src/value_source_class.dart';

BuiltSet<String> _builtCollectionNames = BuiltSet<String>([
  'BuiltList',
  'BuiltListMultimap',
  'BuiltMap',
  'BuiltSet',
  'BuiltSetMultimap',
]);

class DartTypes {
  static bool needsNestedBuilder(DartType type) {
    return isInstantiableBuiltValue(type) || isBuiltCollection(type);
  }

  static bool isInstantiableBuiltValue(DartType type) {
    return isBuiltValue(type) &&
        ValueSourceClass(type.element as ClassElement).settings.instantiable;
  }

  static bool isBuiltValue(DartType type) {
    if (type.element is! ClassElement) return false;
    return (type.element as ClassElement)
        .allSupertypes
        .any((interfaceType) => interfaceType.element.name == 'Built');
  }

  static bool isBuiltCollection(DartType type) {
    return _builtCollectionNames
        .any((name) => getName(type).startsWith('$name<'));
  }

  static bool isBuilt(DartType type) =>
      isBuiltValue(type) || isBuiltCollection(type);

  static bool isBuiltCollectionTypeName(String name) =>
      _builtCollectionNames.contains(name);

  /// Gets the name of a `DartType`. Supports `Function` types, which will
  /// be returned using the `Function()` syntax.
  static String getName(DartType dartType,
      {bool withNullabilitySuffix = false}) {
    if (dartType == null) {
      return null;
    }

    var suffix = withNullabilitySuffix &&
            dartType.nullabilitySuffix == NullabilitySuffix.question
        ? '?'
        : '';

    if (dartType.isDynamic) {
      return 'dynamic';
    } else if (dartType is FunctionType) {
      return getName(dartType.returnType) +
          ' Function(' +
          dartType.parameters.map((p) => getName(p.type)).join(', ') +
          ')$suffix';
    } else if (dartType is InterfaceType) {
      var typeArguments = dartType.typeArguments;
      if (typeArguments.isEmpty || typeArguments.every((t) => t.isDynamic)) {
        return dartType.element.name + suffix;
      } else {
        final typeArgumentsStr = typeArguments
            .map((type) => getName(type, withNullabilitySuffix: true))
            .join(', ');
        return '${dartType.element.name}<$typeArgumentsStr>$suffix';
      }
    } else if (dartType is TypeParameterType) {
      return dartType.element.name + suffix;
    } else if (dartType.isVoid) {
      return 'void';
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
