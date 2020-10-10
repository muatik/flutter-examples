import 'package:flutter/material.dart';
import 'package:inventory/components/entry_counter_badge.dart';
import 'package:inventory/components/entry_title.dart';

import 'entry_image_viewer.dart';

class LocationCard extends StatelessWidget {
  final bool swipeImage;

  LocationCard({this.swipeImage = false});

  buildEntryTypeIcon() {
    return Positioned(
        top: 5,
        left: 5,
        child: Icon(
          Icons.folder,
          color: Colors.brown,
        ));
  }

  buildEntryCounterBadge() {
    return Positioned(bottom: 10, right: 10, child: EntryCounterBadge());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: [
      EntryImageViewer(swipeImage: swipeImage),
      buildEntryTypeIcon(),
      buildEntryCounterBadge(),
      EntryTitle()
    ]);
  }
}
