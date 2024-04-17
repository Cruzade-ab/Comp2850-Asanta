import 'package:flutter/material.dart';

class PageTittle extends StatelessWidget {
  const PageTittle(this.text, {super.key, required this.color});
  //
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
