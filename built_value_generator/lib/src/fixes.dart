// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/built_value.dart';

part 'fixes.g.dart';

/// An error in input source detected by the generator.
///
/// Optionally specifies the location of the error and the source code to
/// replace it to fix the error.
abstract class GeneratorError
    implements Built<GeneratorError, GeneratorErrorBuilder> {
  /// Error message for the user.
  String get message;

  /// Optionally, the offset of the incorrect code.
  @nullable
  int get offset;

  /// Optionally, the length of the incorrect code.
  @nullable
  int get length;

  /// Optionally, the fix for the incorrect code.
  @nullable
  String get fix;

  factory GeneratorError([updates(GeneratorErrorBuilder b)]) = _$GeneratorError;
  GeneratorError._() {
    if (((offset == null) != (length == null)) ||
        ((offset == null) != (fix == null))) {
      throw new ArgumentError(
          'Offset, length and fix must either all be null or all non-null. '
          'Got: offset $offset, length $length, fix $fix');
    }
  }
}
