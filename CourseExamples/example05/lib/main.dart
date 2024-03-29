import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: DefaultTabController(
        initialIndex: 2,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Example 5',
              ),
            ),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text('Backup',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
                Tab(
                  icon: Icon(Icons.access_alarm),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Image.network(
                    "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg"),
              ),
              const Center(
                  child: Column(
                    children: [
                    Text("It's rainy here"),
                    Text("It's rainy here"),
                    Text("It's rainy here"),
                    ],
                  ),
              ),
              const Center(
                child: Text("It's sunny here"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}