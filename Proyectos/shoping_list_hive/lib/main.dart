import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
 @override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Lista de Compras con Hive',
theme: ThemeData(primarySwatch: Colors.blue),
// home: ShoppingListPage(),
);
}
}