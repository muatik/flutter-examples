import 'package:costOfLiving/components/transaction.dart';
import 'package:costOfLiving/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListView extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionListView(this._transactions);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      if (index >= _transactions.length) {
        return null;
      }
      return TransactionView(_transactions[index]);
    });
  }
}