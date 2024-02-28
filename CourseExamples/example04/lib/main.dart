import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Example 4',
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'Hello world!!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32,
                ),
              ),
              Icon(
                Icons.settings,
                color: Colors.orange.shade400,
                size: 78,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print('Clicked');
          },
        ),
      ),
    ),
  );
}