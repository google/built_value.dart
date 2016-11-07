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
    result ??= _extractParameters('extends Built<', extendsClause.toString());
  }

  @override
  void visitImplementsClause(ImplementsClause implementsClause) {
    result ??= _extractParameters('implements Built<', implementsClause.toString());
  }

  /// If [[code]] starts with [[prefix]] then strips it off, strips off the
  /// last character, and returns it.
  ///
  /// Otherwise returns null.
  String _extractParameters(String prefix, String code) {
    if (code.startsWith(prefix)) {
      return code.substring(prefix.length, code.length - 1);
    } else {
      return null;
    }
  }
}
