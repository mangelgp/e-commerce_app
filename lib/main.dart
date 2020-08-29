import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oso_app/src/pages/products_by_category_page.dart';
import 'package:oso_app/src/pages/det_product_page.dart';
import 'package:oso_app/src/pages/home_page.dart';
import 'package:oso_app/src/providers/user_preferences.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load('.env');
  final userPrefs = new UserPreferences();
  await userPrefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oso App',
      initialRoute: '/',
      routes: {
        '/'           : (BuildContext context) => HomePage(),
        'products'    : (BuildContext context) => ProductsByCategoryPage(),
        'detProduct'  : (BuildContext context) => DetProductPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.red
      ),
    );
  }
}