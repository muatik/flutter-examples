import 'dart:ffi';

import 'package:flutter/material.dart';

getArg(context, key) {
  final args =
      (ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>);
  return args != null && args.containsKey(key) ? args[key] : null;
}

showProcessStatus(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
}

shownConfirmDialog(BuildContext context, String title, String message) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          new FlatButton(
            child: new Text("No"),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          new FlatButton(
            child: new Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
