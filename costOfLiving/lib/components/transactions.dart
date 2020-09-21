import 'package:costOfLiving/components/transaction.dart';
import 'package:costOfLiving/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListView extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionListView(this._transactions);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions.map((t) => TransactionView(t)).toList(),
    );
  }
}