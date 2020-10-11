import 'dart:math';

import 'package:flutter/material.dart';

import 'entry.dart';

class Inventory with ChangeNotifier {
  List<Entry> _entries = [
    Entry(
        id: 'a1',
        name: 'Patates',
        description: '',
        storage: ['keller', 'box1'],
        photos: []),
    Entry(
        id: 'a2',
        name: 'Tornavida',
        description: '',
        storage: ['garage', 'box1'],
        photos: []),
    Entry(
        id: 'a3',
        name: 'Patlican',
        description: '',
        storage: ['keller', 'box2'],
        photos: []),
    Entry(
        id: 'a4',
        name: 'Domates',
        description: '',
        storage: ['keller', 'box1'],
        photos: []),
  ];

  List<Entry> findAll() => [..._entries];

  Entry findById(String entryId) {
    return _entries.firstWhere((e) => e.id == entryId);
  }

  Future<Entry> add(
      {String name, String description, List<String> storage, List photos}) {
    final entry = Entry(
        id: Random().nextInt(10000).toString(),
        name: name,
        description: description,
        storage: storage,
        photos: photos);
    return Future.delayed(Duration(milliseconds: 1500), () {
      _entries.add(entry);
      notifyListeners();
      return entry;
    });
  }

  Future<Entry> update(
      {String id,
      String name,
      String description,
      List<String> storage,
      List photos}) {
    return Future.delayed(Duration(milliseconds: 1500), () {
      final entry = findById(id);
      entry.name = name;
      entry.description = description;
      entry.storage = storage;
      entry.photos = photos;
      notifyListeners();
      return entry;
    });
  }

  Future deleteById(String id) {
    return Future.delayed(Duration(milliseconds: 1200), () {
      _entries.removeWhere((e) => e.id == id);
      notifyListeners();
      return;
    });
  }
}
