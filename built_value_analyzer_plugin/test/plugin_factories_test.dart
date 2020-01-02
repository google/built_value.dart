// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:test/test.dart';

import 'plugin_tester.dart';

void main() {
  group('corrects factories', () {
    test('when the are no factories', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo implements Built<Foo, FooBuilder> {
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo implements Built<Foo, FooBuilder> {
  Foo._();
  factory Foo([void Function(FooBuilder) updates]) = _$Foo;
}''');
    });
  });
}
