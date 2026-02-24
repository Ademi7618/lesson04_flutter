import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lesson04_flutter/todos/list_todo_model.dart';

class TodoBloc {
  final _listController = StreamController<List<TodoModel>>.broadcast();
  final _detailController = StreamController<TodoModel>.broadcast();

  Stream<List<TodoModel>> get listStream => _listController.stream;
  Stream<TodoModel> get detailStream => _detailController.stream;

  Future<void> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final todos = (data['todos'] as List)
            .map((e) => TodoModel.fromJson(e))
            .toList();
        _listController.add(todos);
      } else {
        _listController.add([]);
      }
    } catch (e) {
      _listController.add([]);
    }
  }

  Future<void> fetchTodoById(int id) async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/todos/$id'));
      if (response.statusCode == 200) {
        final todo = TodoModel.fromJson(jsonDecode(response.body));
        _detailController.add(todo);
      }
    } catch (e) {}
  }

  void dispose() {
    _listController.close();
    _detailController.close();
  }
}