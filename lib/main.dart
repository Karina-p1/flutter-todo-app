import 'package:flutter/material.dart';
import 'package:get/get.dart';
import  'pages/task_list_page.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'pages/todo_add_page.dart';

void main() {
  runApp(const MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TodoController()); // Inject the controller globally using GetX

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // App theme color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      home: TodoAddPage(), // Starting page
    );
  }
}