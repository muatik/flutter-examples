import 'package:inventory/screens/item_screen.dart';
import 'package:inventory/screens/location_overview.dart';
import 'package:inventory/screens/new_location_screen.dart';

const ROUTE_HOME = '/';
const ROUTE_LOCATION_SCREEN = '/location';
const ROUTE_ITEM_SCREEN = '/item';
const ROUTE_NEW_LOCATION = '/new-location';

final ROUTES = {
  ROUTE_HOME: (context) => LocationOverviewScreen(),
  ROUTE_LOCATION_SCREEN: (context) => LocationOverviewScreen(),
  ROUTE_ITEM_SCREEN: (context) => ItemScreen(),
  ROUTE_NEW_LOCATION: (context) => NewLocationScreen()
};
