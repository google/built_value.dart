// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// Chat window main text display.
abstract class Display {
  /// Adds [text] to the display, coloured to indicate a local command.
  void addLocal(String text);

  /// Adds [text] to the display.
  void add(String text);
}
