import 'package:dart_dev/dart_dev.dart';
import 'package:dart_dev_workiva/dart_dev_workiva.dart';

final Map<String, DevTool> config = {
  ...workivaConfig,
  'serve': WebdevProxyServeTool()
    ..webdevArgs = ['web']
    ..buildArgs = ['--delete-conflicting-outputs'],
  'test': WorkivaTestTool()..buildArgs = ['--delete-conflicting-outputs'],
  'format': FormatTool()..organizeDirectives = true,
};
