import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../api/add-todo.dart';
import '../../../api/fetch-todos.dart';
import '../../../domain/todo.dart';
import '../../widgets/todo-widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<List<Todo>> _todos$ = fetchTodos();

  void add({String? name}) async {
    int random = Random().nextInt(100);
    Todo created = await addTodo('TEST $random');
    print('Creates' + created.name);
    refetchTodos();
  }

  void refetchTodos() {
    setState(() => _todos$ = fetchTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOs'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<List<Todo>>(
              stream: _todos$,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                List<Todo> list = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (BuildContext context, int index) {
                    Todo todo = snapshot.data![index];
                    return TodoWidget(todo: todo);
                  },
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => add(),
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.amber,
        ),
      ),
    );
  }
}
