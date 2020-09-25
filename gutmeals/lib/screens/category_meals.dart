import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gutmeals/models/category.dart';
import 'package:gutmeals/models/receipe.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];
    final category = Category.findById(categoryId);

    final List<Receipe> receipes = Category.findByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(receipes[index].title);
        },
        itemCount: receipes.length,
      ),
    );
  }
}
