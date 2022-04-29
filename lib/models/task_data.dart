import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List <Task> _tasks = [
    Task(name: 'Something1'),
    Task(name: 'Something2'),
    Task(name: 'Something3'),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTask){
    final task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}