import 'package:flutter/material.dart';
import 'package:oso_app/src/components/my_cutom_scroll_view.dart';
import 'package:oso_app/src/models/categories_model.dart';
import 'package:oso_app/src/providers/products_provider.dart';

class AllProductsPage extends StatelessWidget {

  final productsProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {

    final Categoria categoria = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: _buildBody(categoria),
    );
  }

  Container _buildBody(Categoria categoria) {
    return Container(
      child: FutureBuilder(
        future: productsProvider.getAllProductsByCategoryID(categoria.id.toString(),),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {

            return MyCustomScrollView(products: snapshot.data, categoria: categoria,);

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
}

