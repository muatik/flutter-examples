import 'package:flutter/material.dart';

import 'entry.dart';

class Inventory with ChangeNotifier {
  Entry root = Location(path: '/', name: 'Home', subEntries: [
    Location(path: '/', name: 'keller', subEntries: [
      Location(path: '/keller', name: 'shelf1', subEntries: []),
      Item(path: '/keller', name: 'domates')
    ]),
    Item(path: '/', name: 'patates')
  ]);

  Entry getByPath(String path) {
    List<String> names = path
        .split('/')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    if (names.isEmpty) {
      return root;
    }

    Location pwd = root;
    for (var search in names) {
      try {
        pwd = pwd.subEntries.firstWhere((e) => e.name == search);
      } catch (e) {
        return null;
      }
    }

    return pwd;
  }

  Future<Location> addLocationByPath(String path, name) {
    final parent = getByPath(path);
    return addLocation(parent, name);
  }

  Future<Location> addLocation(Location parent, name) {
    final location =
        Location(path: parent.getPath(), name: name, subEntries: []);
    return Future.delayed(Duration(seconds: 3), () {
      parent.add(location);
      notifyListeners();
      return location;
    });
  }
}
