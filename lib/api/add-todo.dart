import 'package:flutter_todos/api/todos-state.dart';

import '../domain/todo.dart';

Future<Todo> addTodo(String name) async {
  return todosRepository.create(name);
}
