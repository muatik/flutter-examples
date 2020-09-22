import 'package:costOfLiving/components/transaction_form.dart';
import 'package:costOfLiving/components/transactions.dart';
import 'package:costOfLiving/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Transaction> transactions;
  TransactionScreen(this.transactions);
  @override
  _TransactionScreenState createState() => _TransactionScreenState(this.transactions);
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<Transaction> transactions;
  
  _TransactionScreenState(this.transactions);

  void onFormSubmit(String title, int amount) {
    if (title == null || amount == null) {
      return;
    }
    
    final transaction = Transaction("d", title, amount, DateTime.now());
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(child: Text("chart")),
        Card(child: TransactionForm(onFormSubmit),),
        Expanded(child: Card(child: TransactionListView(transactions)))
      ],
    );
  }
}