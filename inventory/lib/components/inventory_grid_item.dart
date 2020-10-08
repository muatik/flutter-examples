import 'package:flutter/material.dart';
import 'package:inventory/providers/entry.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

class InventoryGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return GridTile(
        child: GestureDetector(
      onTap: () => goDetail(context, entry.entryType, entry.getPath()),
      child: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${entry.entryType}:${entry.name}'),
          )),
    ));
  }

  goDetail(BuildContext context, EntryType entryType, String path) {
    String screen = entryType == EntryType.Location
        ? ROUTE_LOCATION_SCREEN
        : ROUTE_ITEM_SCREEN;
    Navigator.of(context).pushNamed(screen, arguments: {'path': path});
  }
}
