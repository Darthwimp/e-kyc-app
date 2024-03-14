import 'dart:typed_data';

import 'package:video_thumbnail/video_thumbnail.dart';

Future<dynamic> extractFrame(String videoPath) async {
  final thumbnail = await VideoThumbnail.thumbnailData(
    video: videoPath,
    imageFormat: ImageFormat.JPEG,
    maxHeight: 200, // Adjust this according to your needs
    quality: 25, // Adjust this according to your needs
  );
  return thumbnail;
}