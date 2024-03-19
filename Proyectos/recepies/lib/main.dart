import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: InitialPage(),
  ));
}

class InitialPage extends StatelessWidget {
  const InitialPage({super.key})

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
  
  }
