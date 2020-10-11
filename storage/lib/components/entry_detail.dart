import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/components/entry_card/entry_card.dart';
import 'package:storage/providers/entry.dart';
import 'package:storage/providers/inventory.dart';
import 'package:storage/routes.dart';
import 'package:storage/screens/entry_form_screen.dart';

import '../args.dart';

enum EntryDetailResult { DELETED }

class EntryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entry = Provider.of<Entry>(context);

    return Column(children: [
      Expanded(child: EntryCard(descriptionVisible: true, photoSwipe: true)),
      RaisedButton.icon(
          onPressed: () => onUpdateTab(context, entry.id),
          icon: Icon(Icons.edit),
          label: Text('Update')),
      RaisedButton.icon(
          color: Colors.red[400],
          onPressed: () => onDeleteTab(context, entry.id),
          icon: Icon(Icons.delete),
          label: Text('Delete'))
    ]);
  }

  onDeleteTab(BuildContext context, String id) async {
    bool confirmed = await shownConfirmDialog(context, 'Delete entry',
        'Do you want to delete the entry permenantly?');
    if (confirmed != true) {
      return;
    }

    final inventory = Provider.of<Inventory>(context, listen: false);
    try {
      show(context);
      await inventory.deleteById(id);
      Navigator.of(context).pop(EntryDetailResult.DELETED);
    } catch (e) {
      showProcessStatus(context, 'error: ${e.toString()}');
    }
    hide(context);
  }

  void hide(_context) {
    Navigator.of(_context).pop();
  }

  void show(_context) {
    showDialog(
        context: _context,
        barrierDismissible: false,
        child: _FullScreenLoader());
  }

  onUpdateTab(BuildContext context, String id) {
    Navigator.of(context).pushNamed(ROUTE_ENTRY_FORM,
        arguments: {'mode': EntryFormMode.UPDATE, 'entryId': id}).then((value) {
      if (value == true) {
        showProcessStatus(context, 'Updated');
      }
    });
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: Center(child: CircularProgressIndicator()));
  }
}
