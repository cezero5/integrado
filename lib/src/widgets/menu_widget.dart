import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/login_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_parking, color: Colors.grey[600]),
            title: Text('Garage'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.grey[600]),
            title: Text('Historial de compras'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list_alt, color: Colors.grey[600]),
            title: Text('Lista de deseos'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.grey[600]),
            title: Text('Notificaciones'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.grey[600]),
            title: Text('Cupones'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.login, color: Colors.red),
            title: Text('Cerrar sesion'),
            onTap: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
