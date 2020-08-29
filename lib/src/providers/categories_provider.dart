import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:oso_app/src/models/categories_model.dart';

class CategoriasProvider {

  static String authority = DotEnv().env['OSO_BASE_URL'];
  static String apiKey = DotEnv().env['OSO_API_KEY'];

  Future<List<Categoria>> getAllCategorias() async {

    final url = Uri.http(authority, 'api/categories', {
      'api_key': apiKey
    });

    try {
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final allCategories = new Categorias.fromJsonList(decodedData['data']);
      return allCategories.items;
    } catch (err) {
      print(err.toString());
    }
    return null;
  }
}