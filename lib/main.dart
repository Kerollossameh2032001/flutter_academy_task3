import 'package:flutter/material.dart';
import 'package:flutter_academy_task3/todo_API/models/task_model.dart';
import 'package:flutter_academy_task3/todo_API/presentation/screen/api_todo_app.dart';
import 'package:flutter_academy_task3/todo_API/services/api_constant.dart';
import 'package:flutter_academy_task3/todo_API/services/dio_helper.dart';

void main() async {
  DioHelper.init();
  /*var result = await DioHelper.getData(endPoint: ApiConstant.getTaskEndPoint);
  List<TaskModel> tasks = List<TaskModel>.from((result.data as List).map(
          (e) => TaskModel.fromJson(e)));
  print(tasks);*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiTodoApp(),
    );
  }
}


