// ignore_for_file: avoid_print

import 'dart:io';

import 'package:todo_extractor/model/todo.dart';
import 'package:todo_extractor/utils/date_formatter.dart';

/// Creates a file named from output and fills it with TODO.
/// If the file extension `.md`, then performs additional formatting
Future<void> createFileAndWriteData(List<Todo> todos, String fileName) async {
  final isMD = fileName.split('.').last == 'md';

  try {
    var forWriting = '';

    if (isMD) {
      forWriting += '# TODO list\n\n';

      forWriting += '*${formattedDate()}*\n\n';

      forWriting += '| FILE:LINE | TODO |\n';

      forWriting += '|---------- | ---- |\n';
    }

    for (final todo in todos) {
      forWriting += todo.prepared(isMD);
    }

    final file = File(fileName);
    final sink = file.openWrite()..write(forWriting);
    await sink.flush();
    await sink.close();
    print('|\n| ✔️\tData collection completed successfully.');
  } catch (e) {
    print('|\n| ❌\tData collection failed');
    rethrow;
  }
}
