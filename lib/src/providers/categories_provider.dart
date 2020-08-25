import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:oso_app/src/models/categories_model.dart';

class CategoriasProvider {

  static String authority = '192.168.0.2:3000';

  Future<List<Categoria>> getAllCategorias() async {

    final url = Uri.http(authority, 'all_categories');
    try {
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final allCategories = new Categorias.fromJsonList(decodedData);
      return allCategories.items;
    } catch (err) {
      print(err.toString());
    }
    return null;
  }
}