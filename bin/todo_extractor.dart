// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:todo_extractor/file_creator.dart';
import 'package:todo_extractor/files_extractor.dart';
import 'package:todo_extractor/model/todo.dart';
import 'package:todo_extractor/todo_fetcher.dart';

void main(List<String> args) async {
  print('| TODO_EXTRACTOR v0.0.1\n|');
  final argParser = ArgParser();
  argParser.addMultiOption('sources', abbr: 's', callback: (sources) => print('| Sourse: $sources'));
  argParser.addOption('output', abbr: 'o', callback: (output) => print('| Output: $output'));

  final argsResult = argParser.parse(args);

  final sources = argsResult['sources'] as Iterable<String>;
  final output = argsResult['output'] as String? ?? 'todos.text';

  print('|\n| 🧐 Collecting data...');

  final files = extractDartFilesFromFolders(sources);

  final todos = <Todo>[];

  for (final source in files) {
    todos.addAll(await todoFetch(File.fromUri(Uri(path: source as String))));
  }

  await createFileAndWriteData(todos, output);
}
