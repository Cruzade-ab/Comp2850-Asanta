import 'package:flutter/material.dart';

class PageTittle extends StatelessWidget {
  const PageTittle( {super.key, required this.color});
  // this.text,
  // final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Lista De Tareas',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
