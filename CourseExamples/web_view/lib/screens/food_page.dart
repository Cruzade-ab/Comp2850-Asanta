import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber.shade100,
      child: const Center(
        child: Text(
          'Food Page',
          style: TextStyle(
            fontSize: 34,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}