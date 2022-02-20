import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_todos/ui/pages/home/home-page.dart';
import 'package:flutter_todos/ui/widgets/todo-widget.dart';

import 'api/add-todo.dart';
import 'api/fetch-todos.dart';
import 'domain/todo.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.

      },

    );
  }
}
