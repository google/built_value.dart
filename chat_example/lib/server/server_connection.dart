// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

/// Two-way connection between client and server; the server.
abstract class ServerConnection {
  /// The username associated with this connection.
  String get username;
  set username(String username);

  Stream<String> get dataFromClient;
  void sendToClient(String data);
  void close();
}
