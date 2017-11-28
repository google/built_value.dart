// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';

DartObject getConstantValueFromAnnotation(ElementAnnotation annotation) {
  final value = annotation.computeConstantValue();
  if (value == null) {
    throw new InvalidGenerationSourceError(
        'Can’t process annotation “${annotation.toSource()}” in '
        '“${annotation.librarySource.uri}”. Please check for a missing import.');
  }
  return value;
}

/// Gets the `String` value of an annotation. Throws a descriptive
/// [InvalidGenerationSourceError] if the annotation can't be resolved.
String metadataToStringValue(ElementAnnotation annotation) {
  final value = getConstantValueFromAnnotation(annotation);
  return value.toStringValue();
}

/// Gets a field from an annotation. Throws a descriptive
/// [InvalidGenerationSourceError] if the annotation can't be resolved.
DartObject getMetadataField(ElementAnnotation annotation, String name) {
  final value = getConstantValueFromAnnotation(annotation);
  return value.getField(name);
}
