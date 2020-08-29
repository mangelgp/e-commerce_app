import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:oso_app/src/models/product_model.dart';
import 'package:oso_app/src/models/products_model.dart';
import 'package:oso_app/src/providers/user_preferences.dart';

class ProductsProvider {

  static String authority = DotEnv().env['OSO_BASE_URL'];
  static String apiKey = DotEnv().env['OSO_API_KEY'];
  final prefs = new UserPreferences();

  int _productPage = 0;
  bool _loadingPage = false;
  List<Product> _productos = new List();

  final _productsStreamController = StreamController<List<Product>>.broadcast();
  Function(List<Product>) get productsSink => _productsStreamController.sink.add;
  Stream<List<Product>> get productsStream => _productsStreamController.stream;

  void disposeStreams() {
    _productsStreamController?.close();
  }

  Future<List<Product>> getProducts() async {

    if (_loadingPage) return [];
    _loadingPage = true;
    _productPage++;
    print("page: $_productPage");

    final url = Uri.http(ProductsProvider.authority, 'api/categories/${prefs.idCategoria}/products',{
      'api_key': ProductsProvider.apiKey,
      'page': _productPage.toString(),
      'rows': '20'
    });

    final resp = await _procesarResp(url);
    _productos.addAll(resp);
    productsSink(_productos);
    _loadingPage = false;
    return resp;
  }

  Future<List<Product>> _procesarResp(Uri url) async {
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

  Future<List<Product>> getAllProducts() async {

    final url = Uri.http(ProductsProvider.authority, 'api/products', {
      'api_key': ProductsProvider.apiKey,
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

  Future<List<Product>> getAllProductsByCategoryID(String id) async {

    final url = Uri.http(authority, 'api/categories/$id/products',{
      'api_key': ProductsProvider.apiKey,
      'page': '1',
      'rows': '20'
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
    
    final url = Uri.http(authority, 'api/products/$id', {
      'api_key': ProductsProvider.apiKey
    });

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
