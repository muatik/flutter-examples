import 'package:flutter/material.dart';
import 'package:gutmeals/components/meal_image_stacked.dart';
import 'package:gutmeals/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
          children: [_buildImageWithTitle(context), _buildTagsBar(context)]),
    );
  }

  Widget _buildTagsBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 20,
      child: Row(children: [
        Flexible(
          child: Text(
            ['elam', 'armut', ' karnibahar', 'domates', 'patetes', ' kivircik']
                .join(', '),
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        )
      ]),
    );
  }

  Widget _buildImageWithTitle(context) {
    return StackedMealImage(meal);
  }
}
