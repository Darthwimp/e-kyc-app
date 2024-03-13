import 'package:e_kyc_app/adi/splash.dart';
import 'package:e_kyc_app/login/enter_otp.dart';
import 'package:e_kyc_app/login/enter_phone_number.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> routes = {
  "/" :(context) => const EnterPhoneNumber(),
  "/enter-otp" : (context) => const EnterOTP(),
  "/splash" : (context) => const Splash(),  
};