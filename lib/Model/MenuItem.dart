import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'pacakage:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({this.icon, this.text});
}

class MenuItems {
  static const List<MenuItem> itemsFirst = [itemSettings];
  static const List<MenuItem> itemsSecond = [itemLogout];

  static const itemSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );

  static const itemLogout = MenuItem(
    text: 'Sign Out',
    icon: Icons.logout,
  );
}
