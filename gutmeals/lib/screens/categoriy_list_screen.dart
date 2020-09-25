import 'package:flutter/material.dart';
import 'package:gutmeals/components/category_item.dart';
import 'package:gutmeals/models/category.dart';
import 'package:gutmeals/routes.dart';

class CategoryListScreen extends StatelessWidget {
  void onCategorySelected(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(ROUTE_CATEGORY_MEALS, arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: buildCategories(context),
        ));
  }

  buildCategories(BuildContext context) {
    return Category.findAll()
        .map((c) => CategoryItem(
              category: c,
              onSelected: (category) =>
                  onCategorySelected(context, category.id),
            ))
        .toList();
  }
}
