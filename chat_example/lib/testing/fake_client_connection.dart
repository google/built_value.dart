// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:chat_example/client/client_connection.dart';

/// Fake [ClientConnection] that exposes stream controllers.
class FakeClientConnection implements ClientConnection {
  final StreamController<String> toServerStreamController =
      StreamController<String>(sync: true);
  final StreamController<String> fromServerStreamController =
      StreamController<String>(sync: true);

  @override
  void sendToServer(String string) {
    toServerStreamController.add(string);
  }

  @override
  Stream<String> get dataFromServer => fromServerStreamController.stream;
}
