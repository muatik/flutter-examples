import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:inventory/components/inventory_grid.dart';
import 'package:inventory/providers/entry.dart';
import 'package:inventory/providers/inventory.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

class LocationOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: is there a better way to pass this?
    final args =
        (ModalRoute.of(context).settings.arguments as Map<String, String>);
    final path = args != null && args.containsKey('path') ? args['path'] : '/';

    Inventory inventory = Provider.of<Inventory>(context);
    Entry entry = inventory.getByPath(path);

    return Scaffold(
      appBar: AppBar(title: Text(entry == null ? 'not found' : path)),
      floatingActionButton: Builder(
          builder: (context) => SpeedDial(
                children: [
                  SpeedDialChild(
                      onTap: () => addNewLocation(context, path),
                      label: 'a new location',
                      child: Icon(Icons.shopping_basket)),
                  SpeedDialChild(
                      onTap: () => addNewItem(context),
                      label: 'a new item',
                      child: Icon(Icons.check_box_outline_blank))
                ],
                child: Icon(Icons.add),
              )),
      body: entry == null ? Text('$path not found') : InventoryGrid(entry),
    );
  }

  addNewItem(BuildContext context) {}

  addNewLocation(BuildContext context, String path) {
    Navigator.of(context).pushNamed(ROUTE_NEW_LOCATION,
        arguments: {'path': path}).then((isAdded) {
      _showProcessStatus(context, 'a new location added');
    });
  }

  void _showProcessStatus(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
