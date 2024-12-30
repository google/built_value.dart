// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/src/dart/analysis/experiments.dart';

/// Tools for [LibraryElement2]s.
class LibraryElements {
  static bool areClassMixinsEnabled(LibraryElement2 element) =>
      ExperimentStatus.knownFeatures.containsKey('class-modifiers') &&
      element.featureSet
          .isEnabled(ExperimentStatus.knownFeatures['class-modifiers']!);
}
