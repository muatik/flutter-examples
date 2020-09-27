import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gutmeals/components/meal_item.dart';
import 'package:gutmeals/models/category.dart';
import 'package:gutmeals/models/meal.dart';
import 'package:gutmeals/routes.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];
    final category = Category.findById(categoryId);

    final List<Meal> meals = Category.findMeals(categoryId);

    _onMealSelected(String mealId) {
      Navigator.of(context)
          .pushNamed(ROUTE_MEAL_DETAIL, arguments: {'id': mealId});
    }

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          Meal meal = meals[index];
          return GestureDetector(
              onTap: () => _onMealSelected(meal.id), child: MealItem(meal));
        },
        itemCount: meals.length,
      ),
    );
  }
}
