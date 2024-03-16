import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseImageUploader extends StatefulWidget {
  @override
  _FirebaseImageUploaderState createState() => _FirebaseImageUploaderState();
}

class _FirebaseImageUploaderState extends State<FirebaseImageUploader> {
  late FirebaseStorage _storage;
  late TextEditingController _controller;
  File? _imageFile;
  String? _uploadedImageUrl;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) {
      setState(() {
        _storage = FirebaseStorage.instance;
      });
    });
    _controller = TextEditingController();
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    try {
      String fileName = _imageFile!.path.split('/').last;
      Reference ref = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = ref.putFile(_imageFile!);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _uploadedImageUrl = downloadUrl;
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Image Uploader'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20.0),
            _imageFile != null
                ? Image.file(_imageFile!)
                : Text('No image selected'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            SizedBox(height: 20.0),
            _uploadedImageUrl != null
                ? Text('Uploaded Image URL: $_uploadedImageUrl')
                : Container(),
          ],
        ),
      ),
    );
  }
}
