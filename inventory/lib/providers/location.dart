import 'package:flutter/material.dart';

class Location with ChangeNotifier {
  Location parent;
  String name;
  String id;
  List<Location> children;

  Location({@required this.name, this.id, this.parent, this.children});
}
