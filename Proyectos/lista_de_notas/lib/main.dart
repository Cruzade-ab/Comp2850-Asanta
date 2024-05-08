import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/note.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// final appDirectory = await
  getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>("notesBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas',
      theme: ThemeData(
        textTheme: GoogleFonts.pacificoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _noteController = TextEditingController();
  late Box<Note> _notesBox;

  void _addNote(Note note) async {
    final DateTime now = DateTime.now();
    final String timestamp = now.toIso8601String();
    await _notesBox.put(timestamp, note);
  }

  @override
  void initState() {
    super.initState();
    _notesBox = Hive.box<Note>('notesBox');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Sistema de Notas',
      //     style: TextStyle(),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,

      // ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/NoteBook2.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 65,
              ),
              const Padding(
                padding: EdgeInsets.all(0),
                child: Text('Notas Diarias', style: TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 24,
  ),)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _noteController,
                  decoration: const InputDecoration(
                    labelText: 'Write a Note',
                    icon: Icon(Icons.create_outlined),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _notesBox.listenable(),
                  builder: (context, box, _) {
                    // if (box.values.isEmpty) {
                    //   return const Center(
                    //     child: Text("No hay notas aún"),
                    //   );
                    // }
                    return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        Note note = box.getAt(index) as Note;
                        return ListTile(
                          title: Text(note.title),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              box.deleteAt(index);
                            },
                          ),
                          onTap: () {
                            // Para futuras operaciones como editar
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Note note = Note(
            _noteController.text,
            'Descripción (puedes expandir esto)',
          );
          _addNote(note);
          _noteController.clear();
        },
      ),
    );
  }
}
