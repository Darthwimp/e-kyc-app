import 'package:e_kyc_app/adi/splash.dart';
import 'package:e_kyc_app/view/chat/chat_onBoarding.dart';
import 'package:e_kyc_app/view/login/enter_otp.dart';
import 'package:e_kyc_app/view/login/enter_phone_number.dart';
import 'package:e_kyc_app/view/verify_kyc/kyc_verified.dart';
import 'package:e_kyc_app/view/verify_kyc/verify_kyc.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  "lang": (context) => const Splash(),
  "/": (context) => const EnterPhoneNumber(),
  "/enter-otp": (context) => const EnterOTP(),
  "/chat-onBoard": (context) => const ChatOnboard(),
  "/chat-onBoard/chat-interface/verify-kyc": (context) => const VerifyKyc(),
  "/chat-onBoard/chat-interface/kyc-verified": (context) => const KycVerified(),
};
