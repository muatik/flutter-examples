import 'package:flutter/material.dart';

import '../search.dart';

class SearchBar extends StatelessWidget {
  final Function onQueryChange;

  SearchBar(this.onQueryChange);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 36.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0))
          ],
        ),
        child: SearchForm(onQueryChange));
  }
}
