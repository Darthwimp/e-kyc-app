import 'package:e_kyc_app/auth/otp_auth.dart';
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
