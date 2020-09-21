import 'package:flutter/material.dart';
import 'package:costOfLiving/transaction.dart';

class TransactionView extends StatelessWidget {
  final Transaction _transaction;

  TransactionView(this._transaction);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _transaction.title, 
        ),
      subtitle: Text(_transaction.date.toString()),
      trailing: Text(
        _transaction.amount.toString(),
        style: TextStyle(
          color: Colors.blue,
          fontSize: 17,
          fontWeight: FontWeight.bold
        )
      ),
    );
    // return Container(
    //   // decoration: BoxDecoration(
    //   //   border: Border.all(color: Colors.black, width: 1),
    //   // ),
    //   // padding: EdgeInsets.all(10),
    //   // margin: EdgeInsets.symmetric(vertical: 10),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       _buildDescriptionView(_transaction),
    //       _buildAmountView(_transaction), 
    //     ],
    //   )
    // );
  }

  static Widget _buildAmountView(transaction) => Text(transaction.amount.toString());
  
  static Widget _buildDescriptionView(transaction) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(transaction.title),
      Text(transaction.data.toString()),
    ],
  );

}