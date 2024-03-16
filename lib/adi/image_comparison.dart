import 'package:flutter/material.dart';
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

  void imageComparisonApiCall(BuildContext context) async {
    // var url = "https://autokyc.onrender.com/imageComparison";
    // var body = {
    //   "image1": '$aadharUrl',
    //   "image2": '$faceUrl',
    // };
    try {
      // int jpgIndex1 = aadharUrl!.indexOf(".jpg");
      // int jpgIndex2 = faceUrl!.indexOf(".jpg");
      // String jpgAadharUrl = aadharUrl!.substring(0, jpgIndex1 + 4);
      // String jpgFaceUrl = faceUrl!.substring(0, jpgIndex2 + 4);
      // print(jpgFaceUrl);
      // print(jpgAadharUrl);
      var response = await http.get(Uri.parse("https://autokyc.onrender.com/imageComparison?image1=$aadharUrl&image2=$faceUrl"));
      // var response = await http.post(Uri.parse("https://autokyc.onrender.com/imageComparison?image1=https://upload.wikimedia.org/wikipedia/commons/0/03/Jeff_Bezos_visits_LAAFB_SMC_%283908618%29_%28cropped%29.jpeg&image2=https://upload.wikimedia.org/wikipedia/commons/9/99/Elon_Musk_Colorado_2022_%28cropped2%29.jpg"));
      print(response.body);
      if(response.body == 1.toString()){
        Navigator.pushNamed(context, "/signature");
      }
      else{
        Navigator.pushNamed(context, "/kyc-unsuccessful");
      }
    } catch (e) {
      print("error sending post request: $e");
    }
  }
}
