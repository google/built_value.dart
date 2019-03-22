// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_proxy/shelf_proxy.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef SocketReceiver = void Function(WebSocketChannel webSocket);

/// Resource server for the built_value chat example.
///
/// Proxies to pub serve for most requests. Accepts web socket connections.
class ResourceServer {
  /// Serves resources, passing new sockets to [socketReceiver].
  Future start(SocketReceiver socketReceiver) async {
    final cascade = Cascade()
        // Web socket handler will do nothing for non-websocket requests, so
        // just add it in the cascade at the top.
        .add(webSocketHandler(socketReceiver))
        // Anything else goes to pub serve.
        .add(proxyHandler(Uri.parse('http://localhost:8080')))
        // If that didn't work, must be a problem with pub serve.
        .add((_) {
      print('Request failed. Check pub serve output for errors.');
      return Response.notFound('');
    });

    await io.serve(cascade.handler, 'localhost', 26199).then((server) {
      print('Serving at http://${server.address.host}:${server.port}. Please '
          'also run pub serve on port 8080.');
    });
  }
}
