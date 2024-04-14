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
          Container(
            height: 291,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 31, 170, 158)),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Shape(),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tasks-list-image.png',
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 13), 
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Completa tus tareas',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
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
