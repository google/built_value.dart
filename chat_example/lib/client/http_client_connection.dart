// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'package:chat_example/client/client_connection.dart';

/// [ClientConnection] using a web socket.
class HttpClientConnection implements ClientConnection {
  final WebSocket _websocket;
  final StreamController<String> _streamController =
      new StreamController<String>();

  factory HttpClientConnection() {
    return new HttpClientConnection._(
        new WebSocket('ws://${window.location.host}/ws'));
  }

  HttpClientConnection._(this._websocket) {
    _websocket.onMessage.listen((message) {
      _streamController.add(message.data as String);
    });
  }

  Stream<String> get dataFromServer => _streamController.stream;

  void sendToServer(String data) {
    _websocket.send(data);
  }
}
