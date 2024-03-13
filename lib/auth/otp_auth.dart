import 'package:twilio_flutter/twilio_flutter.dart';

class OTPAuthClass {
  final TwilioFlutter _twilioFlutter = TwilioFlutter(
    accountSid: "ACbc9740375c6ae98472a8f4f14fb0ba21",
    authToken: "7f108d2cc80a3ad6dfdc676a3101c8fe",
    twilioNumber: "+16503833791",
  );

  Future<void> sendOTP(String number) async {
    await _twilioFlutter.sendSMS(
      toNumber: "+91$number",
      messageBody: "Your OTP is 1234",
    );
  }
}
