import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder : (context,taskData,child){
        return ListView.builder(itemBuilder: (context,index){
          return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback : (bool checkboxState){
                    taskData.updateTask(taskData.tasks[index]);

              },
              longPressCallback : (){
                taskData.deleteTask(taskData.tasks[index]);
          }
          );
        },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}