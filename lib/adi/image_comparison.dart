import 'package:http/http.dart' as http;

class ImageComparisonRequestModel {
  static String? aadharUrl = "";
  static String? faceUrl = "";
  void setFaceUrl(String? url) {
    faceUrl = url;
  }

  void setAadharUrl(String? url) {
    aadharUrl = url;
  }

  void imageComparisonApiCall() {
    var body = {
      "image1": ,
      "image2"
    }
    http.post(url)
  }
}
