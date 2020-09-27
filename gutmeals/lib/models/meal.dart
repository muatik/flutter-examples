import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String title;
  final String description;
  final List<String> ingiridients;
  final String image;
  final List<String> tags;

  const Meal(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.image,
      this.tags,
      this.ingiridients});

  static final List<Meal> meals = [
    Meal(
        id: '1',
        title: 'Pizza',
        tags: ['bready', 'hauptspeise'],
        image:
            'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
        description: 'Pizza is nice'),
    Meal(
        id: '2',
        title: 'Doner',
        tags: ['meat', 'hauptspeise'],
        image:
            'https://images.unsplash.com/photo-1596995804697-27d11d43652e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1235&q=80',
        description: 'Doner is nice'),
    Meal(
        id: '3',
        title: 'Lahmacun',
        tags: ['fastfood', 'meat'],
        image:
            'https://images.unsplash.com/photo-1594179047513-b4199480fe9d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
        description: 'Lahmacun is nice'),
    Meal(
        id: '4',
        title: 'Dolma',
        tags: ['vegie'],
        image:
            'https://images.unsplash.com/photo-1563046937-1f82e1a115cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        description: 'Dolma is nice'),
    Meal(
        id: '5',
        title: 'Baklava',
        tags: ['desert'],
        image:
            'https://images.unsplash.com/photo-1598110750624-207050c4f28c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
        description: 'Baklava is nice'),
  ];

  static List<Meal> findAll() {
    return meals;
  }

  static Meal findById(String id) {
    return meals.firstWhere((receipe) => receipe.id == id);
  }
}
