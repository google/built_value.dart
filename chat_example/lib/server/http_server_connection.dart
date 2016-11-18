// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:chat_example/server/server_connection.dart';

/// [ServerConnection] using a web socket.
class HttpServerConnection implements ServerConnection {
  final WebSocket _webSocket;
  final StreamController<String> _streamController =
      new StreamController<String>();

  @override
  String username;

  HttpServerConnection(this._webSocket) {
    _webSocket.listen((data) {
      _streamController.add(data);
    });
  }

  Stream<String> get dataFromClient => _streamController.stream;

  void sendToClient(String data) {
    _webSocket.add(data);
  }

  @override
  void close() {
    _webSocket.close();
  }
}
