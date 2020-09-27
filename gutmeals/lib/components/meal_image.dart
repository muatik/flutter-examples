import 'package:flutter/material.dart';
import 'package:gutmeals/models/meal.dart';

class MealImage extends StatelessWidget {
  final Meal meal;
  final double maxHeight;

  const MealImage(
    this.meal, {
    @required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: maxHeight),
      width: double.infinity,
      child: Image.network(
        meal.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
