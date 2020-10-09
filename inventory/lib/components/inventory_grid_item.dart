import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory/providers/entry.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

class InventoryGridItem extends StatelessWidget {
  goDetail(BuildContext context, EntryType entryType, String path) {
    String screen = entryType == EntryType.Location
        ? ROUTE_LOCATION_SCREEN
        : ROUTE_ITEM_SCREEN;
    Navigator.of(context).pushNamed(screen, arguments: {'path': path});
  }

  buildImageView(Entry entry) {
    return entry.images.isNotEmpty
        ? SizedBox.expand(
            child: Image.file(
            entry.images.first,
            fit: BoxFit.cover,
          ))
        : Image.asset(
            'assets/images/box.jpeg',
            fit: BoxFit.cover,
          );
  }

  buildEntryCounterBadge() {
    return Positioned(
        bottom: 10,
        right: 10,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.yellow),
            child: Text('3')));
  }

  buildEntryTitle(Entry entry, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.black45),
      child: Text(
        '${entry.name}',
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
      ),
    );
  }

  buildEntryTypeIcon() {
    return Positioned(
        top: 5,
        left: 5,
        child: Icon(
          Icons.folder,
          color: Colors.brown,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return GestureDetector(
      onTap: () => goDetail(context, entry.entryType, entry.getPath()),
      child: Card(
          child: GridTile(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            buildImageView(entry),
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
}
