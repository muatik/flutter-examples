import 'package:flutter/material.dart';

// it is stateful because the form can be shown in a modal 
// that may cause re-rendering 
class TransactionForm extends StatefulWidget {
  final Function(String, int) _onFormSubmit;
  TransactionForm(this._onFormSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  _handleFormSubmit() {
    int amount = int.tryParse(_amountController.text);
    widget._onFormSubmit(_titleController.text, amount);
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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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