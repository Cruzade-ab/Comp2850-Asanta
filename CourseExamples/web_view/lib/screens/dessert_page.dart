import 'package:flutter/material.dart';

class DessertPage extends StatelessWidget {
  const DessertPage({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber.shade100,
      child: const Center(
        child: Text(
          'Dessert Page',
          style: TextStyle(
            fontSize: 34,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}