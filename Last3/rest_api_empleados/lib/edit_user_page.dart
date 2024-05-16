import 'package:flutter/material.dart';
import 'api.dart';

class EditUserPage extends StatefulWidget {
  final Map<String, dynamic> user;
  EditUserPage({required this.user});
  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late BuildContext _context;
  @override
  void initState() {
    super.initState();
    _name = widget.user['name'];
    _email = widget.user['email'];
  }

  void updateUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final updatedUser = {'name': _name, 'email': _email};
      try {
        await Api.updateUser(widget.user['id'], updatedUser);
        popNavigator();
      } catch (e) {
        popupWindow();
      }
    }
  }

  void popNavigator() {
    Navigator.pop(_context);
  }

  void popupWindow() {
    ScaffoldMessenger.of(_context).showSnackBar(
      const SnackBar(content: Text('Error al actualizar usuario')),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
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
                initialValue: _email,
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
                onPressed: updateUser,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
