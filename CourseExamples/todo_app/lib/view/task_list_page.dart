import 'package:flutter/material.dart';
import 'package:todo_app/components/page_title.dart';
import 'package:todo_app/models/task.dart';
import '../components/shape.dart';

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
            Expanded(
              flex: 2,
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    const Shape(),
                    Image.asset(
                      'assets/images/tasks-list-image.png',
                      width: 120,
                      height: 120,
                    ),
                    PageTitle(
                      'Completa tus tareas',
                      color: Theme.of(context).colorScheme.background,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                const Text('Tareas'),
                Expanded(
                    child: ListView.separated(
                  itemCount: taskList.length,
                  separatorBuilder: (context, index) => (const SizedBox(
                    height: 10,
                  )),
                  itemBuilder: (context, index) => Text(taskList[index].tittle),
                ))
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showNewTaskModal( BuildContext context) {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _NewModalTask();
      });
  }
}

class _NewModalTask extends StatelessWidget {
  const _NewModalTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const PageTitle('Nueva Tarea'),
        const SizedBox(height: 26,),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))
          ),
        ),
        const SizedBox(height: 26,),
        ElevatedButton(
          onPressed: () {}, 
          style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>( Color(0xFF40B7AD))
        ), child: const Text('Guardar'))
      ],
    ),);
  }
}

final taskList = <Task>[
  Task('Estudiar para el examen'),
  Task('Estudiar para el examen'),
  Task('Estudiar para el examen'),
];

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: const Icon(Icons.check_box_outlined),
        title: Text(task.tittle),
      ),
    );
  }
}
