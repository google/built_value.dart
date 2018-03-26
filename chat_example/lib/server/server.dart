// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:chat_example/data_model/data_model.dart';
import 'package:chat_example/data_model/serializers.dart';
import 'package:chat_example/server/server_connection.dart';

/// Server-side logic for the built_value chat example.
class Server {
  final Random random = new Random();
  final Set<ServerConnection> _connections = new Set<ServerConnection>();
  final Map<String, String> _passwords = <String, String>{};
  final Map<String, Status> _statuses = <String, Status>{};
  final List<Response> _log = <Response>[];

  /// Adds a new connection to the server.
  ///
  /// A random username is assigned.
  void addConnection(ServerConnection connection) {
    final username = 'anon${random.nextInt(10000)}';
    connection.username = username;
    _connections.add(connection);
    _send(
        connection,
        new Welcome((b) => b
          ..log.addAll(_log)
          ..message = 'You are connected as $username.'));
    connection.dataFromClient
        .listen((string) => _handleDataFromClient(connection, string));
  }

  void _handleDataFromClient(ServerConnection connection, String data) {
    final command = serializers.deserialize(json.decode(data));

    if (command is Chat) {
      _chat(connection, command);
    } else if (command is Login) {
      _login(connection, command);
    } else if (command is Status) {
      _status(connection, command);
    } else if (command is ListUsers) {
      _listUsers(connection, command);
    } else {
      throw new StateError('Invalid data from client: $command');
    }
  }

  void _chat(ServerConnection connection, Chat chat) {
    if (chat.targets.isEmpty) {
      _sendToAll(new ShowChat((b) => b
        ..username = connection.username
        ..private = false
        ..text = chat.text));
    } else {
      _sendTo(
          chat.targets,
          new ShowChat((b) => b
            ..username = connection.username
            ..private = true
            ..text = chat.text));
    }
  }

  void _listUsers(ServerConnection connection, ListUsers listUsers) {
    _send(
        connection,
        new ListUsersResponse((b) => _statuses.forEach((username, status) {
              if (listUsers.statusTypes.contains(status.type)) {
                b.statuses[username] = status;
              }
            })));
  }

  void _login(ServerConnection connection, Login login) {
    if (_passwords.containsKey(login.username)) {
      if (_passwords[login.username] != login.password) {
        _send(connection, LoginResponse.badPassword);
        return;
      }
    } else {
      _passwords[login.username] = login.password;
    }

    for (final existingConnection in _connections) {
      if (existingConnection.username == login.username) {
        existingConnection.username = 'anon${random.nextInt(10000)}';
        _send(existingConnection, LoginResponse.reset);
      }
    }

    _statuses[login.username] = new Status((b) => b
      ..message = ''
      ..type = StatusType.online);

    connection.username = login.username;
    _send(connection, LoginResponse.success);
  }

  void _status(ServerConnection connection, Status status) {
    _statuses[connection.username] = status;
    if (status.type == StatusType.offline) {
      _connections.remove(connection);
      connection.close();
    }
  }

  void _sendTo(BuiltSet<String> usernames, Response response) {
    for (final connection in _connections) {
      if (usernames.contains(connection.username)) {
        _send(connection, response);
      }
    }
  }

  void _sendToAll(Response response) {
    _log.add(response);
    for (final connection in _connections) {
      _send(connection, response);
    }
  }

  static void _send(ServerConnection connection, Response response) {
    connection.sendToClient(json.encode(serializers.serialize(response)));
  }
}
