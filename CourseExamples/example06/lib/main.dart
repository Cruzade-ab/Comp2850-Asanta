import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurpleAccent.shade700,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.purple,
            fontSize: 32,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Example 6',
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('Bottom Navigation Bar'),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('Second Text in Page'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.deepPurple.shade50,
                child: const Center(
                  child: Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    'Expanded and Container',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade900,
                      Colors.deepPurple.shade50,
                    ],
                  ),
                ),
                child: const Center(
                    child: Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        'Last Text in Page')),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white30,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
        ),
      ),
    ),
  );
}