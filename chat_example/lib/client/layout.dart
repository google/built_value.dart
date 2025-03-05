// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:web/web.dart';

/// Forces focus to the input box.
class Layout {
  Layout() {
    final screen = document.querySelector('#screen')!;
    final text = document.querySelector('#text')!;
    final input = document.querySelector('#input')! as HTMLInputElement;

    input.focus();

    for (final element in [screen, text]) {
      element.onClick.listen((e) {
        input.focus();
      });
    }
  }
}
