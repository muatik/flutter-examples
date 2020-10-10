import 'package:flutter/material.dart';
import 'package:inventory/components/entry_image_viewer.dart';
import 'package:inventory/components/entry_title.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: [
      EntryImageViewer(
        swipeImage: false,
      ),
      EntryTitle()
    ]);
  }
}
