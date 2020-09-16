import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'location_fact.dart';

@immutable
class Location {
  final int id;
  final String title;
  final String imagePath;
  final List<LocationFact> facts;
  
  Location(this.id, this.title, this.imagePath, this.facts);
  
}