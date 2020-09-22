import 'package:costOfLiving/components/chart.dart';
import 'package:costOfLiving/components/transactions.dart';
import 'package:costOfLiving/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  final List<Transaction> transactions;
  
  TransactionScreen(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(child: Chart(transactions)),
        this.transactions.length == 0 ? 
          Center(child: Text('no transaction added yet. add')):
          Expanded(child: Card(child: TransactionListView(transactions)))
      ],
    );
  }
}