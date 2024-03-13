import 'package:e_kyc_app/auth/otp_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  String _verificationId = "";
  bool _verificationInProgress = false;

  final OTPAuthClass _otpAuthClass = OTPAuthClass();

  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _verificationInProgress = true;
    });

    try {
      print('Phone number: ${_phoneNumberController.text}');
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${_phoneNumberController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          // Authentication successful, navigate to next screen
          // For now, just print a message
          print('Authentication successful!');
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Phone number verification failed. Code: ${e.code}');
          // Handle verification failure, if necessary
        },
        codeSent: (String verificationId, int? resendToken) {
          print(
              "Code sent to ${_phoneNumberController.text} code: $verificationId");
          setState(() {
            _verificationInProgress = false;
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationInProgress = false;
            _verificationId = verificationId;
          });
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      print('Failed to verify phone number: $e');
      // Handle verification failure, if necessary
    }
  }

  Future<void> _signInWithPhoneNumber() async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      // Authentication successful, navigate to next screen
      // For now, just print a message
      print('Authentication successful!');
    } catch (e) {
      print('Failed to sign in: $e');
      // Handle sign-in failure, if necessary
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verificationInProgress
                    ? null
                    : () {
                        _otpAuthClass.sendOTP("8676874867");
                      },
                child: _verificationInProgress
                    ? CircularProgressIndicator()
                    : Text('Send OTP'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
