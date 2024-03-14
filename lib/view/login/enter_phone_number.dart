import 'package:e_kyc_app/auth/otp_auth.dart';
import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:e_kyc_app/widgets/phone_number_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  final OTPAuthClass _otpAuthClass = OTPAuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50.sp),
              Image.asset("assets/logo/logo-without-text.png"),
              Gap(85.h),
              Text(
                'intro'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gap(20.h),
              Text(
                'mobile number'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(20.h),
              Container(
                height: 60.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: ' +91 0123456789',
                    hintStyle: GoogleFonts.lato(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xfe535353),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.spMin),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.0.sp, top: 320.sp),
                child: GradientButton(
                    text: 'OTP'.tr(),
                    onPressed: () {
                      _otpAuthClass.sendOTP(phoneNumberController.text);
                      print("clicked!");
                      Navigator.pushNamed(context, "/enter-otp");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
