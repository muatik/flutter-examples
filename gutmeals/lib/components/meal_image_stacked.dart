import 'package:flutter/material.dart';
import 'package:gutmeals/models/meal.dart';

import 'meal_image.dart';

class StackedMealImage extends StatelessWidget {
  final Meal meal;
  final double maxHeight;

  StackedMealImage(this.meal, {this.maxHeight: 200});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          child: MealImage(meal, maxHeight: maxHeight),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black54,
                child: Text(
                  meal.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                )))
      ],
    );
  }
}
