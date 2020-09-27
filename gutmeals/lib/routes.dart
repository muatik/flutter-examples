import 'package:flutter/material.dart';
import 'package:gutmeals/screens/categoriy_list_screen.dart';
import 'package:gutmeals/screens/category_meals.dart';
import 'package:gutmeals/screens/meal_screen.dart';

const ROUTE_HOME = '/';
const ROUTE_CATEGORY_MEALS = '/category-meals';
const ROUTE_MEAL_DETAIL = '/meal';

final Map<String, WidgetBuilder> appRoutes = {
  ROUTE_HOME: (ctx) => CategoryListScreen(),
  ROUTE_CATEGORY_MEALS: (ctx) => CategoryMealsScreen(),
  ROUTE_MEAL_DETAIL: (ctx) => MealScreen()
};
