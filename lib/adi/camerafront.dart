import 'dart:async';
import 'package:e_kyc_app/adi/video_thumb.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CameraScreenFront extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreenFront> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  int _timerCount = 10;
  late String _videoLocation; // Variable to hold the video location

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
    _createVideosDirectory(); // Create videos directory when the screen initializes
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    _controller = CameraController(frontCamera, ResolutionPreset.high);

    return _controller.initialize();
  }

  Future<void> _createVideosDirectory() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final videosDirectory = Directory('${appDirectory.path}/Videos');
    if (!await videosDirectory.exists()) {
      await videosDirectory.create(recursive: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startVideoRecording() async {
    if (!_controller.value.isInitialized || _isRecording) {
      return;
    }

    final Directory appDirectory = await getTemporaryDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String filePath = '$videoDirectory/${DateTime.now()}.mp4';

    try {
      await _controller.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
    } on CameraException catch (e) {
      print(e);
    }
  }

  void _stopVideoRecording() async {
    if (!_isRecording) {
      return;
    }

    try {
      final XFile videoFile = await _controller.stopVideoRecording();
      setState(() {
        _isRecording = false;
        _timerCount = 10; // Reset timer after stopping recording
      });

      // Get external storage directory
      final Directory? extDir = await getExternalStorageDirectory();
      if (extDir == null) {
        print('Failed to get external storage directory.');
        return;
      }

      // Move the recorded video file to the external storage directory
      final String storagePath = extDir.path;
      final String fileName = '${DateTime.now()}.mp4';
      final String newPath = '$storagePath/$fileName';
      await videoFile.saveTo(newPath);

      // Store the video location in the variable
      setState(() {
        _videoLocation = newPath;
      });

      // Print the video location
      print('Video saved: $_videoLocation');
      extractFrame(_videoLocation);
      // Navigate to a new screen after saving the video
      Navigator.pushNamed(context, "/verify-kyc");
    } on CameraException catch (e) {
      print(e);
    } on FileSystemException catch (e) {
      print(e);
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
                if (_isRecording)
                  Center(
                    child: Text(
                      '$_timerCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
        Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
              onPressed: () async {
                if (_isRecording) {
                  // If already recording, stop recording
                  _stopVideoRecording();
                } else {
                  // If not recording, start recording
                  await _initializeControllerFuture;
          
                  // Start video recording
                  _startVideoRecording();
          
                  // Start timer for 10 seconds
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    setState(() {
                      if (_timerCount <= 0) {
                        timer.cancel();
                        // Stop video recording after 10 seconds
                        _stopVideoRecording();
                      } else {
                        _timerCount--;
                      }
                    });
                  });
                }
              },
              child: Icon(
                _isRecording ? Icons.stop : Icons.camera_alt,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      
 
    );
  }
}

// class NewScreen extends StatelessWidget {
//   final String videoLocation;

//   const NewScreen({Key? key, required this.videoLocation}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Screen'),
//       ),
//       body: Center(
//         child: Text('Video Location: $videoLocation'),
//       ),
//     );
//   }
// }
