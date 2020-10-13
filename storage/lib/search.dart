import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  final Function onQueryChanged;

  SearchForm(this.onQueryChanged);

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _queryController,
            textInputAction: TextInputAction.search,
            onChanged: widget.onQueryChanged,
            decoration: InputDecoration(
              hintText: 'search items',
              border: OutlineInputBorder(),
              suffixIcon: _queryController.text.isEmpty
                  ? Icon(Icons.search)
                  : IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _queryController.text = '';
                        widget.onQueryChanged('');
                      }),
            ),
          ),
        ),
      )
    ]));
  }
}
