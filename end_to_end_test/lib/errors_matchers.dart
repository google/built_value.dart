// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:test/test.dart';

Matcher isErrorContaining(String string) => _ErrorContaining(string);

class _ErrorContaining extends TypeMatcher<Error> {
  String string;

  _ErrorContaining(this.string);

  @override
  Description describe(Description description) {
    super.describe(description);
    description.add(' containing "$string"');
    return description;
  }

  @override
  bool matches(dynamic item, Map<Object, Object> matchState) =>
      item is Error && item.toString().contains(string);
}
