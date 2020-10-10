import 'package:flutter/material.dart';
import 'package:inventory/providers/entry.dart';
import 'package:provider/provider.dart';

class EntryTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.black45),
      child: Text(
        '${entry.name}',
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
      ),
    );
  }
}
