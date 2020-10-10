import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/providers/inventory.dart';

class EntryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inventory = Provider.of<Inventory>(context);
    final entries = inventory.findAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: GridView.builder(
        itemCount: entries.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 1.3),
        itemBuilder: (context, index) {
          return GridTile(child: Card(child: Text(entries[index].name)));
        },
      ),
    );
  }
}
