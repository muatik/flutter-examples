import 'package:flutter/material.dart';
import 'package:gutmeals/components/meal_image.dart';
import 'package:gutmeals/models/meal.dart';

class MealScreen extends StatelessWidget {
  extractMealId(BuildContext context) =>
      (ModalRoute.of(context).settings.arguments as Map<String, String>)['id'];

  @override
  Widget build(BuildContext context) {
    String mealId = extractMealId(context);
    Meal meal = Meal.findById(mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MealImage(meal, maxHeight: 300.0),
          buildTitle(context, meal),
          buildTags(context, meal),
          buildIngiridients(context, meal),
        ],
      )),
    );
  }

  buildTitle(BuildContext context, Meal meal) =>
      addPadding(buildTextSection(context, meal.title, meal.description));

  buildTags(BuildContext context, Meal meal) =>
      addPadding(buildTextSection(context, 'Tags', meal.tags.join(', ')));

  buildIngiridients(BuildContext context, Meal meal) {
    ListView list = ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: meal.ingiridients
            .map((ingridient) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '• $ingridient',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ))
            .toList());

    return meal.ingiridients.isNotEmpty
        ? addPadding(buildSection(context, 'Ingredients', list))
        : Container();
  }

  buildTextSection(BuildContext context, String title, String body) =>
      buildSection(context, title,
          Text(body, style: Theme.of(context).textTheme.bodyText1));

  buildSection(BuildContext context, String title, Widget body) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title, style: Theme.of(context).textTheme.headline6),
          ),
          body
        ],
      );

  addPadding(Widget child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      );
}
