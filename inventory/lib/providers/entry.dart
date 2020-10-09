import 'package:flutter/material.dart';

enum EntryType { Location, Item }

class Entry with ChangeNotifier {
  EntryType entryType;
  String name;
  String path;
  Entry(this.path, this.name, this.entryType);

  String getPath() {
    return path == '/' ? '/$name' : '$path/$name';
  }
}

class Location extends Entry {
  List<Entry> subEntries = [];

  Location({@required path, @required name, @required this.subEntries})
      : super(path, name, EntryType.Location);

  add(Entry entry) {
    subEntries.add(entry);
    notifyListeners();
  }
}

class Item extends Entry {
  Item({@required path, @required name}) : super(path, name, EntryType.Item);
}
