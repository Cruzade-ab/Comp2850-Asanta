import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api.dart';
import 'create_user_page.dart';
import 'edit_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API Tutorial',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
            color: Color(0xFF250C43),
            shadowColor: Color(0xFFB39DDB),
            elevation: 5,
            foregroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade500,
          background: Colors.white,
          error: Colors.red.shade100,
          onTertiary: Colors.blue,
        ),
      ),
      home: const UsersPage(),
    );
  }
}

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<dynamic> _users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final users = await Api.getUsers();
    setState(() {
      _users = users;
    });
  }

  void navigateToCreateUser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateUserPage()),
    );
  }

  void navigateToEditUser(Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
    );
  }

  void deleteUser(int id) async {
    try {
      await Api.deleteUser(id);
      fetchUsers(); 
    } catch (e) {
      popupWindow();
    }
  }

  void popupWindow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error al eliminar usuario')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empleados'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCreateUser,
        tooltip: 'Crear Usuario',
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 5,
            child: ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => navigateToEditUser(user),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteUser(user['id']),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
