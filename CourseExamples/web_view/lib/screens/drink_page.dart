import 'package:flutter/material.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber.shade100,
      child: const Center(
        child: Text(
          'Drink Page',
          style: TextStyle(
            fontSize: 34,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}