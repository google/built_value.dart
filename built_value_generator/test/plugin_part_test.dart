// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:test/test.dart';

import 'plugin_tester.dart';

void main() {
  group('corrects part', () {
    test('when part is not referenced', () async {
      await expectCorrection(r'''
abstract class Foo implements Built<Foo, FooBuilder> {
  Foo._();
  factory Foo([void Function(FooBuilder) updates]) = _$Foo;
}''', r'''


part '_resolve_source.g.dart';

abstract class Foo implements Built<Foo, FooBuilder> {
  Foo._();
  factory Foo([void Function(FooBuilder) updates]) = _$Foo;
}''');
    });
  });
}
