import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy_task3/todo_API/services/api_constant.dart';
import 'package:flutter_academy_task3/todo_API/services/dio_helper.dart';
import '../../models/task_model.dart';
import '../widgets/build_task_item.dart';

enum ApiState { loading, error, susscess }

class ApiTodoApp extends StatefulWidget {
  const ApiTodoApp({Key? key}) : super(key: key);

  @override
  State<ApiTodoApp> createState() => _ApiTodoAppState();
}

class _ApiTodoAppState extends State<ApiTodoApp> {
  List<TaskModel> tasks = [];
  ApiState currentState = ApiState.loading;

  void getTasks() async {
    try {
      var result =
          await DioHelper.getData(endPoint: ApiConstant.getTaskEndPoint);
      currentState = ApiState.susscess;
      tasks = List.from(
          (result.data as List).map((element) => TaskModel.fromJson(element)));
    } on DioError catch (e) {
      currentState = ApiState.error;
      print(e.toString());
    }
    setState(() {});
    print(currentState);
  }

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.orange,
        title: Text("Class c"),
      ),
      body: currentState == ApiState.loading
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey.shade800,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) => BuildTaskItem(
                model: tasks[index],
              ),
              separatorBuilder: (context, index) => Container(),
              itemCount: tasks.length,
            ),
    );
  }
}
