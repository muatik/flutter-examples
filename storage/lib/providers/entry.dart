import 'package:flutter/material.dart';

class Entry with ChangeNotifier {
  String _id;
  String _name;
  String _description;
  List<String> _storage;
  List<dynamic> _photos;

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

  get name => _name;
  get description => _description;
  get id => _id;
  get storage => [...storage];
  get photos => [...photos];

  setStorage(List storage) {
    _storage = [...storage];
    notifyListeners();
  }

  setPhotos(List photos) {
    _photos = [...photos];
    notifyListeners();
  }
}
