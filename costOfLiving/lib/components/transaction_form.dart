import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final Function(String, int) _onFormSubmit;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  TransactionForm(this._onFormSubmit);
  
  _handleFormSubmit() {
    int amount = int.tryParse(_amountController.text);
    _onFormSubmit(_titleController.text, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "what cost?",
                border: OutlineInputBorder(),
              ), 
              controller: _titleController,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder()
              ),
              controller: _amountController,
            ),
          ),
          RaisedButton(
            child: Text("Add cost"),
            onPressed: _handleFormSubmit
          )
        ],
      ),
    );
  }
}