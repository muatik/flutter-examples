import 'package:flutter/material.dart';
import 'package:inventory/components/image_form.dart';
import 'package:inventory/providers/inventory.dart';
import 'package:provider/provider.dart';

enum LocationFormMode { NEW, UPDATE }

class LocationFormScreen extends StatefulWidget {
  @override
  _LocationFormScreenState createState() => _LocationFormScreenState();
}

class _LocationFormScreenState extends State<LocationFormScreen> {
  Inventory inventory;
  String path;
  bool isProcessing = false;

  LocationFormMode _mode;
  bool _isLoaded = false;
  String _locationId;
  List _imageFiles = [];
  TextEditingController _nameTextController;
  final _formKey = GlobalKey<FormState>();

  dynamic _extractArg(BuildContext context, String name) {
    final args =
        (ModalRoute.of(context).settings.arguments as Map<String, dynamic>);
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
      if (_mode == LocationFormMode.UPDATE) {
        print(_locationId);
        await inventory.updateLocationByPath(_locationId, name, _imageFiles);
      } else {
        await inventory.addLocationByPath(path, name, _imageFiles);
      }
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
                  child: ImageForm(
                      initialImages: _imageFiles,
                      maxLength: 4,
                      onChange: _onImagesChange)),
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
    _mode = _extractArg(context, 'mode');
    print('building location form: ${path}, ${_mode}');
    final location = inventory.getByPath(path);

    // TODO: name edit box resets itself.
    // TODO: to store id or to store entry itself?
    if (_isLoaded == false && _mode == LocationFormMode.UPDATE) {
      setState(() {
        _nameTextController = new TextEditingController(text: location.name);
        _imageFiles = location.images;
        _isLoaded = true;
        _locationId = location.id;
      });
    } else if (!_isLoaded) {
      setState(() {
        _nameTextController = new TextEditingController();
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(_mode == LocationFormMode.UPDATE
              ? "Update Location"
              : "New Location"),
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
