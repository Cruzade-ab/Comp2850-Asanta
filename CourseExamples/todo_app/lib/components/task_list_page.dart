import 'package:flutter/material.dart';
import 'package:todo_app/components/shape.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPage();
}

class _TaskListPage extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Shape(),
          Image.asset(
            'assets/images/tasks-list-image.png',
            width: 120,
            height: 120,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Hello');
         
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
