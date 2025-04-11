// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:js_interop';

import 'package:chat_example/client/display.dart';
import 'package:web/web.dart';

/// [Display] using `dart:html`.
class HtmlDisplay implements Display {
  final Element _element;
  final HtmlEscape _htmlEscape = const HtmlEscape();

  factory HtmlDisplay() {
    return HtmlDisplay._(document.querySelector('#text')!);
  }

  HtmlDisplay._(this._element) {
    add('Welcome to the built_value chat example. For help, type /help.');
  }

  @override
  void addLocal(String text) {
    _element.textContent = _element.textContent! +
        '<div class="local">'
            '${_htmlEscape.convert(text).replaceAll('\n', '<br>')}</div>';
    window.scrollTo(0.toJS, document.body!.scrollHeight);
  }

  @override
  void add(String text) {
    _element.textContent = _element.textContent! +
        '${_htmlEscape.convert(text).replaceAll('\n', '<br>')}<br>';
    window.scrollTo(0.toJS, document.body!.scrollHeight);
  }
}
