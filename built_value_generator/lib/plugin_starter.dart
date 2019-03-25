import 'dart:isolate';

import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/starter.dart';
import 'package:built_value_generator/src/plugin/plugin.dart';

void start(List<String> args, SendPort sendPort) {
  new ServerPluginStarter(
          new BuiltValueAnalyzerPlugin(PhysicalResourceProvider.INSTANCE))
      .start(sendPort);
}
