// lib/image_view_page.dart
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final String imageUrl;
  const ImageViewPage({required this.imageUrl, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista Completa'),
         backgroundColor: const Color.fromARGB(255, 19, 133, 226),
        
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
