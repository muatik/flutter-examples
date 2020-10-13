import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:storage/components/entry_grid.dart';
import 'package:storage/components/search_bar.dart';
import 'package:storage/providers/inventory.dart';

import '../routes.dart';

class EntryOverviewScreen extends StatefulWidget {
  @override
  _EntryOverviewScreenState createState() => _EntryOverviewScreenState();
}

class _EntryOverviewScreenState extends State<EntryOverviewScreen> {
  String query = "";

  onQueryChange(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inventory = Provider.of<Inventory>(context);
    final entries =
        query.isEmpty ? inventory.findAll() : inventory.search(query);

    return Scaffold(
      body: SingleChildScrollView(
        child: StickyHeader(
            header: SearchBar(onQueryChange), content: EntryGrid(entries)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onNewEntryTab(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void onNewEntryTab(BuildContext context) {
    Navigator.of(context).pushNamed(ROUTE_ENTRY_FORM, arguments: {});
  }
}
