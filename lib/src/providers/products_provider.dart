import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:oso_app/src/models/product_model.dart';
import 'package:oso_app/src/models/products_model.dart';

class ProductsProvider {

  static String authority = '192.168.0.2:8001';

  Future<List<Product>> getAllProducts() async {

    final url = Uri.http(authority, 'api/products');
    try {
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final allProducts = new Products.fromJsonList(decodedData['data']);
      print(decodedData['data']);
      return allProducts.items;
    } catch (err) {
      print(err.toString());
      print('error');
    }
    return null;
  }

  Future<List<Product>> getAllProductsByCategoryID(String id) async {

    final url = Uri.http(authority, 'api/categories/$id/products',{
      'page': '1',
      'rows': '10'
    });
    
    try {
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final allProducts = new Products.fromJsonList(decodedData['data']);
      print(decodedData['data']);
      return allProducts.items;
    } catch (err) {
      print(err.toString());
      print('error');
    }
    return null;
  }

  Future<Product> getProductById(String id) async {
    
    final url = Uri.http(authority, 'api/products/$id');
    try {
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final product = new Product.fromJsonMap(decodedData['data']);
      print(decodedData['data']);
      return product;
    } catch (err) {
      print(err.toString());
    }
    return null;
  }
}
