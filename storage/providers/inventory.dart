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
}
