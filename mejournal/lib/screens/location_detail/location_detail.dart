import 'package:flutter/material.dart';
import 'package:mejournal/model/location.dart';
import 'text_section.dart';
import 'image_banner.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();
    Location location = locations.first;
    return Scaffold(
        appBar: AppBar(title: Text('hello')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(location.imagePath),
              ...location.facts.map((fact) => TextSection(fact.title, fact.description))
            ]));
  }
}
