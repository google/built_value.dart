// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';

/// An input box using `dart:html`.
class Input {
  final StreamController<String> _streamController = StreamController<String>();

  Input() {
    final input = querySelector('#input') as InputElement;

    input.onKeyPress.listen((keyEvent) {
      if (keyEvent.keyCode == KeyCode.ENTER) {
        _streamController.add(input.value);
        input.value = '';
      }
    });
  }

  Stream<String> get keyboardInput => _streamController.stream;
}
