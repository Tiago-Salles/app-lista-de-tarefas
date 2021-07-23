import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';

class ListViewTaskHome extends StatelessWidget {
  final taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "YourTime",
          style: TextStyle(
            fontSize: 37,
            fontWeight: FontWeight.w800,
            color: Colors.amber[700],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10, bottom: 3, top: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigoAccent),
            child: Center(
              child: IconButton(
                onPressed: () {
                  taskController.addTask();
                },
                icon: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                controller: taskController.textcontroller,
                decoration: InputDecoration(hintText: "Digite uma nova tarefa"),
              ),
            ),
            Container(
              child: Expanded(
                child: GetBuilder<TaskController>(
                  builder: (_) => ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext contex, int index) {
                      Task _task = tasks[index];

                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          title: Text(
                            "${_task.name}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigoAccent,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              taskController.removeTask(index);
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
