import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/providers/entry.dart';

class EntryStorageTags extends StatelessWidget {
  const EntryStorageTags({
    Key key,
    @required this.entry,
  }) : super(key: key);

  final Entry entry;

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
    return Row(children: [...entry.storage.map((e) => tag(e)).toList()]);
  }
}
