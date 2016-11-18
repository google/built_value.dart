// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

/// Two-way connection between client and server; the client.
abstract class ClientConnection {
  Stream<String> get dataFromServer;

  void sendToServer(String string);
}
