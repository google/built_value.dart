// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

import 'server_connection.dart';

/// [ServerConnection] using a web socket.
class HttpServerConnection implements ServerConnection {
  final WebSocketChannel _webSocketChannel;
  final StreamController<String> _streamController = StreamController<String>();

  @override
  late String username;

  HttpServerConnection(this._webSocketChannel) {
    _webSocketChannel.stream.listen((data) {
      _streamController.add(data as String);
    });
  }

  @override
  Stream<String> get dataFromClient => _streamController.stream;

  @override
  void sendToClient(String data) {
    _webSocketChannel.sink.add(data);
  }

  @override
  void close() {
    _webSocketChannel.sink.close();
  }
}
