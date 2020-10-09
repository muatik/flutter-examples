import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventory/components/image_form.dart';
import 'package:inventory/providers/inventory.dart';
import 'package:provider/provider.dart';

class NewLocationScreen extends StatefulWidget {
  @override
  _NewLocationScreenState createState() => _NewLocationScreenState();
}

class _NewLocationScreenState extends State<NewLocationScreen> {
  Inventory inventory;
  String path;
  bool isProcessing = false;

  List<File> _imageFiles;
  final _nameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _extractArg(BuildContext context, String name) {
    final args =
        (ModalRoute.of(context).settings.arguments as Map<String, String>);
    return args != null && args.containsKey(name) ? args[name] : null;
  }

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

    try {
      setState(() {
        isProcessing = true;
      });
      await inventory.addLocationByPath(path, name, _imageFiles);
      Navigator.of(context).pop(true);
    } catch (e) {
      _showProcessStatus(context, 'error: ' + e.toString());
    }
    setState(() {
      isProcessing = false;
    });
  }

  void _showProcessStatus(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _nameTextController,
                enabled: !isProcessing,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ImageForm(maxLength: 4, onChange: _onImagesChange)),
              isProcessing
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: () => isProcessing ? null : _onSubmit(context),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Save'),
                    )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    inventory = Provider.of<Inventory>(context);
    path = _extractArg(context, 'path');

    return Scaffold(
        appBar: AppBar(
          title: Text("New Location"),
        ),
        body: Builder(
            builder: (context) => Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: path == null
                      ? Text('path is not provided in arguments')
                      : _buildForm(context),
                )));
  }
}
