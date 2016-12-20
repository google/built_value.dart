// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:chat_example/testing/fake_display.dart';
import 'package:test/test.dart';

/// A test user connected to the fake environment.
class TestUser {
  final FakeDisplay _display;
  final StreamController<String> _inputController;

  TestUser(this._display, this._inputController);

  /// Types text as this user.
  void type(String text) {
    _inputController.add(text);
  }

  /// Checks server responses to this user.
  void expectMatch(Pattern pattern) {
    expect(_display.text, anyElement(matches(pattern)));
  }

  /// Checks server responses to this user.
  void expectNoMatch(Pattern pattern) {
    expect(_display.text, isNot(anyElement(matches(pattern))));
  }

  /// Checks local text for this user.
  void expectLocalMatch(Pattern pattern) {
    expect(_display.localText, anyElement(matches(pattern)));
  }
}
