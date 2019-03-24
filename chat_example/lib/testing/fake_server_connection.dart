// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:chat_example/server/server_connection.dart';

/// Fake [ServerConnection] that exposes stream controllers.
class FakeServerConnection implements ServerConnection {
  final StreamController<String> toClientStreamController =
      StreamController<String>(sync: true);
  final StreamController<String> fromClientStreamController =
      StreamController<String>(sync: true);

  @override
  String username;

  @override
  void sendToClient(String data) {
    toClientStreamController.add(data);
  }

  @override
  Stream<String> get dataFromClient => fromClientStreamController.stream;

  @override
  void close() {}
}
