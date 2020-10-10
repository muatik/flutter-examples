import 'package:flutter/material.dart';

class ActionBarMenuItem {
  final IconData icon;
  final String label;
  final Function onSelected;

  ActionBarMenuItem(
      {@required this.label, this.icon, @required this.onSelected});
}

class ActionBarMenu extends StatelessWidget {
  final List<ActionBarMenuItem> menuItems;

  ActionBarMenu(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (callback) => callback(),
        itemBuilder: (context) {
          return menuItems
              .map((item) => PopupMenuItem(
                  value: item.onSelected,
                  child: Row(children: [
                    if (item.icon != null)
                      Icon(item.icon,
                          color: Theme.of(context).textTheme.bodyText1.color),
                    Text(item.label)
                  ])))
              .toList();
        });
  }
}
