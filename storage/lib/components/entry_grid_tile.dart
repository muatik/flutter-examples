import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/providers/entry.dart';

class EntryGridTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Image.asset(
              'assets/images/box.jpeg',
              fit: BoxFit.cover,
            )),
            Container(
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
                )),
            EntryStorageTags()
          ]),
    );
  }
}

class EntryStorageTags extends StatelessWidget {
  tag(String storage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
          // labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          backgroundColor: Colors.pink[50],
          label: Text('#$storage ')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return Row(children: [...entry.storage.map((e) => tag(e)).toList()]);
  }
}
