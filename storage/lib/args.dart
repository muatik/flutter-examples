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
