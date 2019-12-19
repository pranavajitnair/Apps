import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked ;
  final String taskTitle;
  final Function checkboxCallback,longPressCallback;

  TaskTile(this.taskTitle,this.isChecked,this.checkboxCallback,this.longPressCallback);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      contentPadding: EdgeInsets.only(left: 30.0,right: 30),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
        value: isChecked,
      ),
      title: Text(
          taskTitle,
        style: TextStyle(
          decoration: isChecked? TextDecoration.lineThrough:null,
        ),
      ),
    );
  }
}