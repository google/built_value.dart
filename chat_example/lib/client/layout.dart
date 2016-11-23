// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:html';

/// Forces focus to the input box.
class Layout {
  Layout() {
    final screen = querySelector('#screen');
    final text = querySelector('#text');
    final input = querySelector('#input');

    input.focus();

    for (final element in [screen, text]) {
      element.onClick.listen((e) {
        input.focus();
      });
    }
  }
}
