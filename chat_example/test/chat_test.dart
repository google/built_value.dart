// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:chat_example/data_model/data_model.dart';
import 'package:chat_example/testing/fake_environment.dart';
import 'package:test/test.dart';

void main() {
  FakeEnvironment environment;

  setUp(() {
    environment = new FakeEnvironment();
  });

  group('on connect', () {
    test('client sees login message', () async {
      final alice = environment.newUser();

      alice.expectMatch('.*You are connected as .*');
    });

    test('clients can exchange messages', () async {
      final alice = environment.newUser();
      final bob = environment.newUser();

      alice.type('Hi, Bob!');
      bob.expectMatch('anon.*: Hi, Bob!');

      bob.type('Hi, Alice!');
      alice.expectMatch('anon.*: Hi, Alice!');
    });

    test('clients can see log', () async {
      final alice = environment.newUser();
      alice.type('Hi, Bob!');

      final bob = environment.newUser();
      bob.expectMatch('anon.*: Hi, Bob!');
    });
  });

  group('login', () {
    test('announces success to self', () async {
      final alice = environment.newUser();

      alice
        ..type('/login Alice letmein')
        ..expectMatch(LoginResponse.success.render());
    });

    test('changes name', () async {
      final alice = environment.newUser();
      final bob = environment.newUser();

      alice..type('/login Alice letmein')..type('Hi, Bob!');
      bob.expectMatch('Alice: Hi, Bob!');
    });

    test('fails with wrong password', () async {
      final alice = environment.newUser();
      final bob = environment.newUser();

      alice.type('/login Alice letmein');
      bob.type('/login Alice wrongpassword');
      bob.expectMatch(LoginResponse.badPassword.render());
    });

    test('logs out existing user', () async {
      final alice = environment.newUser()..type('/login Alice letmein');
      environment.newUser()..type('/login Alice letmein');

      alice.expectMatch(LoginResponse.reset.render());
    });
  });

  group('list', () {
    test('shows online users', () async {
      final alice = environment.newUser()..type('/login Alice letmein');
      environment.newUser()..type('/login Bob letmein');

      alice
        ..type('/list')
        ..expectMatch('''The following users are online:

Alice
Bob
''');
    });
  });

  group('status', () {
    test('changes message in user list', () async {
      final alice = environment.newUser()..type('/login Alice letmein');

      alice
        ..type('/status Waiting around.')
        ..type('/list')
        ..expectMatch('''The following users are online:

Alice Waiting around.
''');
    });
  });

  group('away', () {
    test('changes message in user list', () async {
      final alice = environment.newUser()..type('/login Alice letmein');

      alice
        ..type('/away Not here.')
        ..type('/list')
        ..expectMatch('''The following users are online:

Alice Not here.
''');
    });
  });

  group('quit', () {
    test('removes from online list', () async {
      final alice = environment.newUser()..type('/login Alice letmein');
      final bob = environment.newUser()..type('/login Bob letmein');

      alice.type('/quit Gone.');
      bob
        ..type('/list')
        ..expectMatch('''The following users are online:

Bob
''');
    });

    test('stops getting messages', () async {
      final alice = environment.newUser()..type('/login Alice letmein');
      final bob = environment.newUser()..type('/login Bob letmein');

      alice.type('/quit Gone.');
      bob.type('Hi Alice.');
      alice.expectNoMatch('Hi Alice.');
    });
  });

  group('tell', () {
    test('goes to a single user', () async {
      final alice = environment.newUser()..type('/login Alice letmein');
      final bob = environment.newUser()..type('/login Bob letmein');
      final eve = environment.newUser();

      alice.type('/tell Bob Hi there.');
      bob..expectMatch(r'Alice \(private\): Hi there.');
      eve.expectNoMatch('Hi there.');
    });
  });
}
