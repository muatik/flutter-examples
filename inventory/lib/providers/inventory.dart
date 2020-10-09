import 'package:flutter/material.dart';

import 'entry.dart';

class Inventory with ChangeNotifier {
  Entry root = Location(path: '/', name: '', subEntries: [
    Location(path: '/', name: 'keller', subEntries: [
      Location(path: '/keller', name: 'shelf1', subEntries: [], images: []),
      Item(path: '/keller', name: 'domates', images: [])
    ], images: []),
    Item(path: '/', name: 'patates', images: [])
  ], images: []);

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

  Future<Location> addLocationByPath(String path, String name, List images) {
    final parent = getByPath(path);
    return addLocation(parent, name, images);
  }

  Future<Location> addLocation(Location parent, String name, List images) {
    final location = Location(
        path: parent.getPath(), name: name, subEntries: [], images: images);
    return Future.delayed(Duration(seconds: 3), () {
      parent.add(location);
      notifyListeners();
      return location;
    });
  }
}
