import 'package:flutter/material.dart';
import 'package:mejournal/model/location.dart';
import 'text_section.dart';
import 'image_banner.dart';

class LocationDetail extends StatelessWidget {
  final int _locationId;
  LocationDetail(this._locationId);

  @override
  Widget build(BuildContext context) {
    Location location = Location.findById(_locationId);
    return Scaffold(
        appBar: AppBar(title: Text(location.title)),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(location.imagePath),
              ...location.facts
                  .map((fact) => TextSection(fact.title, fact.description))
            ]));
  }
}
