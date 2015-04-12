// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value;

export 'package:quiver/core.dart' show hashObjects;

/// Implement this for a Built Value.
///
/// Then use built_value_generator.dart code generation functionality to
/// provide the rest of the implementation.
///
/// See <https://github.com/google/built_value.dart/tree/master/example>
abstract class Built<V extends Built<V, B>, B extends Builder<V, B>> {
  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [B].
  ///
  /// The implementation of this method will be generated for you by the
  /// built_value generator.
  V rebuild(updates(B builder));

  /// Converts the instance to a builder [B].
  ///
  /// The implementation of this method will be generated for you by the
  /// built_value generator.
  B toBuilder();
}

/// Every Built Value must have a [Builder] class.
///
/// Use it to set defaults, if needed, and to do validation.
///
/// See <https://github.com/google/built_value.dart/tree/master/example>
abstract class Builder<V extends Built<V, B>, B extends Builder<V, B>> {
  /// Replaces the value in the builder with a new one.
  ///
  /// The implementation of this method will be generated for you by the
  /// built_value generator.
  void replace(V value);

  /// Applies updates.
  ///
  /// [updates] is a function that takes a builder [B].
  void update(updates(B builder));

  /// Builds.
  ///
  /// The implementation of this method will be generated for you by the
  /// built_value generator.
  ///
  /// Override this method to add validation at build time.
  V build();
}

// Nullable annotation for Built Value fields.
//
// Fields marked with this annotation are allowed to be null.
const String nullable = 'nullable';
