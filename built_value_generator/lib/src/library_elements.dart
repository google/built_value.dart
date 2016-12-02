// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:built_collection/built_collection.dart';

/// Tools for [LibraryElement]s.
class LibraryElements {
  static BuiltList<ClassElement> getClassElements(
      LibraryElement libraryElement) {
    final result = new _GetClassesVisitor();
    libraryElement.visitChildren(result);
    return new BuiltList<ClassElement>(result.classElements);
  }

  static BuiltList<ClassElement> getTransitiveClassElements(
      LibraryElement libraryElement) {
    final result = new ListBuilder<ClassElement>();
    for (final source in libraryElement.context.librarySources) {
      final otherLibraryElement =
          libraryElement.context.computeLibraryElement(source);
      result.addAll(getClassElements(otherLibraryElement));
    }
    return result.build();
  }
}

/// Visitor that gets all [ClassElement]s.
class _GetClassesVisitor extends SimpleElementVisitor {
  final List<ClassElement> classElements = new List<ClassElement>();

  @override
  void visitClassElement(ClassElement element) {
    classElements.add(element);
  }

  @override
  void visitCompilationUnitElement(CompilationUnitElement element) {
    element.visitChildren(this);
  }
}
