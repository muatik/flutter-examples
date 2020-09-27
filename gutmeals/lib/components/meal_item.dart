import 'package:flutter/material.dart';
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          child: Image.network(
            meal.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
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
