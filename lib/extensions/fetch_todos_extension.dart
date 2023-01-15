import 'package:todo_extractor/model/todo.dart';

extension TodoDiscoverer on Future<List<String>> {
  Future<List<Todo>> fetchTodos(String fileName) async {
    final todos = <Todo>[];
    final iterableElements = await this;

    for (final element in iterableElements) {
      if (element.contains('//')) {
        if (element.contains('TODO')) {
          final todo = Todo(fileName: fileName);

          todo.content = element.trim().substring(2).trim();
          todo.content = todo.content?.substring(5);

          todo.line = (iterableElements.indexOf(element) + 1).toString();

          final isLast = iterableElements.indexOf(element) == iterableElements.length - 1;

          if (!isLast) {
            var index = iterableElements.indexOf(element) + 1;

            while (iterableElements[index].contains('//')) {
              todo.addContent(iterableElements[index].trim().substring(2).trim());
              index++;
            }
          }
          if (todo.content != null) todos.add(todo);
        }
      }
    }
    return todos;
  }
}
