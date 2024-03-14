import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricScreen extends StatefulWidget {
  @override
  _BiometricScreenState createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _biometricData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Fingerprint',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
                width: 170,
                height: 170,
                child: Image.asset("assets/images/fingerprint.png")),
            Text(
              '$_biometricData',
              style: TextStyle(
                  color: _biometricData == 'Biometric capture failed.'
                      ? Colors.red
                      : Colors.green),
            ),
            const SizedBox(height: 20),
            GradientButton(
              text: 'Capture Biometric'.tr(),
              onPressed: _authenticate,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    // Check if biometrics are available on the device
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    if (!canCheckBiometrics) {
      print('Biometrics not available on this device.');
      return;
    }

    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to capture biometric data',
        // useErrorDialogs:
        //     false, // Set to false to only allow biometric authentication
      );
    } catch (e) {
      print('Error: $e');
    }

    if (authenticated) {
      setState(() {
        _biometricData = 'Biometric captured successfully!';
        Future.delayed(const Duration(seconds: 1)).then((value) {
          Navigator.pushNamed(
              context, "/chat-onBoard/chat-interface/kyc-verified");
        });
      });
    } else {
      setState(() {
        _biometricData = 'Biometric capture failed.';
      });
    }
  }
}
