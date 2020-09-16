import 'package:flutter/material.dart';
import 'package:mejournal/screens/location_detail/location_detail.dart';
import 'package:mejournal/screens/locations.dart';

const LocationRoute = "/";
const LocationDetailRoute = "/location";

RouteFactory routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case LocationDetailRoute:
        screen = LocationDetail(arguments['id']);
        break;
      default:
        screen = Locations();
    }

    return MaterialPageRoute(builder: (context) => screen);
  };
}
