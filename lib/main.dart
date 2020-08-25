import 'package:flutter/material.dart';
import 'package:oso_app/src/pages/all_products_list.dart';
import 'package:oso_app/src/pages/det_product_page.dart';
import 'package:oso_app/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oso App',
      initialRoute: '/',
      routes: {
        '/'           : (BuildContext context) => HomePage(),
        'products'    : (BuildContext context) => AllProductsPage(),
        'detProduct'  : (BuildContext context) => DetProductPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.indigo
      ),
    );
  }
}