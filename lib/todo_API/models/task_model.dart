import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final bool completed;

  const TaskModel({
    required this.title,
    required this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      TaskModel(title: json['title'], completed: json['completed']);

  @override
  List<Object> get props => [title, completed];
}
