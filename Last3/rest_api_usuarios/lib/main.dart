import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empleados'),
        centerTitle: true,
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
          ));
        },
      ),
    );
  }
}
