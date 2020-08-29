import 'package:flutter/material.dart';
import 'package:oso_app/src/constants/constants.dart';
import 'package:oso_app/src/models/categories_model.dart';
import 'package:oso_app/src/providers/user_preferences.dart';

class ListAllCategories extends StatelessWidget {

  final List<Categoria> categorias;

  ListAllCategories({@required this.categorias});

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      itemBuilder: (context, index) {
        return _catIndividual(context, categorias[index]);
      }, 
      separatorBuilder: (context, index) => Divider(), 
      itemCount: categorias.length
    );
    
  }

  Widget _catIndividual(BuildContext context, Categoria categoria) {

    final tarjeta = ListTile(
      title: Text(categoria.descripcion, style: cardProductText,),
      trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor,),
      onTap: () {
        prefs.idCategoria = categoria.id;
        Navigator.pushNamed(context, 'products', arguments: categoria);
      },
    );

    return tarjeta;

  }
}