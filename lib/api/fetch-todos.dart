import 'package:flutter_todos/api/todos-state.dart';

import '../domain/todo.dart';

Stream<List<Todo>> fetchTodos() async* {
  yield todosRepository.getAll();
}
