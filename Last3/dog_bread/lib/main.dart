import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'breed_images_page.dart';
import 'api.dart';

void main() {
  runApp(const DogBreedsApp());
}

class DogBreedsApp extends StatelessWidget {
  const DogBreedsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razas de Perros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      home: const BreedsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BreedsPage extends StatefulWidget {
  const BreedsPage({super.key});
  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  Map<String, dynamic>? _breeds;
  bool _loading = true;
  String? _error;
  @override
  void initState() {
    super.initState();
    _fetchBreeds();
  }

  void _fetchBreeds() async {
    try {
      final breeds = await Api.getBreeds();
      setState(() {
        _breeds = breeds;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razas de Perros'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 19, 133, 226),
      ),
      body: Column(
        children: [
        const SizedBox(height: 10,),
        const Text("Lista de Razas",),
        const SizedBox(height: 20,),
        Expanded(child:  _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              :  GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              childAspectRatio: 2,
            ),
            itemCount: _breeds?.keys.length ?? 0,
            itemBuilder: (context, index) {
              final breed = _breeds!.keys.elementAt(index);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreedImagesPage(breed: breed),
                    ),
                  );
                },
                child: Card(
                  child: Center(child: Text(breed)),
                ),
              );
            },
          ),)
      ],)
    );
  }
}
