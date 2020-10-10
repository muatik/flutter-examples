import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory/providers/inventory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/routes.dart';
import 'package:provider/provider.dart';

import 'providers/locations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp().whenComplete(() {
      final locations = Locations(FirebaseFirestore.instance);
      locations
          .createDir(name: 'assets', parent: locations.root)
          .then((dir) => locations.createDir(name: 'images', parent: dir));
      // CollectionReference root = FirebaseFirestore.instance.collection('root');

      // users
      //     .add({'username': 'mustafa'})
      //     .then((value) => print(value))
      //     .catchError((onError) => print(onError));
    });

    return ChangeNotifierProvider(
        create: (context) => Inventory(),
        child: MaterialApp(
            title: 'Inventory App',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routes: ROUTES));
  }
}
