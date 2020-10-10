import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory/components/item_card.dart';
import 'package:inventory/components/location_card.dart';
import 'package:inventory/providers/entry.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

class InventoryGridTile extends StatelessWidget {
  goDetail(BuildContext context, EntryType entryType, String path) {
    String screen = entryType == EntryType.Location
        ? ROUTE_LOCATION_SCREEN
        : ROUTE_ITEM_SCREEN;
    Navigator.of(context).pushNamed(screen, arguments: {'path': path});
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
            // TODO: why does not the image fill the card?
            entry.isLocation ? LocationCard() : ItemCard()
          ],
        ),
      )),
    );
  }
}
