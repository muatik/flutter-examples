import 'package:flutter/material.dart';
import 'package:mejournal/router.dart';
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(headline5: HeadLine5, bodyText2: BodyText2),
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        onGenerateRoute: routes());
  }
}