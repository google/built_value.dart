// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library memoization;

import 'package:built_value/built_value.dart';

part 'memoization.g.dart';

/// Example of how to use [memoize].
abstract class DerivedValue
    implements Built<DerivedValue, DerivedValueBuilder> {
  int get anInt;

  /// This getter is marked [memoize], so it will be called at most once. The
  /// result will be stored in the instance and reused.
  @memoized
  int get derivedValue {
    // Just for tests! Don't change state in your own @memoized getters.
    ++derivedValueGetterCount;

    // This can be an expensive computation. It will only be called once on
    // each instance.
    return anInt + 10;
  }

  /// This getter is marked [memoize], so it will be called at most once. The
  /// result will be stored in the instance and reused.
  @memoized
  Iterable<String> get derivedString {
    // Just for tests! Don't change state in your own @memoized getters.
    ++derivedStringGetterCount;

    // This can be an expensive computation. It will only be called once on
    // each instance.
    return [toString()];
  }

  factory DerivedValue([updates(DerivedValueBuilder b)]) = _$DerivedValue;
  DerivedValue._();
}

int derivedValueGetterCount = 0;

int derivedStringGetterCount = 0;
