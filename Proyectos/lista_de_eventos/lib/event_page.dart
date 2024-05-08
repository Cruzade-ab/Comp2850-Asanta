import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'add_events_page.dart';
import './models/event.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});
  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Box<Event> _eventsBox;
  @override
  void initState() {
    super.initState();
    _eventsBox = Hive.box<Event>('eventsBox');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eventos Importantes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:
            Theme.of(context).primaryColor, // Usa el color primario del tema
      ),
      body: ValueListenableBuilder(
        valueListenable: _eventsBox.listenable(),
        builder: (context, Box box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text("No hay eventos guardados"));
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                final Event event = box.getAt(index);
                return Card(
                  color: Theme.of(context)
                      .primaryColor, // Usa el color primario del tema
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: ListTile(
                    title: Text(
                      event.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      DateFormat('yyyy-MM-dd').format(event.date),
                      style: const TextStyle(color: Colors.white54),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.indigoAccent),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddEditEventPage(
                                        event: event, index: index)))),
                        IconButton(
                          icon:
                              const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => box.deleteAt(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEditEventPage()),
        ),
        backgroundColor:
            Theme.of(context).primaryColor, // Usa el color de acento del tema
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
