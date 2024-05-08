import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import './models/event.dart';

class AddEditEventPage extends StatefulWidget {
  final Event? event;
  final int? index;
  const AddEditEventPage({this.event, this.index, super.key});

  @override
  State<AddEditEventPage> createState() => _AddEditEventPageState();
}

class _AddEditEventPageState extends State<AddEditEventPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _noteController;
  late DateTime _eventDate;
  late Box<Event> _eventBox; // Nombre para la caja (representacion de la tabla)

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.event?.name ?? '');
    _noteController = TextEditingController(text: widget.event?.note ?? '');
    _eventDate = widget.event?.date ?? DateTime.now();
    _eventBox = Hive.box('eventsBox');
  }

  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    _context = context; // Guardar el contexto en una variable de instancia
    return Scaffold(
      appBar: AppBar(
          title:
              Text(widget.event == null ? 'Añadir Evento' : 'Editar Evento')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre del Evento'),
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
            ),
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(labelText: 'Nota'),
            ),
            ListTile(
              title: Text(
                  'Fecha del Evento: ${DateFormat('yyyy-MM-dd').format(_eventDate)}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _eventDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null && picked != _eventDate) {
                  setState(() {
                    _eventDate = picked;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveForm() {
    print('Save Form');
    if (_formKey.currentState!.validate()) {
      print('Creating object');
      final newEvent = Event(
        name: _nameController.text,
        date: _eventDate,
        note: _noteController.text,
      );
      try {
        if (widget.index == null) {
          _eventBox.add(newEvent);
        } else {
          _eventBox.putAt(widget.index!, newEvent);
        }
      } catch (e) {
        print('Error saving event: $e');
      }
      Navigator.pop(_context!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    super.dispose();
    print("Dispose has been called");
  }
}
