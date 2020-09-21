import 'package:costOfLiving/components/transaction.dart';
import 'package:costOfLiving/components/transactions.dart';
import 'package:costOfLiving/transaction.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction("id1", "New shoe", 100, DateTime.now().subtract(Duration(days: 3))),
    Transaction("id2", "Potato", 36, DateTime.now().subtract(Duration(days: 2))),
    Transaction("id3", "Orange", 21, DateTime.now().subtract(Duration(days: 1))),
    Transaction("id4", "Watermelon", 48, DateTime.now().subtract(Duration(hours: 22))),
    Transaction("id5", "Beans", 78, DateTime.now().subtract(Duration(days: 21))),
    Transaction("id6", "Apples", 32, DateTime.now().subtract(Duration(days: 20))),
    Transaction("id7", "Banana", 50, DateTime.now().subtract(Duration(days: 19))),
    Transaction("id8", "Onion", 12, DateTime.now().subtract(Duration(days: 19))),
    Transaction("id9", "Tomato", 77, DateTime.now().subtract(Duration(days: 19))),
    Transaction("id10", "Groceries", 66, DateTime.now()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("cost of living")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Text("chart")
          ),
          Expanded(child: Card(child: TransactionListView(transactions)))
        ],
      )
    );
  }


}
