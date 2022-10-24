import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  var appGenerated = context.logger.progress('Generating flutter getx-template app');
  try {
    await _generateApp(context);
    appGenerated('Flutter GetX Template App generation Successful');
  } catch (e) {
    context.logger.err('Generation failed');
  }
}

Future<ProcessResult> _generateApp(HookContext context) async {
  context.logger.info('Running flutter create...');
  final description = context.vars['description'];
  final organization = context.vars['organization'];
  return Process.run('flutter', [
    'create',
    '{{name}}',
    '--description',
    '$description',
    '--org',
    '$organization'
  ]);
}