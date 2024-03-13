import 'package:e_kyc_app/auth/otp_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _verificationInProgress = false;

  final OTPAuthClass _otpAuthClass = OTPAuthClass();

  // use this function to check the OTP and proceed to the next screen
  void _checkOTP(String enteredOTP) {
    bool res = _otpAuthClass.verifyOTP(_otpController.text);
    if (res) {
      // OTP correct
      print(res);
    } else {
      // OTP incorrect
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Login'),
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
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verificationInProgress
                    ? null
                    : () {
                        _otpAuthClass.sendOTP(_phoneNumberController.text);
                      },
                child: _verificationInProgress
                    ? const CircularProgressIndicator()
                    : const Text('Send OTP'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter OTP',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _checkOTP(_otpController.text);
                },
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
