// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:test/test.dart';

import 'plugin_tester.dart';

void main() {
  group('corrects implements statement', () {
    test('with no generics', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo implements Built {
  factory Foo() => new _$Foo();
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo implements Built<Foo, FooBuilder> {
  factory Foo() => new _$Foo();
  Foo._();
}''');
    });

    test('with wrong generics', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo implements Built<Bar, Baz> {
  factory Foo() => new _$Foo();
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo implements Built<Foo, FooBuilder> {
  factory Foo() => new _$Foo();
  Foo._();
}''');
    });

    test('with interfaces and extends', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar, Built<Bar, Baz>, Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar, Built<Foo, FooBuilder>, Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''');
    });

    test('with interfaces and no generics', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar, Built, Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar, Built<Foo, FooBuilder>, Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''');
    });

    test('with generic class', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo<T> implements Built {
  factory Foo() => new _$Foo<T>();
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo<T> implements Built<Foo<T>, FooBuilder<T>> {
  factory Foo() => new _$Foo<T>();
  Foo._();
}''');
    });

    test('with awkward formatting', () async {
      await expectCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar<A,
    B>, Built,
    Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''', r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar<A, B>, Built<Foo, FooBuilder>, Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''');
    });
  });

  group('does not touch correct implements statement', () {
    test('with awkward formatting', () async {
      await expectNoCorrection(r'''
part '_resolve_source.g.dart';

abstract class Foo extends Bar implements Bar<A,
    B>, Built<Foo, FooBuilder>,
    Bop {
  factory Foo() => new _$Foo();
  Foo._();
}''');
    });
  });
}
