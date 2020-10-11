import 'package:flutter/material.dart';
import 'package:storage/providers/entry.dart';

class EntryTitleBar extends StatelessWidget {
  const EntryTitleBar({
    Key key,
    @required this.entry,
  }) : super(key: key);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              entry.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Icon(
              Icons.alarm_on,
              color: Colors.orange,
            )
          ],
        ));
  }
}
