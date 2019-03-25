import 'dart:async';

import 'package:build_test/build_test.dart';
import 'package:built_value_generator/src/plugin/checker.dart';
import 'package:test/test.dart';

/// Applies fixes from the plugin to [src], and compares the result to
/// [expectedFixedSource].
Future expectCorrection(String src, String expectedFixedSource) async {
  final checker = new Checker();

  // We need a library name to use `findLibraryByName` from `build_test`.
  final srcPrefix = 'library test_library;';

  // Supply anything else we expect to need to resolve the source.
  final srcSuffix = 'class Built {};';

  // The source that the [Checker] will run on.
  final totalSrc = '$srcPrefix$src$srcSuffix';

  // Resolve the source and run the [Checker].
  final element = await resolveSource(
      totalSrc, (resolver) => resolver.findLibraryByName('test_library'));
  final checkResults = checker.check(element);

  // Apply the fixes to the source.
  //
  // Plugin must output edits sorted descending by offset, so we can apply them
  // one after the other without them clashing.
  var fixedSrc = totalSrc;
  final edits = checkResults.values
      .expand((correction) =>
          correction.change.edits.expand((edits) => edits.edits))
      .toList();
  for (final edit in edits) {
    fixedSrc = fixedSrc.replaceRange(
        edit.offset, edit.offset + edit.length, edit.replacement);
  }

  // Strip off the prefix and suffix that were added to the source so we can
  // compare what changed.
  expect(fixedSrc, startsWith(srcPrefix));
  fixedSrc = fixedSrc.substring(srcPrefix.length);
  expect(fixedSrc, endsWith(srcSuffix));
  fixedSrc = fixedSrc.substring(0, fixedSrc.length - srcSuffix.length);

  // Finally, check the result against the expectation.
  expect(fixedSrc, expectedFixedSource);
}

/// Check that the plugin will not modify [src].
Future expectNoCorrection(String src) async {
  final checker = new Checker();
  final srcPrefix = 'library test_library; class Built {};';
  final totalSrc = '$srcPrefix$src';

  final element = await resolveSource(
      totalSrc, (resolver) => resolver.findLibraryByName('test_library'));

  expect(
      checker.check(element).values.expand((correction) =>
          correction.change.edits.expand((edits) => edits.edits)),
      isEmpty);
}
