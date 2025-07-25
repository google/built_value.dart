// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import '../client/client.dart';
import '../server/server.dart';
import 'fake_client_connection.dart';
import 'fake_display.dart';
import 'fake_server_connection.dart';
import 'test_user.dart';

/// Environment for testing server and client logic together.
///
/// The HTML display and input are faked, as are the HTTP connections. This
/// leaves the client logic and server logic available for testing.
class FakeEnvironment {
  final Server server;

  factory FakeEnvironment() {
    final server = Server();

    return FakeEnvironment._(server);
  }

  FakeEnvironment._(this.server);

  /// Creates a new user connected to this environment.
  TestUser newUser() {
    final clientConnection = FakeClientConnection();
    final serverConnection = FakeServerConnection();

    clientConnection.toServerStreamController.stream.listen(
      serverConnection.fromClientStreamController.add,
    );
    serverConnection.toClientStreamController.stream.listen(
      clientConnection.fromServerStreamController.add,
    );

    final keyboardInputController = StreamController<String>(sync: true);
    final display = FakeDisplay();
    Client(keyboardInputController.stream, display, clientConnection);
    server.addConnection(serverConnection);
    return TestUser(display, keyboardInputController);
  }
}
