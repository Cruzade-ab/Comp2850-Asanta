import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState()
}

class _MyAppState extends State<MyApp>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(body: portadaImage(),);
  }

  Widget portadaImage () => Container(
    color: Colors.grey,
    child: AssetImage(),
  )
}

