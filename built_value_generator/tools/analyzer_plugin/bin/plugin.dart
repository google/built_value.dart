import 'dart:isolate';

import 'package:built_value_analyzer_plugin/plugin_starter.dart';

void main(List<String> args, SendPort sendPort) {
  start(args, sendPort);
}
