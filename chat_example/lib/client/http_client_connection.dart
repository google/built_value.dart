// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart';

import 'client_connection.dart';

/// [ClientConnection] using a web socket.
class HttpClientConnection implements ClientConnection {
  final WebSocket _websocket;
  final StreamController<String> _streamController = StreamController<String>();

  factory HttpClientConnection() {
    return HttpClientConnection._(WebSocket('ws://${window.location.host}/ws'));
  }

  HttpClientConnection._(this._websocket) {
    _websocket.onMessage.listen((message) {
      // ignore: invalid_runtime_check_with_js_interop_types
      _streamController.add(message.data as String);
    });
  }

  @override
  Stream<String> get dataFromServer => _streamController.stream;

  @override
  void sendToServer(String data) {
    _websocket.send(data.toJS);
  }
}
