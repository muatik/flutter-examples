import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gutmeals/components/meal_item.dart';
import 'package:gutmeals/models/category.dart';
import 'package:gutmeals/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];
    final category = Category.findById(categoryId);

    final List<Meal> meals = Category.findMeals(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
