import 'package:flutter/material.dart';

enum EntryType { Location, Item }

class Entry with ChangeNotifier {
  String id;
  EntryType entryType;
  String name;
  String path;
  List _images = [];
  Entry(this.id, this.path, this.name, this.entryType, images)
      : _images = images;

  get images => [..._images];
  set images(List images) {
    _images = images;
    notifyListeners();
  }

  get isRoot => path == '/' && name == '';
  get isLocation => entryType == EntryType.Location;

  String getPath() {
    return path == '/' ? '/$name' : '$path/$name';
  }
}

class Location extends Entry {
  List<Entry> subEntries = [];

  Location(
      {@required id,
      @required path,
      @required name,
      @required this.subEntries,
      @required images})
      : super(id, path, name, EntryType.Location, images);

  add(Entry entry) {
    subEntries.add(entry);
    notifyListeners();
  }
}

class Item extends Entry {
  Item({@required id, @required path, @required name, @required images})
      : super(id, path, name, EntryType.Item, images);
}
