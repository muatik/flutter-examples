import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:inventory/components/action_bar_menu.dart';
import 'package:inventory/components/inventory_grid.dart';
import 'package:inventory/components/location_card.dart';
import 'package:inventory/providers/entry.dart';
import 'package:inventory/providers/inventory.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

import 'location_form_screen.dart';

class LocationOverviewScreen extends StatelessWidget {
  onLocationUpdate(BuildContext context, Entry entry) {
    Navigator.of(context).pushNamed(ROUTE_NEW_LOCATION,
        arguments: {'path': entry.getPath(), 'mode': LocationFormMode.UPDATE});
  }

  onLocationDelete(
      BuildContext context, Inventory inventory, String locationId) async {}

  buildAppBar(
      {BuildContext context,
      Entry entry,
      Function onUpdateTab,
      Function onDeleteTab}) {
    if (entry == null) {
      return AppBar(title: Text('not found'));
    }
    final title = entry.getPath().substring(1);
    return AppBar(
      title: Text(title),
      actions: [
        ActionBarMenu([
          ActionBarMenuItem(
              label: 'Update', icon: Icons.edit, onSelected: onUpdateTab),
          ActionBarMenuItem(
              label: 'Delete', icon: Icons.delete, onSelected: onDeleteTab)
        ])
      ],
    );
  }

  addNewItem(BuildContext context) {}

  addNewLocation(BuildContext context, String path) {
    Navigator.of(context).pushNamed(ROUTE_NEW_LOCATION,
        arguments: {'path': path}).then((isAdded) {
      _showSnackBar(context, 'a new location added');
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: is there a better way to pass this?
    final args =
        (ModalRoute.of(context).settings.arguments as Map<String, String>);
    final path = args != null && args.containsKey('path') ? args['path'] : '/';

    Inventory inventory = Provider.of<Inventory>(context);
    Entry entry = inventory.getByPath(path);

    return Scaffold(
      appBar: buildAppBar(
          context: context,
          entry: entry,
          onUpdateTab: () => onLocationUpdate(context, entry),
          onDeleteTab: () => onLocationDelete(context, inventory, entry.id)),
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
      body: entry == null
          ? Text('$path not found')
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  if (!entry.isRoot)
                    ChangeNotifierProvider<Entry>.value(
                        value: entry,
                        child: LocationCard(
                          swipeImage: true,
                        )),
                  InventoryGrid(entry),
                  SizedBox(height: 300)
                ])),
    );
  }
}

// ustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   expandedHeight: 200,
//                   pinned: true,
//                   flexibleSpace: FlexibleSpaceBar(
//                       title: buildAppBar(entry),
//                       background: !entry.isRoot
//                           ? ChangeNotifierProvider<Entry>.value(
//                               value: entry,
//                               child: LocationCard(
//                                 titleVisible: false,
//                               ))
//                           : null),
//                 ),
//                 SliverList(
//                     delegate: SliverChildListDelegate(
//                   [
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1, color: Colors.blue)),
//                       child: InventoryGrid(entry),
//                     ),
//                     SizedBox(height: 700)
//                   ],
//                 ))
//               ],
//             ),
