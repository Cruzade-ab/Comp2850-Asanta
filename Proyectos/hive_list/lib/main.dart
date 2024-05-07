import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './model.dart';
import './shoping_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter()); // Adapter del modelo
  await Hive.openBox<Item>("shoppingBox"); // Clase del modelo
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras con Hive',
      theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: const Color.fromARGB(255, 224, 216, 216)),
      home: const ShoppingListPage(),
    );
  }
}
