import 'package:flutter/material.dart';
import 'package:storage/components/entry_form.dart';

import '../args.dart';

enum EntryFormMode { NEW, UPDATE }

class EntryFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EntryFormMode mode = getArg(context, 'mode');

    return Scaffold(
      appBar: AppBar(
        title:
            Text(mode == EntryFormMode.UPDATE ? 'Update entry' : 'New entry'),
      ),
      body: EntryForm(),
    );
  }
}
