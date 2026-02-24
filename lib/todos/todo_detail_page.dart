import 'package:flutter/material.dart';
import 'package:lesson04_flutter/todos/list_todo_model.dart';
import 'package:lesson04_flutter/todos/todo_bloc.dart';

class TodoDetailPage extends StatefulWidget {
  final TodoBloc bloc;
  final int id;

  const TodoDetailPage({super.key, required this.bloc, required this.id});

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.fetchTodoById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Detail')),
      body: StreamBuilder<TodoModel>(
        stream: widget.bloc.detailStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final todo = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${todo.id}'),
                Text('Todo: ${todo.todo}'),
                Text('Completed: ${todo.completed}'),
                Text('User ID: ${todo.userId}'),
              ],
            ),
          );
        },
      ),
    );
  }
}