import 'package:flutter/material.dart';
import 'package:costOfLiving/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionView extends StatelessWidget {
  final Transaction _transaction;

  TransactionView(this._transaction);
  
  @override
  Widget build(BuildContext context) =>
    ListTile(
      title: buildTitle(),
      subtitle: buildDate(),
      trailing: buildAmount(),
    );
  

  Text buildTitle() => Text(_transaction.title.toString());

  Text buildDate() => Text(DateFormat('E, d MMM y').format(_transaction.date));

  Text buildAmount() {
    return Text(
      _transaction.getFormattedAmount(),
      style: TextStyle(
        color: Colors.blue,
        fontSize: 17,
        fontWeight: FontWeight.bold
      )
    );
  }

}