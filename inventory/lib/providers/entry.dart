import 'package:flutter/material.dart';

enum EntryType { Location, Item }

class Entry with ChangeNotifier {
  EntryType entryType;
  String name;
  String path;
  List images = [];
  Entry(this.path, this.name, this.entryType, this.images);

  get isRoot => path == '/' && name == '';
  get isLocation => entryType == EntryType.Location;

  String getPath() {
    return path == '/' ? '/$name' : '$path/$name';
  }
}

class Location extends Entry {
  List<Entry> subEntries = [];

  Location(
      {@required path,
      @required name,
      @required this.subEntries,
      @required images})
      : super(path, name, EntryType.Location, images);

  add(Entry entry) {
    subEntries.add(entry);
    notifyListeners();
  }
}

class Item extends Entry {
  Item({@required path, @required name, @required images})
      : super(path, name, EntryType.Item, images);
}
