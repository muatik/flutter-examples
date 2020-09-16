import 'package:flutter/material.dart';
import 'package:mejournal/model/location.dart';
import 'package:mejournal/router.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = Location.fetchAll()
        .map((location) => GestureDetector(
            onTapUp: (detail) {
              _onLocationTap(context, location.id);
            },
            child: ListTile(
                leading: Container(
                    constraints: BoxConstraints(maxHeight: 50),
                    child: Image.asset(location.imagePath, fit: BoxFit.cover)),
                title: Text(location.title))))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Locations"),
      ),
      body: ListTileTheme(
          selectedColor: Colors.red, child: ListView(children: items)),
    );
  }

  _onLocationTap(BuildContext context, int id) {
    Navigator.pushNamed(context, LocationDetailRoute, arguments: {'id': id});
  }
}
