import 'package:equatable/equatable.dart';

class ListTodoModel extends Equatable {
  const ListTodoModel({required this.todos});
  final List<TodoModel> todos;

  @override
  List<Object?> get props => [];
}

class TodoModel extends Equatable {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  const TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      todo: json['todo'] ?? '',
      completed: json['completed'] ?? false,
      userId: json['userId'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, todo, completed, userId];
}