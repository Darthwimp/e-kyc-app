import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class EnterOTP extends StatelessWidget {
  const EnterOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50.sp,
            left: 30.sp,
            child: Container(
              height: 36.sp,
              width: 31.sp,
              child: Image.asset(
                'assets/logo/logo-without-text.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 135.sp,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 312.sp,
                    child: Text(
                      'Verify IY'.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    'E OTP'.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Gap(30.h),
                  SizedBox(
                    height: 60.h,
                    width: 310.w,
                    child: const Pinput(
                      length: 5,
                    ),
                  )
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: 120.sp,
            left: 40.sp,
            right: 40.sp,
            child: SizedBox(
              height: 56.h,
              width: 300.w,
              child: GradientButton(
                text: 'Verify OTP'.tr(),
                onPressed: () {
                  print("clicked!");
                  Navigator.pushNamed(context, "/chat-onBoard");
                },
              ),
            ),
          ),
          Positioned(
            bottom: 50.sp,
            left: 40.sp,
            right: 40.sp,
            child: SizedBox(
              height: 56.h,
              width: 300.w,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0), // Set elevation to 0
                  backgroundColor: MaterialStateProperty.all(Colors.transparent), // Set background color to transparent
                ),
                onPressed: () {
                  // Resend OTP logic goes here
                },
                child: Text(
                  'Resend OTP'.tr(),
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
