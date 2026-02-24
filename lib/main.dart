import 'package:flutter/material.dart';
import 'package:lesson04_flutter/todos/todo_bloc.dart';
import 'package:lesson04_flutter/todos/todo_list_page.dart';

void main() {
  final bloc = TodoBloc();
  runApp(MyApp(bloc: bloc));
}

class MyApp extends StatelessWidget {
  final TodoBloc bloc;

  const MyApp({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListPage(bloc: bloc),
    );
  }
}