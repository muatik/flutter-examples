import 'package:flutter/material.dart';

class Receipe {
  final String id;
  final String title;
  final String description;
  final List<String> ingiridients;

  const Receipe(
      {@required this.id,
      @required this.title,
      @required this.description,
      this.ingiridients});

  static final List<Receipe> receipes = [
    Receipe(id: '1', title: 'Pizza', description: 'Pizza is nice'),
    Receipe(id: '2', title: 'Doner', description: 'Doner is nice'),
    Receipe(id: '3', title: 'Lahmacun', description: 'Lahmacun is nice'),
    Receipe(id: '4', title: 'Dolma', description: 'Dolma is nice'),
    Receipe(id: '5', title: 'Baklava', description: 'Baklava is nice'),
  ];

  static List<Receipe> findAll() {
    return receipes;
  }

  static Receipe findById(String id) {
    return receipes.firstWhere((receipe) => receipe.id == id);
  }
}
