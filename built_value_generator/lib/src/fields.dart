// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:collection';
import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';

/// Gets fields, including from interfaces.
///
/// If a field is overriden then just the closest (overriding) field is
/// returned.
BuiltList<FieldElement> collectFields(ClassElement element) {
  final fields = <FieldElement>[];
  element.interfaces
      .forEach((interface) => fields.addAll(collectFields(interface.element)));
  fields.addAll(element.fields);

// Overridden fields have multiple declarations, so deduplicate by adding
// to a set that compares on field name.
  final fieldSet = new LinkedHashSet<FieldElement>(
      equals: (a, b) => a.displayName == b.displayName,
      hashCode: (a) => a.displayName.hashCode);
  fieldSet.addAll(fields);
  return new BuiltList<FieldElement>(fieldSet);
}
