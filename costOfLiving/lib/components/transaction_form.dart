import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// it is stateful because the form can be shown in a modal 
// that may cause re-rendering 
class TransactionForm extends StatefulWidget {
  final Function(String, int, DateTime) _onFormSubmit;
  TransactionForm(this._onFormSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _handleFormSubmit() {
    int amount = int.tryParse(_amountController.text);
    widget._onFormSubmit(_titleController.text, amount, _selectedDate);
  }
  
  _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now().subtract(Duration(days: 365)), 
      lastDate: DateTime.now());
    if (pickedDate != null) {
      _selectedDate = pickedDate;
      _dateController.text = _formatDate(pickedDate);
    }
  }

  _formatDate(date) {
    return DateFormat.yMd().format(date).toString();
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: _formatDate(_selectedDate),
                    border: OutlineInputBorder(),
                  ),
                  controller: _dateController,
                )),
                FlatButton(
                  onPressed: _showDatePicker, 
                  child: Icon(Icons.date_range))
              ]
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