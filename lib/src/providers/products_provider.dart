import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:oso_app/src/models/products_model.dart';

class ProductsProvider {

  static String authority = '192.168.0.2:3000';

  Future<List<Product>> getAllProducts() async {

    final url = Uri.http(authority, 'all_products');
    try {
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final allProducts = new Products.fromJsonList(decodedData);
      print(decodedData);
      return allProducts.items;
    } catch (err) {
      print(err.toString());
    }
    return null;
  }
}
