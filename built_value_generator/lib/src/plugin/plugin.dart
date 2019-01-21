import 'dart:async';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/file_system/file_system.dart';
// ignore: implementation_imports
import 'package:analyzer/src/context/builder.dart';
// ignore: implementation_imports
import 'package:analyzer/src/context/context_root.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart' as plugin;
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:built_value_generator/src/plugin/checker.dart';

/// Analyzer plugin for built_value.
///
/// Surfaces the same errors as the generator at compile time, with fixes
/// where possible.
class BuiltValueAnalyzerPlugin extends ServerPlugin {
  final Checker checker = new Checker();

  BuiltValueAnalyzerPlugin(ResourceProvider provider) : super(provider);

  @override
  AnalysisDriverGeneric createAnalysisDriver(plugin.ContextRoot contextRoot) {
    final root = new ContextRoot(contextRoot.root, contextRoot.exclude,
        pathContext: resourceProvider.pathContext)
      ..optionsFilePath = contextRoot.optionsFile;
    final contextBuilder =
        new ContextBuilder(resourceProvider, sdkManager, null)
          ..analysisDriverScheduler = analysisDriverScheduler
          ..byteStore = byteStore
          ..performanceLog = performanceLog
          ..fileContentOverlay = fileContentOverlay;
    final result = contextBuilder.buildDriver(root);
    result.results.listen(_processResult);
    return result;
  }

  @override
  List<String> get fileGlobsToAnalyze => const ['*.dart'];

  @override
  String get name => 'Built Value';

  // This is the protocol version, not the plugin version. It must match the
  // version of the `analyzer_plugin` package.
  @override
  String get version => '1.0.0-alpha.0';

  @override
  String get contactInfo => 'https://github.com/google/built_value.dart/issues';

  /// Computes errors based on an analysis result and notifies the analyzer.
  // ignore: deprecated_member_use
  void _processResult(ResolveResult analysisResult) {
    try {
      // If there is no relevant analysis result, notify the analyzer of no errors.
      if (analysisResult.unit == null ||
          analysisResult.libraryElement == null) {
        channel.sendNotification(
            new plugin.AnalysisErrorsParams(analysisResult.path, [])
                .toNotification());
      } else {
        // If there is something to analyze, do so and notify the analyzer.
        // Note that notifying with an empty set of errors is important as
        // this clears errors if they were fixed.
        final checkResult = checker.check(analysisResult.libraryElement);
        channel.sendNotification(new plugin.AnalysisErrorsParams(
                analysisResult.path, checkResult.keys.toList())
            .toNotification());
      }
    } catch (e, stackTrace) {
      // Notify the analyzer that an exception happened.
      channel.sendNotification(new plugin.PluginErrorParams(
              false, e.toString(), stackTrace.toString())
          .toNotification());
    }
  }

  @override
  void contentChanged(String path) {
    super.driverForPath(path).addFile(path);
  }

  @override
  Future<plugin.EditGetFixesResult> handleEditGetFixes(
      plugin.EditGetFixesParams parameters) async {
    try {
      final analysisResult =
          await (driverForPath(parameters.file) as AnalysisDriver)
              .getResult(parameters.file);

      // Get errors and fixes for the file.
      final checkResult = checker.check(analysisResult.libraryElement);

      // Return any fixes that are for the expected file.
      final fixes = <plugin.AnalysisErrorFixes>[];
      for (final error in checkResult.keys) {
        if (error.location.file == parameters.file &&
            checkResult[error].change.edits.single.edits.isNotEmpty) {
          fixes.add(new plugin.AnalysisErrorFixes(error,
              fixes: [checkResult[error]]));
        }
      }

      return new plugin.EditGetFixesResult(fixes);
    } catch (e, stackTrace) {
      // Notify the analyzer that an exception happened.
      channel.sendNotification(new plugin.PluginErrorParams(
              false, e.toString(), stackTrace.toString())
          .toNotification());
      return new plugin.EditGetFixesResult([]);
    }
  }
}
