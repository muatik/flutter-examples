import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/args.dart';
import 'package:storage/components/entry_detail.dart';
import 'package:storage/providers/entry.dart';
import 'package:storage/providers/inventory.dart';

class EntryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entryId = getArg(context, 'id');
    final inventory = Provider.of<Inventory>(context);
    Entry entry;
    try {
      entry = inventory.findById(entryId);
    } catch (e) {}

    return Scaffold(
        appBar: AppBar(
          title: Text(entry == null ? 'entry not found' : entry.name),
        ),
        body: entry == null
            ? Text('entry not found')
            : ChangeNotifierProvider.value(value: entry, child: EntryDetail()));
  }
}
