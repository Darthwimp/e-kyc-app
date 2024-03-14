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
      appBar: AppBar(
        title: Text('Biometric Input'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Biometric Data: $_biometricData'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Capture Biometric'),
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
      });
    } else {
      setState(() {
        _biometricData = 'Biometric capture failed.';
      });
    }
  }
}
