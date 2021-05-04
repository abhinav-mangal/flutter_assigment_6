import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/LoginPage.dart';
import 'package:flutter_assignment_6/Pages/SettingsPage.dart';

import 'MenuItem.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  const MyAppBar({Key key, this.title, this.appBar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: [
        PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
                  ...MenuItems.itemsFirst.map(buildItem).toList(),
                  PopupMenuDivider(),
                  ...MenuItems.itemsSecond.map(buildItem).toList(),
                ])
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.blue,
              size: 20,
            ),
            SizedBox(
              width: 12,
            ),
            Text(item.text),
          ],
        ),
      );

  onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemSettings:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingsPage()));
        break;
      case MenuItems.itemLogout:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
        break;
      default:
    }
  }
}
