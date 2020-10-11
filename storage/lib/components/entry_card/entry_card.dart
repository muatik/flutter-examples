import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/providers/entry.dart';

import 'entry_storage.dart';
import 'entry_description.dart';
import 'entry_photo_view.dart';
import 'entry_title_bar.dart';

class EntryCard extends StatelessWidget {
  final bool descriptionVisible;

  final bool photoSwipe;

  EntryCard({this.descriptionVisible = false, this.photoSwipe = false});

  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EntryPhotoView(
            entry: entry,
            swipeImage: photoSwipe,
          ),
          EntryTitleBar(entry: entry),
          EntryStorageTags(entry: entry),
          if (descriptionVisible) EntryDescriptionView(entry: entry)
        ]);
  }
}
