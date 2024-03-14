import 'package:twilio_flutter/twilio_flutter.dart';
import 'dart:math';

class OTPAuthClass {
  final Random _random = Random();

  var otp = "";

  final TwilioFlutter _twilioFlutter = TwilioFlutter(
    accountSid: "ACbc9740375c6ae98472a8f4f14fb0ba21",
    authToken: "7f108d2cc80a3ad6dfdc676a3101c8fe",
    twilioNumber: "+16503833791",
  );

  Future<void> sendOTP(String number) async {
    otp = "";
    for (var i = 0; i < 5; i++) {
      otp += _random.nextInt(9).toString();
    }
    await _twilioFlutter.sendSMS(
      toNumber: "+91$number",
      messageBody: "Your OTP is $otp",
    );
  }

  bool verifyOTP(String enteredOTP) {
    if (enteredOTP == otp) {
      return true;
    } else {
      return false;
    }
  }

  void sendVeri() {
    _twilioFlutter.sendSMS(
        toNumber: "+918249422735",
        messageBody: "Your eKYC Verification is unsuccessful.");
  }
}
