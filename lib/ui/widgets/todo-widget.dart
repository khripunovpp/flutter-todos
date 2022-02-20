import 'package:flutter/material.dart';

import '../../domain/todo.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Item ${widget.todo.name}',
        style:
            const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600),
      ),
    );
  }
}
