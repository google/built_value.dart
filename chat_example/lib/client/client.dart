// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:chat_example/client/client_connection.dart';
import 'package:chat_example/client/display.dart';
import 'package:chat_example/data_model/data_model.dart';
import 'package:chat_example/data_model/serializers.dart';

typedef CommandRunner = void Function(String command);

/// Client-side logic for built_value chat example.
class Client {
  final Stream<String> _keyboardInput;
  final Display _display;
  final ClientConnection _connection;

  /// A chat client needs a keyboard, a display and a connection.
  Client(this._keyboardInput, this._display, this._connection) {
    _keyboardInput.listen(_runLocalCommand);
    _connection.dataFromServer.listen(_handleServerData);
  }

  void _handleServerData(String data) {
    final response = serializers.deserialize(json.decode(data));

    if (response is Response) {
      _display.add(response.render());
    } else {
      throw StateError('Invalid data from server: $response');
    }
  }

  void _runLocalCommand(String command) {
    final handlers = <String, CommandRunner>{
      '/away': _runAway,
      '/help': _runHelp,
      '/list': _runList,
      '/login': _runLogin,
      '/quit': _runQuit,
      '/status': _runStatus,
      '/tell': _runTell,
    };

    var found = false;
    handlers.forEach((prefix, commandRunner) {
      if (command.startsWith(prefix)) {
        commandRunner(command);
        found = true;
      }
    });
    if (found) return;

    if (command.startsWith('/')) {
      _display.addLocal(command);
      _display.add('Unknown command.');
      return;
    }

    _send(Chat((b) => b..text = command));
  }

  void _runAway(String command) {
    _display.addLocal(command);
    _send(Status((b) => b
      ..message = command.substring('/away '.length)
      ..type = StatusType.away));
  }

  void _runHelp(String command) {
    _display.addLocal(command);
    _display.addLocal('''Commands:

/away <message> -- sets away message
/help -- for help
/list -- list online users
/login <username> <password> -- log in or create new user
/quit <message> -- quits with message
/status <message> -- sets status message
/tell <username> <message> -- private message
''');
  }

  void _runList(String command) {
    _display.addLocal(command);
    _send(ListUsers(
        (b) => b..statusTypes.replace([StatusType.online, StatusType.away])));
  }

  void _runLogin(String command) {
    final words = command.split(' ');
    _display.addLocal('/login ${words[1]} ********');
    _send(Login((b) => b
      ..username = words[1]
      ..password = words[2]));
  }

  void _runQuit(String command) {
    _display.addLocal(command);
    _send(Status((b) => b
      ..message = command.substring('/quit '.length)
      ..type = StatusType.offline));
  }

  void _runStatus(String command) {
    _display.addLocal(command);
    _send(Status((b) => b
      ..message = command.substring('/status '.length)
      ..type = StatusType.online));
  }

  void _runTell(String command) {
    _display.addLocal(command);
    final words = command.split(' ');
    final targets = words[1].split(',');
    _send(Chat((b) => b
      ..text = words.sublist(2).join(' ')
      ..targets.replace(targets)));
  }

  void _send(Command command) {
    _connection.sendToServer(json.encode(serializers.serialize(command)));
  }
}
