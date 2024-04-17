import 'package:flutter/material.dart';
import 'package:todo_app/components/page_title.dart';
import 'package:todo_app/components/shape.dart';
import 'package:todo_app/components/task_list_page.dart';

class SplashPage extends StatelessWidget {
  final Color titleColor;

  const SplashPage( this.titleColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // MainAxisAlignment Start- Para Inicializar el contenido desde el Comienzo de la pantalla
          // Si se selecciona 'center', el contenido se centraliza, si no ocupa todo el espacio ocurre el effecto del gap al inicio
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Shape(),
            const SizedBox(height: 73),
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
                height: 169,
              ),
            ),
            const SizedBox(
              height: 99,
            ),
            PageTittle('Lista de Tareas',color: titleColor),
            const SizedBox(
              height: 21,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'La mejor forma para que no se te olvide nada es anotarlo, Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
