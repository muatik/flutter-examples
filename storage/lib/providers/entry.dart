import 'package:flutter/material.dart';

class Entry with ChangeNotifier {
  String _id;
  String _name;
  String _description;
  List<String> _storage = [];
  List<dynamic> _photos = [];

  Entry(
      {@required id,
      @required name,
      @required description,
      @required storage,
      @required photos})
      : _id = id,
        _name = name,
        _description = description,
        _storage = [...storage],
        _photos = [...photos];

  String get name => _name;
  String get description => _description;
  String get id => _id;
  List get storage => [..._storage];
  List get photos => [..._photos];

  set id(val) {
    _id = val;
    notifyListeners();
  }

  set name(val) {
    _name = val;
    notifyListeners();
  }

  set description(val) {
    _description = val;
    notifyListeners();
  }

  set storage(List storage) {
    _storage = [...storage];
    notifyListeners();
  }

  set photos(List photos) {
    _photos = [...photos];
    notifyListeners();
  }
}
