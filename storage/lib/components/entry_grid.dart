import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/providers/entry.dart';

import '../args.dart';
import '../routes.dart';
import 'entry_detail.dart';
import 'entry_grid_tile.dart';

class EntryGrid extends StatelessWidget {
  final List<Entry> entries;

  EntryGrid(this.entries);

  showEntryDetail(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(ROUTE_ENTRY_DETAIL, arguments: {'id': id}).then((value) {
      if (value == EntryDetailResult.DELETED) {
        showProcessStatus(context, 'entry deleted');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: entries.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.5),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: entries[index],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: GestureDetector(
                  onTap: () => showEntryDetail(context, entries[index].id),
                  child: EntryGridTile()),
            )));
  }
}
