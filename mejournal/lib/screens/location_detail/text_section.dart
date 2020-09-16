import 'dart:ui';

import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String _title, _body;

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(_title, style: Theme.of(context).textTheme.headline5)
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Text(_body)
        )
      ]
    );
  }
}
