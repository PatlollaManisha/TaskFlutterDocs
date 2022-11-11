import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  const ImagePickerClass({super.key});

  @override
  State<ImagePickerClass> createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("ImagePicker"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Column(
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://cdn-icons-png.flaticon.com/512/5765/5765299.png"),
                  ),
                  onDoubleTap: () {
                    showAlert("Do you want to update Profile Picture");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showButtons();
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("NO"))
            ],
          );
        });
  }

  showButtons() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Profile Picture"),
          actions: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Text("Take a Picture")),
                ElevatedButton(
                    onPressed: () {
                      getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Text("Upload from gallery")),
              ],
            ),
          ],
        );
      },
    );
  }

  Future getImage(ImageSource type) async {
    final img = await ImagePicker().pickImage(source: type);
    if (img == null) return;
    setState(() {
      this._image = File(img.path);
    });
  }
}
