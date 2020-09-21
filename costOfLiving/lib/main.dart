import 'package:costOfLiving/components/transactions.dart';
import 'package:costOfLiving/models/transaction.dart';
import 'package:costOfLiving/screens/transaction_screen.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [
    Transaction("id1", "New shoe", 1000, DateTime.now().subtract(Duration(days: 3))),
    Transaction("id2", "Potato", 3600, DateTime.now().subtract(Duration(days: 2))),
    Transaction("id3", "Orange", 2100, DateTime.now().subtract(Duration(days: 1))),
    Transaction("id4", "Watermelon", 480, DateTime.now().subtract(Duration(hours: 22))),
    Transaction("id5", "Beans", 780, DateTime.now().subtract(Duration(days: 21))),
    Transaction("id6", "Apples", 3200, DateTime.now().subtract(Duration(days: 20))),
    Transaction("id7", "Banana", 500, DateTime.now().subtract(Duration(days: 19))),
    Transaction("id8", "Onion", 1200, DateTime.now().subtract(Duration(days: 19))),
    Transaction("id9", "Tomato", 770, DateTime.now().subtract(Duration(days: 19))),
    Transaction("id10", "Groceries", 660, DateTime.now()),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("cost of living")),
      floatingActionButton: FloatingActionButton(
        child: IconButton(icon: Icon(Icons.add), onPressed: null),
        onPressed: null),
      body: TransactionScreen(transactions)
    );
  }
}
