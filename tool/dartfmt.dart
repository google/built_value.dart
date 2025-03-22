// Copyright (c) 2025, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';

/// Run after `dartfmt` to fix `(b) => b..` multiline blocks.
///
/// Pass the list of files to run on.
void main(List<String> arguments) {
  for (final path in arguments) {
    format(path);
  }
}

void format(String path) {
  final file = File(path);
  final source = file.readAsStringSync();
  final lines = source.trim().split('\n');

  final outputLines = <String>[];
  final trimIndentation = <int>[];
  for (var i = 0; i != lines.length; ++i) {
    var line = lines[i];

    // Check for the builder pattern.
    if (i < lines.length - 2) {
      final line2 = lines[i + 1];
      final line3 = lines[i + 2];
      if (line.trim() == '(b) =>' &&
          line2.trim() == 'b' &&
          line3.trim().startsWith('..')) {
        // Push `(b) => b` onto the previous line.
        outputLines.last = '${outputLines.last}(b) {';
        // Trim indentation from the next lines.
        trimIndentation.add(line.indexOf('(') - 1);
        i++;
        continue;
      }
    }

    // Trim indentation based on a previous match.
    if (trimIndentation.isNotEmpty) {
      final trimmedLine = line.trim();
      if (trimmedLine != line) {
        final indentation = line.indexOf(trimmedLine.substring(0, 1)) - 1;
        if (indentation <= trimIndentation.last) {
          trimIndentation.removeLast();
          line = line.replaceFirst(')', '})');
        }
        line = line.substring(6 * trimIndentation.length);
        if (line.contains(' ..')) {
          if (!outputLines.last.contains('(b) {')) {
            outputLines.last = '${outputLines.last};';
          }
          line = line.replaceAll(' ..', ' b.');
          if (line.endsWith(',')) line = '${line.substring(0, line.length - 1)};';
        }
      }
    }

    outputLines.add(line);
  }

  final updatedSource = outputLines.map((l) => '$l\n').join('');

  if (updatedSource == source) {
    print('No change to $path');
  } else {
    file.writeAsStringSync(updatedSource);
    print('Formatted $path');
  }
}
