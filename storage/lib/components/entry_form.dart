import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/providers/inventory.dart';
import 'package:storage/screens/entry_form_screen.dart';

import '../args.dart';
import 'image_form.dart';

class EntryForm extends StatefulWidget {
  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  EntryFormMode _mode;
  bool _isInProgress = false;
  bool _isLoaded = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameTextController;
  TextEditingController _descriptionTextController;
  TextEditingController _storageTextController;

  Inventory _inventory;
  List _imageFiles = [];
  String _entryId;

  _onImagesChange(imageFiles) {
    setState(() {
      _imageFiles = imageFiles;
    });
  }

  _onSubmit(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final name = _nameTextController.text;
    final description = _descriptionTextController.text;
    final storage = _storageTextController.text;

    try {
      setState(() {
        _isInProgress = true;
      });
      if (_mode == EntryFormMode.NEW) {
        await _inventory.add(
            name: name,
            description: description,
            storage: storage.split(','),
            photos: _imageFiles);
      } else {
        await _inventory.update(
            id: _entryId,
            name: name,
            description: description,
            storage: storage.split(','),
            photos: _imageFiles);
      }
      Navigator.of(context).pop(true);
    } catch (e) {
      showProcessStatus(context, 'error: ' + e.toString());
    }
    setState(() {
      _isInProgress = false;
    });
  }

  assertNotEmpty(String message) {
    return (value) {
      if (value.isEmpty) {
        return message;
      }
      return null;
    };
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTextController,
                  enabled: !_isInProgress,
                  validator: assertNotEmpty('enter name'),
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: _descriptionTextController,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  enabled: !_isInProgress,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                TextFormField(
                  controller: _storageTextController,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  enabled: !_isInProgress,
                  validator: assertNotEmpty('specify where it is located'),
                  decoration: InputDecoration(
                    labelText: 'Storage',
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ImageForm(
                        initialImages: _imageFiles,
                        maxLength: 4,
                        onChange: _onImagesChange)),
                _isInProgress
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        onPressed: () =>
                            _isInProgress ? null : _onSubmit(context),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('Save'),
                      )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    _inventory = Provider.of<Inventory>(context);
    _mode = getArg(context, 'mode') ?? EntryFormMode.NEW;
    _entryId = getArg(context, 'entryId');

    // TODO: name edit box resets itself.
    // TODO: to store id or to store entry itself?
    if (_isLoaded == false && _mode == EntryFormMode.UPDATE) {
      final entry = _inventory.findById(_entryId);
      setState(() {
        _nameTextController = new TextEditingController(text: entry.name);
        _descriptionTextController =
            new TextEditingController(text: entry.description);
        _storageTextController =
            new TextEditingController(text: entry.storage.join(','));
        _imageFiles = entry.photos;
        _entryId = entry.id;
        _isLoaded = true;
      });
    } else if (_isLoaded == false) {
      setState(() {
        _isLoaded = true;
        _nameTextController = new TextEditingController();
        _descriptionTextController = new TextEditingController();
        _storageTextController = new TextEditingController();
      });
    }

    return _buildForm(context);
  }
}
