// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

/// Extracts the type parameters used for the `Built` interface.
class BuiltParametersVisitor extends RecursiveAstVisitor {
  String result;

  @override
  void visitExtendsClause(ExtendsClause extendsClause) {
    final possibleResult = extendsClause.toString();
    if (possibleResult.startsWith('extends Built<')) {
      result = possibleResult.substring('extends Built<'.length);
      result = result.substring(0, result.length - 1);
    }
  }

  @override
  void visitImplementsClause(ImplementsClause implementsClause) {
    final possibleResult = implementsClause.toString();
    if (possibleResult.startsWith('implements Built<')) {
      result = possibleResult.substring('implements Built<'.length);
      result = result.substring(0, result.length - 1);
    }
  }
}
