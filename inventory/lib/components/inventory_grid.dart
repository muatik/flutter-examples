import 'package:flutter/material.dart';
import 'package:inventory/providers/entry.dart';
import 'package:provider/provider.dart';

import 'inventory_grid_tile.dart';

class InventoryGrid extends StatelessWidget {
  final Location entry;

  InventoryGrid(this.entry);

  @override
  Widget build(BuildContext context) {
    final subEntries = entry.subEntries;

    return GridView.builder(
        itemCount: subEntries.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3 / 2),
        itemBuilder: (context, index) => ChangeNotifierProvider<Entry>.value(
            value: subEntries[index],
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.pink)),
                child: InventoryGridTile())));
  }
}
