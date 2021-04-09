import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/controllers/controller_theme.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Bem vindo'),
            accountEmail: Text('Bora programar!'),
            currentAccountPicture: Image.asset('assets/images/logo.png'),
          ),
          ExpansionTile(
            title: Text('Temas'),
            childrenPadding: EdgeInsets.only(left: 20),
            children: [
              ListTile(
                title: Text('Light'),
                onTap: () => ControllerTheme.instance.setTheme(isDark: false),
              ),
              ListTile(
                title: Text('Dark'),
                onTap: () => ControllerTheme.instance.setTheme(isDark: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
