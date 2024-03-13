import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPAuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationId = '';

  Future<void> OTPAuth(BuildContext context, String phNo) async {
    final String phoneNumber = phNo;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationID, int? resendToken) {
        verificationId = verificationId;
        print("OTP sent! $verificationID $resendToken");
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationId = verificationId;
        print("Auto retrieval timeout! $verificationID");
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    var credentials =
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
    return credentials.user != null ? true : false;
  }
}
