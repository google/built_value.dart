// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:chat_example/server/http_server_connection.dart';
import 'package:chat_example/server/resource_server.dart';
import 'package:chat_example/server/server.dart';

void main() {
  final server = new Server();
  new ResourceServer().start(
      (webSocket) => server.addConnection(new HttpServerConnection(webSocket)));
}
