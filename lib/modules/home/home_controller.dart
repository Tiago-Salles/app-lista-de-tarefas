import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Task> tasks = [];

class Task {
  String name;
  Task(this.name);
}

class TaskController extends GetxController {
  TextEditingController textcontroller = TextEditingController();

  void addTask() {
    tasks.add(Task(textcontroller.text));
    update();
    textcontroller.clear();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    update();
  }
}
