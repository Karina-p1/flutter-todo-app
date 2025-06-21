import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'task_list_page.dart';

class TodoAddPage extends StatelessWidget {
  final TodoController todoController = Get.find(); // Access controller
  final TextEditingController taskInputController = TextEditingController(); // For TextField input

  TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New To-Do Task")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Input box to type new task
            TextField(
              controller: taskInputController,
              decoration: const InputDecoration(
                labelText: "Enter a new task",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Add Task button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  todoController.addTask(taskInputController.text);
                  taskInputController.clear(); // Clear input field
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  shadowColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: const Text("Add Task", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 20),

            // View All Tasks button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => TaskListPage()), // Navigate to task list page
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
                child: const Text("View All Tasks", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}