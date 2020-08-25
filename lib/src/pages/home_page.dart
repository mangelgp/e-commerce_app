import 'package:flutter/material.dart';
import 'package:oso_app/src/components/list_categories.dart';
import 'package:oso_app/src/components/my_drawer.dart';
import 'package:oso_app/src/components/search_delegate.dart';
import 'package:oso_app/src/constants/constants.dart';
import 'package:oso_app/src/providers/categories_provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoriesProvider = CategoriasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildAllCategories(),
      drawer: MyDrawer(),
    );
  }

  Widget _buildAllCategories() {
    return Container(
      child: FutureBuilder(
        future: categoriesProvider.getAllCategorias(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            
            return ListAllCategories(
              categorias: snapshot.data,
            );

          } else {
              return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Categorias',
        style: encabezado,
      ),
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.search), 
          onPressed: () {
            showSearch(
              context: context, 
              delegate: DataSearch(),
            );
          }
        ),

        IconButton(
          icon: Icon(Icons.shopping_cart), 
          onPressed: () {},
        ),

      ],
    );
  }
}