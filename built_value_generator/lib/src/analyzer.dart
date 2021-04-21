// Copyright (c) 2021, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';

ParsedLibraryResult parsedLibraryResultOrThrowingMock(LibraryElement element) {
  var result = element.session.getParsedLibraryByElement2(element);
  if (result is ParsedLibraryResult) {
    return result;
  }
  return _ParsedLibraryResultMock();
}

class _ParsedLibraryResultMock implements ParsedLibraryResult {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
