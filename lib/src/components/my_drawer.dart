import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Stack(
              children: [
                _buildFondo(),
                Center(child: Icon(Icons.person, size: 120.0,color:  Colors.white,))                
              ],
            ),
            // ),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor,),
            title: Text('Inicio'),
          ),

          ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'fav');
            },
            leading: Icon(Icons.favorite, color: Theme.of(context).primaryColor),
            title: Text('Favoritos'),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_basket, color: Theme.of(context).primaryColor),
            title: Text('Mis compras'),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(Icons.account_circle, color: Theme.of(context).primaryColor),
            title: Text('Mi cuenta'),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
            title: Text('Notificaciones'),
          ),
        ],
      )  
    );
  }

  Widget _buildFondo() {

    final circuloA = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      height: 45.0,
      width: 45.0,
    );
    final circuloB = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      height: 25.0,
      width: 25.0,
    );
    final circuloC = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      height: 125.0,
      width: 125.0,
    );

    return Stack(
      children: [
        Positioned(child: circuloA, left: 20, top: 20,),
        Positioned(child: circuloB, left: 50, top: 50,),
        Positioned(child: circuloB, right: -5, bottom: 50,),
        Positioned(child: circuloC, right: -35, bottom: -60,),
      ],
    );
  }
}