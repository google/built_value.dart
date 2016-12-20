// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:chat_example/client/display.dart';

/// Fake [Display] that stores added text.
class FakeDisplay implements Display {
  List<String> text = <String>[];
  List<String> localText = <String>[];

  @override
  void add(String text) {
    this.text.add(text);
  }

  @override
  void addLocal(String text) {
    this.localText.add(text);
  }
}
