import 'package:flutter/material.dart';
import 'api.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});
  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  late BuildContext _context;
  void createUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final user = {'name': _name, 'email': _email};
      try {
        await Api.createUser(user);
        Navigator.pop(_context);
      } catch (e) {
        ScaffoldMessenger.of(_context).showSnackBar(
          const SnackBar(content: Text('Error al crear usuario')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value ?? '';
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un correo electrónico';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: createUser,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
