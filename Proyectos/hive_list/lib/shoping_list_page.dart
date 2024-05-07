import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './model.dart'; // Asume que el modelo está en model.dart

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});
  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  late TextEditingController _itemController;

  // TextEditingController _controller = TextEditingController();

  late Box<Item> _shoppingBox; // Nombre de la caja (representacion de la tabla)

  @override
  void initState() {
    super.initState();
    _itemController = TextEditingController();
    // Pone disponible la caja al iniciar el widget
    _shoppingBox = Hive.box<Item>('shoppingBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        title: const Text('Lista de Compras con Hive'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _itemController,
              decoration: const InputDecoration(
                  hintText: 'Introduce un producto',
                  fillColor: Colors.lightBlueAccent),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _shoppingBox.listenable(),
              builder: (context, Box<Item> itemsBox, _) {
                return ListView.builder(
                  itemCount: itemsBox.values.length,
                  itemBuilder: (context, index) {
                    final item = itemsBox.getAt(index);
                    return Card(
                        child: ListTile(
                      title: Text(item!.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          itemsBox.deleteAt(index);
                        },
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black)),
                      tileColor:const Color.fromARGB(255, 146, 191, 212),
                    ));
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_itemController.text.isNotEmpty) {
            final newItem = Item(_itemController.text);
            _shoppingBox.add(newItem);
            _itemController.clear();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    // Cierra la caja específica cuando el widget ya no es necesario
    _shoppingBox.close();
    super.dispose();
  }
}
