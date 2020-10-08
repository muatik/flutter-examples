import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'location.dart';

enum ENTRY_TYPE { LOCATION, ITEM }

class Locations with ChangeNotifier {
  FirebaseFirestore firestore;
  final Location root = Location(name: 'root', id: 'IKgpK4fwm41oSUjTPRsZ');

  Locations(this.firestore);

  Future<Location> createDir(
      {@required String name, @required Location parent}) {
    final type = describeEnum(ENTRY_TYPE.LOCATION);
    final path = getPath(parent, type);
    return firestore.collection(path).add({'name': name, 'type': type}).then(
        (document) => Location(id: document.id, name: name, parent: parent));
  }

  static String getPath(Location location, String type) {
    List<String> names = [];
    while (location != null) {
      names.add(location.id);
      location = location.parent;
    }
    return '/root/' + names.reversed.join('/$type/') + '/$type';
  }
}
