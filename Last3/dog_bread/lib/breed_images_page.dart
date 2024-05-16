import 'package:flutter/material.dart';
import 'api.dart';
import 'image_view_page.dart';

class BreedImagesPage extends StatefulWidget {
  final String breed;
  const BreedImagesPage({required this.breed, super.key});
  @override
  State<BreedImagesPage> createState() => _BreedImagesPageState();
}

class _BreedImagesPageState extends State<BreedImagesPage> {
  List<String>? _images;
  bool _loading = true;
  String? _error;
  @override
  void initState() {
    super.initState();
    _fetchBreedImages();
  }

  void _fetchBreedImages() async {
    try {
      final images = await Api.getBreedImages(widget.breed);
      setState(() {
        _images = images;
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
        title: Text('Imágenes de ${widget.breed}'),
         backgroundColor: const Color.fromARGB(255, 19, 133, 226),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,

                  ),
                  itemCount: _images?.length ?? 0,
                  itemBuilder: (context, index) {
                    final imageUrl = _images![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImageViewPage(imageUrl: imageUrl),
                          ),
                        );
                      },
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        
                      ),
                    );
                  },
                ),
    );
  }
}
