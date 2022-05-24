// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:matcher/matcher.dart';

/// Returns a matcher that matches if the value is structurally equal to
/// [expected].
///
/// Improves on a simple equality test by offering a detailed mismatch message.
Matcher equalsBuilt(Built expected) => _BuiltValueMatcher(expected);

/// Matcher for [Built] instances.
///
/// Converts instances to maps using [_CapturingToStringHelper] then compares
/// using [equals], which does deep comparison on maps.
class _BuiltValueMatcher implements Matcher {
  final Built _expected;
  final Matcher _delegate;

  _BuiltValueMatcher(this._expected) : _delegate = equals(_toMap(_expected));

  @override
  Description describe(Description description) =>
      _delegate.describe(description);

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
      Map matchState, bool verbose) {
    if (_expected.runtimeType != item.runtimeType) {
      return mismatchDescription.add('is the wrong type');
    }

    return _delegate.describeMismatch(
        _toMap(item), mismatchDescription, matchState, verbose);
  }

  @override
  bool matches(dynamic item, Map matchState) {
    if (_expected.runtimeType != item.runtimeType) return false;

    return _delegate.matches(_toMap(item), matchState);
  }
}

/// Converts a Built to a map.
Map<String, Object?> _toMap(Object? built) {
  // Save the current newBuiltValueToStringHelper so we can restore it on
  // return.
  final previousNewBuiltValueToStringHelper = newBuiltValueToStringHelper;

  // Create a ToStringHelper that will capture values instead of converting
  // them to String.
  final capturingToStringHelper = _CapturingToStringHelper();
  newBuiltValueToStringHelper = (String className) {
    // Store the class name in the map, so we check types as well as fields
    // and values.
    capturingToStringHelper.map[r'$class'] = className;
    return capturingToStringHelper;
  };

  // Call toString() on the value to do capture.
  built.toString();

  // Reset to what it was on method entry.
  newBuiltValueToStringHelper = previousNewBuiltValueToStringHelper;

  return capturingToStringHelper.map;
}

/// Captures values in a Map instead of converting to a String.
class _CapturingToStringHelper implements BuiltValueToStringHelper {
  final Map<String, Object?> map = <String, Object?>{};

  @override
  void add(String field, Object? value) {
    if (value is Built) {
      map[field] = _toMap(value);
    } else if (value is BuiltList) {
      map[field] = value.asList();
    } else if (value is BuiltListMultimap) {
      map[field] = value.asMap();
    } else if (value is BuiltMap) {
      map[field] = value.asMap();
    } else if (value is BuiltSet) {
      map[field] = value.asSet();
    } else if (value is BuiltSetMultimap) {
      map[field] = value.asMap();
    } else {
      map[field] = value;
    }
  }
}
