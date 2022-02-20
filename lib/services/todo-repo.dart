import 'package:flutter_todos/domain/todo.dart';

abstract class TodoRepoAbstract {
  Todo create(String name);

  List<Todo> getAll();

  void deleteOne(String name);

  void setDone(String name);
}

class TodoRepo extends TodoRepoAbstract {
  static final Map<String, Todo> _storage = {
    'Buy milk': Todo('Buy milk'),
    'Buy bread': Todo('Buy bread'),
    'Buy bread1': Todo('Buy bread1'),
  };

  @override
  Todo create(String name) {
    final Todo newOne = Todo(name);
    final Todo result = _storage.putIfAbsent(name, () => newOne);

    return result;
  }

  @override
  List<Todo> getAll() {
    return _storage.values.toList();
  }

  @override
  void deleteOne(String name) {
    _storage.remove(name);
  }

  @override
  void setDone(String name) {
    _storage[name]?.done = true;
  }
}
