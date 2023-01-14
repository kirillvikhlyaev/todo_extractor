import 'dart:io';

import 'package:todo_extractor/extensions/fetch_todos_extension.dart';
import 'package:todo_extractor/model/todo.dart';


Future<List<Todo>> todoFetch(File file) async {
  return file.readAsLines().fetchTodos(file.path);
}
