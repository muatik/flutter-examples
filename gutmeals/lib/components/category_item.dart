import 'package:flutter/material.dart';
import 'package:gutmeals/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  final Function onSelected;

  CategoryItem({this.category, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onSelected(category),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(7),
              gradient: category.bgColor != null
                  ? LinearGradient(colors: [
                      category.bgColor.withOpacity(0.7),
                      category.bgColor
                    ])
                  : null),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ));
  }
}
