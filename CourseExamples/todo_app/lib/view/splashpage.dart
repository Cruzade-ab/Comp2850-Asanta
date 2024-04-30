import 'package:flutter/material.dart';

import '../components/page_title.dart';
import '../components/shape.dart';
import './task_list_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Shape(),
            const SizedBox(
              height: 73,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskListPage()),
                );
              },
              child: Image.asset(
                'assets/images/image-1.png',
                width: 180,
                height: 168,
              ),
            ),
            const SizedBox(
              height: 99,
            ),
            const PageTitle(
              'Lista de Tareas',
              // color: Theme.of(context).textTheme.titleSmall?.color,
            ),
            const SizedBox(
              height: 21,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}