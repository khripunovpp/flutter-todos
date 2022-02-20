import 'package:flutter_todos/api/todos-state.dart';

Future<String> deleteTodo(String name) async {
  todosRepository.deleteOne(name);
  return name;
}
