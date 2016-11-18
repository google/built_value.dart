// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:package_resolver/package_resolver.dart';
import 'package:route/server.dart';

typedef SocketReceiver(WebSocket webSocket);

/// Serves static resources for the built_value chat example.
///
/// Also, accepts web socket connections.
class ResourceServer {
  /// Serves resources, passing new sockets to [socketReceiver].
  Future start(SocketReceiver socketReceiver) async {
    final server = await HttpServer.bind('localhost', 26199);
    print('Serving at localhost:26199.');
    final router = new Router(server);
    router.serve('/').listen((request) {
      request.response
        ..statusCode = HttpStatus.OK
        ..headers.contentType =
            new ContentType('text', 'html', charset: 'utf-8')
        ..write(new File('web/index.html').readAsStringSync())
        ..close();
    });

    router.serve('/main.dart').listen((request) {
      request.response
        ..statusCode = HttpStatus.OK
        ..headers.contentType =
            new ContentType('application', 'dart', charset: 'utf-8')
        ..write(new File('web/main.dart').readAsStringSync())
        ..close();
    });

    router.serve(new RegExp(r'.*\.dart$')).listen((request) async {
      var path = request.uri.path;

      if (path.startsWith('/packages/')) {
        final package = path
            .replaceFirst('/packages/', '')
            .replaceFirst(new RegExp('/.*'), '');
        final resolved = await PackageResolver.current.packagePath(package);
        path = resolved + '/lib' + path.replaceFirst('/packages/$package', '');
      } else {
        path = '.$path';
      }

      request.response
        ..statusCode = HttpStatus.OK
        ..headers.contentType =
            new ContentType('application', 'dart', charset: 'utf-8')
        ..write(new File(path).readAsStringSync())
        ..close();
    });

    router.serve('/main.css').listen((request) {
      request.response
        ..statusCode = HttpStatus.OK
        ..headers.contentType = new ContentType('text', 'css', charset: 'utf-8')
        ..write(new File('web/main.css').readAsStringSync())
        ..close();
    });

    router
        .serve('/ws')
        .transform(
            new WebSocketTransformer(compression: CompressionOptions.OFF))
        .listen(socketReceiver);
  }
}
