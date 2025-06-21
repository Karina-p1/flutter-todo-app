import 'package:get/get.dart';

class TodoController extends GetxController {
  // Observable reactive lists to track tasks and their completion status
  var tasks = <String>[].obs;
  var completedTasks = <bool>[].obs;

  // Adds a new task and default 'not completed'
  void addTask(String task) {
    if (task.trim().isNotEmpty) {
      tasks.add(task);
      completedTasks.add(false);
      Get.snackbar('Success', 'Task added successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Task cannot be empty',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Deletes task at given index
  void deleteTask(int index) {
    tasks.removeAt(index);
    completedTasks.removeAt(index);
    Get.snackbar('Deleted', 'Task deleted!',
        snackPosition: SnackPosition.BOTTOM);
  }

  // Toggles task completion status
  void toggleDone(int index) {
    completedTasks[index] = !completedTasks[index];
  }
}
