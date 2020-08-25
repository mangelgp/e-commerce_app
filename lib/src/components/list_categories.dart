import 'package:flutter/material.dart';
import 'package:oso_app/src/constants/constants.dart';
import 'package:oso_app/src/models/categories_model.dart';

class ListAllCategories extends StatelessWidget {

  final List<Categoria> categorias;

  const ListAllCategories({@required this.categorias});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: _createListCategorias(context, categorias),
    );
    
  }

  List<Widget> _createListCategorias(BuildContext context, List<Categoria> categorias) {

    final List<Widget> allCategorias = [];

    categorias.forEach((categoria) { 

      final tempWidget = _catIndividual(context, categoria);

      allCategorias.add(tempWidget);
      allCategorias.add(Divider());

    });

    return allCategorias;

  }

  Widget _catIndividual(BuildContext context, Categoria categoria) {

    final tarjeta = ListTile(
      title: Text(categoria.descripcion, style: TextStyle(color: kTextColor, fontWeight: FontWeight.w400, fontSize: 20.0),),
      trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor,),
      onTap: () {
        Navigator.pushNamed(context, 'products', arguments: categoria);
      },
    );

    return tarjeta;

  }
}