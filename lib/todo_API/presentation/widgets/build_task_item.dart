import 'package:flutter/material.dart';
import 'package:flutter_academy_task3/todo_API/models/task_model.dart';

class BuildTaskItem extends StatelessWidget {
  final TaskModel model;
  const BuildTaskItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      title: Text(model.title,style: TextStyle(fontSize: 25),),
      trailing: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.green,
        value: model.completed,
        onChanged:(bool? val){} ,
      ),
    );
  }
}
