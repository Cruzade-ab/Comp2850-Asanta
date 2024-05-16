import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://dog.ceo/api';
// Obtener la lista de razas
  static Future<Map<String, dynamic>> getBreeds() async {
    final response = await http.get(Uri.parse('$_baseUrl/breeds/list/all'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception('Error al obtener lista de razas');
    }
  }

// Obtener imágenes aleatorias de una raza específica
  static Future<List<String>> getBreedImages(String breed) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/breed/$breed/images/random/10'));
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body)['message']);
    } else {
      throw Exception('Error al obtener imágenes para la raza $breed');
    }
  }
}
