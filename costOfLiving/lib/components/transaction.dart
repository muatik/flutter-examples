import 'package:flutter/material.dart';
import 'package:costOfLiving/transaction.dart';

class TransactionView extends StatelessWidget {
  final Transaction _transaction;

  TransactionView(this._transaction);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          _buildAmountView(), 
          _buildDescriptionView()
        ],
      )
    );
  }

  Widget _buildAmountView() => Text(_transaction.amount.toString());
  
  Widget _buildDescriptionView() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(_transaction.title),
      Text(_transaction.data.toString()),
    ],
  );

}