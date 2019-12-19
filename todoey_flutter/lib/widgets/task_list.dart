import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                taskData.tasks[index].name,
                taskData.tasks[index].isDone,
                (bool checkboxState) {
                      taskData.updateTask(taskData.tasks[index]);
                },(){
                      taskData.deleteTask(taskData.tasks[index]);
            });
          },
          itemCount: taskData.taskCount(),
        );
      },
    );
  }
}
