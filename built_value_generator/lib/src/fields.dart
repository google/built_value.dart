// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';

/// Gets fields, including from interfaces. Fields from interfaces are only
/// returned if they are not also implemented by a mixin.
///
/// If a field is overridden then just the closest (overriding) field is
/// returned.
BuiltList<FieldElement> collectFields(ClassElement element) =>
    collectFieldsForType(element.type);

/// Gets fields, including from interfaces. Fields from interfaces are only
/// returned if they are not also implemented by a mixin.
///
/// If a field is overridden then just the closest (overriding) field is
/// returned.
BuiltList<FieldElement> collectFieldsForType(InterfaceType type) {
  final fields = <FieldElement>[];
  // Add fields from this class before interfaces, so they're added to the set
  // first below. Re-added fields from interfaces are ignored.
  fields.addAll(_fieldElementsForType(type));

  new Set<InterfaceType>.from(type.interfaces)
    ..addAll(type.mixins)
    ..forEach((interface) => fields.addAll(collectFieldsForType(interface)));

  // Overridden fields have multiple declarations, so deduplicate by adding
  // to a set that compares on field name.
  final fieldSet = new LinkedHashSet<FieldElement>(
      equals: (a, b) => a.displayName == b.displayName,
      hashCode: (a) => a.displayName.hashCode);
  fieldSet.addAll(fields);

  // Filter to fields that are not implemented by a mixin.
  return new BuiltList<FieldElement>.build((b) => b
    ..addAll(fieldSet)
    ..where((field) =>
        type.lookUpInheritedGetter(field.name, thisType: false)?.isAbstract ??
        true));
}

BuiltList<FieldElement> _fieldElementsForType(InterfaceType type) {
  final result = new ListBuilder<FieldElement>();
  for (final accessor in type.accessors) {
    if (accessor.isSetter) continue;
    result.add(accessor.variable as FieldElement);
  }
  return result.build();
}
