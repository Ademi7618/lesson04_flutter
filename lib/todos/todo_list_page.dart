import 'package:flutter/material.dart';
import 'package:lesson04_flutter/todos/list_todo_model.dart';
import 'package:lesson04_flutter/todos/todo_bloc.dart';
import 'package:lesson04_flutter/todos/todo_detail_page.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  final TodoBloc bloc;

  const TodoListPage({super.key, required this.bloc});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: StreamBuilder<List<TodoModel>>(
        stream: widget.bloc.listStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final todos = snapshot.data!;
          if (todos.isEmpty) return const Center(child: Text('No todos'));

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.todo),
                subtitle: Text('Completed: ${todo.completed}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TodoDetailPage(bloc: widget.bloc, id: todo.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}