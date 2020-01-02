import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
// ignore: implementation_imports
import 'package:built_value_generator/src/value_source_class.dart';

/// Checks a library for errors related to built_value generation. Returns
/// the errors and, where possible, corresponding fixes.
class Checker {
  Map<AnalysisError, PrioritizedSourceChange> check(
      LibraryElement libraryElement) {
    var result = <AnalysisError, PrioritizedSourceChange>{};

    for (var compilationUnit in libraryElement.units) {
      // Don't analyze if there's no source; there's nothing to do.
      if (compilationUnit.source == null) continue;
      // Don't analyze generated source; there's nothing to do.
      if (compilationUnit.source.fullName.endsWith('.g.dart')) continue;

      for (var type in compilationUnit.types) {
        if (!type.interfaces.any((i) => i.displayName.startsWith('Built'))) {
          continue;
        }

        final sourceClass = ValueSourceClass(type);
        final errors = sourceClass.computeErrors();

        if (errors.isNotEmpty) {
          final lineInfo = compilationUnit.lineInfo;

          // Report one error on the 'Built' interface. Bundle together all the
          // necessary fixes.

          // TODO(davidmorgan): split error message and example; only show
          // example in the build error, not in the IDE.
          final builtNode = sourceClass
              .classDeclaration.implementsClause.interfaces
              .singleWhere((typeName) => typeName.name.name == 'Built');
          final offset = builtNode.offset;
          final length = builtNode.length;
          final offsetLineLocation = lineInfo.getLocation(offset);
          final error = AnalysisError(
              AnalysisErrorSeverity.ERROR,
              AnalysisErrorType.LINT,
              Location(
                  compilationUnit.source.fullName,
                  offset,
                  length,
                  offsetLineLocation.lineNumber,
                  offsetLineLocation.columnNumber),
              'Class needs fixes for built_value: ' +
                  errors.map((error) => error.message).join(' '),
              'BUILT_VALUE_NEEDS_FIXES');

          // Fix consists of all the individual fixes, sorted so they apply
          // from the end of the file backwards, so each fix does not
          // invalidate the line numbers for the following fixes.
          final edits = errors
              .where((error) => error.fix != null)
              .map((error) => SourceEdit(error.offset, error.length, error.fix))
              .toList();
          edits.sort((left, right) => right.offset.compareTo(left.offset));

          final fix = PrioritizedSourceChange(
              1000000,
              SourceChange(
                'Apply fixes for built_value.',
                edits: [
                  SourceFileEdit(
                    compilationUnit.source.fullName,
                    compilationUnit.source.modificationStamp,
                    edits: edits,
                  )
                ],
              ));
          result[error] = fix;
        }
      }
    }

    return result;
  }
}
