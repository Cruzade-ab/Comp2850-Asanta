import 'package:flutter/material.dart';
import 'package:web_view/screens/mainscreen.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Center(
              child: Text("Santa's Recepies"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                child: const Text('Recepies'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
