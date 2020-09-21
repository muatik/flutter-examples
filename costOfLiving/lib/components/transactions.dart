import 'package:costOfLiving/components/transaction.dart';
import 'package:costOfLiving/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListView extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionListView(this._transactions);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _transactions.map((t) => TransactionView(t)).toList(),
    );
  }
}