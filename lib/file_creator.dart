// ignore_for_file: avoid_print

import 'dart:io';

import 'package:todo_extractor/model/todo.dart';
import 'package:todo_extractor/utils/date_formatter.dart';

Future<void> createFileAndWriteData(List<Todo> todos, String fileName) async {
  final isMD = fileName.split('.').last == 'md';

  try {
    var forWriting = '';

    if (isMD) {
      forWriting += '#TODO list\n';

      forWriting += '*${formattedDate()}*\n\n';
    }

    for (final todo in todos) {
      forWriting += todo.prepared(isMD);
    }

    final file = File(fileName);
    final sink = file.openWrite()..write(forWriting);
    await sink.flush();
    await sink.close();
    print('|\n| ✔️ Data collection completed successfully.');
  } catch (e) {
    print('|\n| ❌ Data collection failed');
    rethrow;
  }
}
