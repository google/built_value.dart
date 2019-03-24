// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:chat_example/client/client.dart';
import 'package:chat_example/server/server.dart';
import 'package:chat_example/testing/fake_client_connection.dart';
import 'package:chat_example/testing/fake_display.dart';
import 'package:chat_example/testing/fake_server_connection.dart';
import 'package:chat_example/testing/test_user.dart';

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

    clientConnection.toServerStreamController.stream.listen((string) {
      serverConnection.fromClientStreamController.add(string);
    });
    serverConnection.toClientStreamController.stream.listen((string) {
      clientConnection.fromServerStreamController.add(string);
    });

    final keyboardInputController = StreamController<String>(sync: true);
    final display = FakeDisplay();
    Client(keyboardInputController.stream, display, clientConnection);
    server.addConnection(serverConnection);
    return TestUser(display, keyboardInputController);
  }
}
