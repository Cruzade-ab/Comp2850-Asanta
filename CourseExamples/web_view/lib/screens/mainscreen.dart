import 'package:flutter/material.dart';
import 'package:web_view/screens/drink_page.dart';
import 'package:web_view/screens/food_page.dart';
import 'package:web_view/screens/dessert_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int indiceSeleccionado = 0;

  final List<Widget> _pantallas = [
    const FoodPage(),
    const DrinkPage(),
    const DessertPage()
  ];

  void cambiarPantalla(int indice) {
    setState(() {
      indiceSeleccionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[indiceSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceSeleccionado,
        onTap: cambiarPantalla,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Dessert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Drink',
          )
        ],
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.blue.shade400,
      ),
    );
  }
}
