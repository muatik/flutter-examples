import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class ImageForm extends StatefulWidget {
  final Function onChange;
  final int maxLength;
  final List initialImages;

  ImageForm(
      {this.maxLength = 10, this.onChange, this.initialImages = const []});

  @override
  _ImageFormState createState() => _ImageFormState(
      onChange: this.onChange,
      maxLength: this.maxLength,
      initialImages: this.initialImages);
}

class _ImageFormState extends State<ImageForm> {
  List _images = [];
  final _picker = ImagePicker();

  Function onChange;
  int maxLength;
  List initialImages;

  _ImageFormState(
      {@required this.onChange, @required this.maxLength, this.initialImages})
      : _images = initialImages;

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
    onChange(_images);
  }

  void deleteImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
    onChange(_images);
  }

  Widget buildImageView(int index) {
    return Stack(fit: StackFit.expand, children: [
      Image.file(
        _images[index],
        fit: BoxFit.cover,
      ),
      Positioned(
        top: 0,
        left: 0,
        child: IconButton(
            icon: Icon(Icons.delete, color: Colors.white70),
            onPressed: () => deleteImage(index)),
      ),
    ]);
  }

  Widget buildPreview() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2 / 3),
        itemCount: _images.length,
        itemBuilder: (context, index) =>
            Container(margin: EdgeInsets.all(2), child: buildImageView(index)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_images.isNotEmpty) buildPreview(),
        RaisedButton.icon(
            onPressed: _images.length >= maxLength ? null : () => getImage(),
            icon: Icon(Icons.camera_alt),
            label: Text('upload image'))
      ],
    );
  }
}
