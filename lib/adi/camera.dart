import 'dart:io';
import 'dart:async';
import 'package:e_kyc_app/view/verify_kyc/verify_kyc.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late String _imageLocation = '';

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);

    return _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _captureAndSaveImage() async {
    try {
      final XFile picture = await _controller.takePicture();
      final String imagePath = picture.path;

      // Save the location of the captured image
      setState(() {
        _imageLocation = imagePath;
      });
      return imagePath;
    } catch (e) {
      print('Error capturing image: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right:
                      0, // Added right property to make the container adapt its width
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Capture and save image when button is pressed
                          final imagePath = await _captureAndSaveImage();

                          print('Image saved: $imagePath');

                          // Navigate to new screen with image location
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // builder: (context) => ImagePage(imagePath: imagePath),
                              builder: (context) => const VerifyKyc(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
