import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gutmeals/models/Category.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];
    final category = Category.findById(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Text('the meals of the category'),
    );
  }
}
