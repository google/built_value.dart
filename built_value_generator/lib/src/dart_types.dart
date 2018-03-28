// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value_generator/src/value_source_class.dart';

BuiltSet<String> _builtCollectionNames = new BuiltSet<String>([
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
        new ValueSourceClass(type.element as ClassElement)
            .settings
            .instantiable;
  }

  static bool isBuiltValue(DartType type) {
    if (type.element is! ClassElement) return false;
    return (type.element as ClassElement)
        .allSupertypes
        .any((interfaceType) => interfaceType.name == 'Built');
  }

  static bool isBuiltCollection(DartType type) {
    return _builtCollectionNames
        .any((name) => type.displayName.startsWith('$name<'));
  }

  static bool isBuiltCollectionTypeName(String name) =>
      _builtCollectionNames.contains(name);

  /// Gets the name of a `DartType`. Supports `Function` types, which will
  /// be returned using the `Function()` syntax.
  static String getName(DartType dartType) {
    if (dartType is FunctionType) {
      return getName(dartType.returnType) +
          ' Function(' +
          dartType.parameters.map((p) => getName(p.type)).join(', ') +
          ')';
    } else {
      return dartType.displayName;
    }
  }
}
