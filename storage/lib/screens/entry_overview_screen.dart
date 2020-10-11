import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/components/entry_detail.dart';
import 'package:storage/components/entry_grid_tile.dart';
import 'package:storage/providers/inventory.dart';

import '../args.dart';
import '../routes.dart';

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
              crossAxisCount: 1, childAspectRatio: 1.5),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: entries[index],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: GestureDetector(
                    onTap: () => showEntryDetail(context, entries[index].id),
                    child: EntryGridTile()),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onNewEntryTab(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void onNewEntryTab(BuildContext context) {
    Navigator.of(context).pushNamed(ROUTE_ENTRY_FORM, arguments: {});
  }

  showEntryDetail(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(ROUTE_ENTRY_DETAIL, arguments: {'id': id}).then((value) {
      if (value == EntryDetailResult.DELETED) {
        showProcessStatus(context, 'entry deleted');
      }
    });
    ;
  }
}
