import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String path = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['path'];
    return Container(child: Text('Item Screen $path'));
  }
}
