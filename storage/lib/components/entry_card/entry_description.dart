import 'package:flutter/material.dart';
import 'package:storage/providers/entry.dart';

class EntryDescriptionView extends StatelessWidget {
  const EntryDescriptionView({
    Key key,
    @required this.entry,
  }) : super(key: key);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(entry.description),
    );
  }
}
