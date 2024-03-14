import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> compareImages(File image1, File image2) async {
  final url = Uri.parse("https://api.luxand.cloud/photo/similarity");
  final token = "c4265864de90473e90781a0d43c7bbb5"; // Replace with your Luxand API token
  final threshold = "0.8";

  var request = http.MultipartRequest('POST', url)
    ..fields['threshold'] = threshold
    ..headers['token'] = token
    ..files.add(await http.MultipartFile.fromPath('face1', image1.path))
    ..files.add(await http.MultipartFile.fromPath('face2', image2.path));

  var response = await request.send();
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print('Failed to compare images: ${response.reasonPhrase}');
  }
}