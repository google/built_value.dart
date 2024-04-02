// Copyright (c) 2021, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';

/// Caches parsed library results across one generation.
///
/// Substitutes a "throwing mock" if no parsed library is available.
class ParsedLibraryResults {
  final Map<Uri, ParsedLibraryResult> _results = {};

  ParsedLibraryResult parsedLibraryResultOrThrowingMock(
      LibraryElement element) {
    var uri = element.source.uri;
    return _results[uri] ??= _parsedLibraryResultOrThrowingMock(element);
  }

  ParsedLibraryResult _parsedLibraryResultOrThrowingMock(
      LibraryElement element) {
    var result = element.session.getParsedLibraryByElement(element);
    if (result is ParsedLibraryResult) {
      return result;
    }
    return _ParsedLibraryResultMock();
  }
}

class _ParsedLibraryResultMock implements ParsedLibraryResult {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
