import 'package:flutter/material.dart';
import 'package:inventory/providers/entry.dart';
import 'package:provider/provider.dart';

class EntryCounterBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.yellow),
        child: Text('3'));
  }
}
