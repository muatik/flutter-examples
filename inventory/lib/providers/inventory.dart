import 'dart:math';

import 'package:flutter/material.dart';

import 'entry.dart';

class Inventory with ChangeNotifier {
  Location root = Location(id: 'a1', path: '/', name: '', subEntries: [
    Location(id: 'a2', path: '/', name: 'keller', subEntries: [
      Location(
          id: 'a3',
          path: '/keller',
          name: 'shelf1',
          subEntries: [],
          images: []),
      Item(id: 'a4', path: '/keller', name: 'domates', images: [])
    ], images: []),
    Item(id: 'a5', path: '/', name: 'patates', images: [])
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

  Future<Location> updateLocationByPath(String id, String name, List images) {
    return updateLocation(id, name, images);
  }

  Future<Location> addLocation(Location parent, String name, List images) {
    final location = Location(
        id: Random().nextInt(10000).toString(),
        path: parent.getPath(),
        name: name,
        subEntries: [],
        images: images);
    return Future.delayed(Duration(seconds: 1), () {
      parent.add(location);
      notifyListeners();
      return location;
    });
  }

  Future<Location> updateLocation(String id, String name, List images) {
    Location location =
        [root].expand((e) => e.subEntries).firstWhere((e) => e.id == id);
    return Future.delayed(Duration(seconds: 1), () {
      location.name = name;
      location.images = images;
      notifyListeners();
      return location;
    });
  }
}
