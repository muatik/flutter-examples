import 'package:flutter/material.dart';
import 'package:gutmeals/models/receipe.dart';

class Category {
  final String id;
  final String title;
  final Color bgColor;

  const Category({
    @required this.id,
    @required this.title,
    this.bgColor,
  });

  static final List<Category> categories = const [
    Category(id: '1', title: 'Asian', bgColor: Colors.grey),
    Category(id: '2', title: 'Turkish', bgColor: Colors.green),
    Category(id: '3', title: 'Italian', bgColor: Colors.blue),
    Category(id: '4', title: 'German', bgColor: Colors.brown),
    Category(id: '5', title: 'French', bgColor: Colors.pink),
    Category(id: '6', title: 'Indian', bgColor: Colors.deepOrange),
    Category(id: '7', title: 'Arabic', bgColor: Colors.lightGreen),
    Category(id: '8', title: 'American', bgColor: Colors.redAccent),
    Category(id: '9', title: 'Nordic', bgColor: Colors.yellow),
    Category(id: '10', title: 'Spanish', bgColor: Colors.deepOrange),
  ];

  static Category findById(String id) {
    return categories.firstWhere((c) => c.id == id);
  }

  static List<Category> findAll() {
    return categories;
  }

  static final Map<String, List<String>> category2Receipes = {
    '1': ['1', '4'],
    '2': ['2', '4', '3']
  };

  static List<Receipe> findByCategory(String categoryId) {
    return category2Receipes[categoryId]
        .map((id) => Receipe.findById(id))
        .toList();
  }
}
