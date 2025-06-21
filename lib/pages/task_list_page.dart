import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';

class TaskListPage extends StatelessWidget {
  final TodoController controller = Get.find(); // Get the same controller instance

  TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My To-Do List")),
      body: Obx(() {
        // If no tasks yet
        if (controller.tasks.isEmpty) {
          return const Center(child: Text("No tasks added yet!"));
        }

        // Build list of tasks dynamically
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Checkbox(
                value: controller.completedTasks[index],
                onChanged: (_) => controller.toggleDone(index), // Toggle completion
              ),
              title: Text(
                controller.tasks[index],
                style: TextStyle(
                  decoration: controller.completedTasks[index]
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Show confirmation dialog before delete
                  Get.defaultDialog(
                    title: "Confirm Delete",
                    middleText: "Are you sure you want to delete this task?",
                    textConfirm: "Yes",
                    textCancel: "No",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.deleteTask(index);
                      Get.back(); // Close the dialog
                    },
                    onCancel: () {},
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}