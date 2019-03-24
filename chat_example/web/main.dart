// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:chat_example/client/client.dart';
import 'package:chat_example/client/html_display.dart';
import 'package:chat_example/client/http_client_connection.dart';
import 'package:chat_example/client/input.dart';
import 'package:chat_example/client/layout.dart';

void main() {
  Layout();
  final input = Input();
  Client(input.keyboardInput, HtmlDisplay(), HttpClientConnection());
}
