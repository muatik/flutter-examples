import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory/providers/entry.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

class InventoryGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return GestureDetector(
      onTap: () => goDetail(context, entry.entryType, entry.getPath()),
      child: Card(
          child: GridTile(
        // footer: GridTileBar(
        //     backgroundColor: Colors.black54,
        //     leading: IconButton(icon: Icon(Icons.folder), onPressed: null),
        //     title: Text('33 items')),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              'assets/images/box.jpeg',
              fit: BoxFit.cover,
            ),
            if (entry.entryType == EntryType.Location) ...[
              buildEntryTypeIcon(),
              buildEntryTitle(entry, context),
              buildEntryCounterBadge()
            ] else ...[
              buildEntryTitle(entry, context)
            ]
          ],
        ),
      )),
    );
  }

  Positioned buildEntryCounterBadge() {
    return Positioned(
        bottom: 10,
        right: 10,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.yellow),
            child: Text('3')));
  }

  Container buildEntryTitle(Entry entry, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.black45),
      child: Text(
        '${entry.name}',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Positioned buildEntryTypeIcon() {
    return Positioned(
        top: 5,
        left: 5,
        child: Icon(
          Icons.folder,
          color: Colors.brown,
        ));
  }

  goDetail(BuildContext context, EntryType entryType, String path) {
    String screen = entryType == EntryType.Location
        ? ROUTE_LOCATION_SCREEN
        : ROUTE_ITEM_SCREEN;
    Navigator.of(context).pushNamed(screen, arguments: {'path': path});
  }
}
