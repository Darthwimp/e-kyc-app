import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
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
            top: 135.sp,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify it's you",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(10.h),
                  Text(
                    "Enter the OTP sent",
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
            bottom: 50.sp,
            left: 40.sp,
            right: 40.sp,
            child: SizedBox(
              height: 56.h,
              width: 300.w,
              child: GradientButton(
                text: "Submit",
                onPressed: () {
                  print("clicked!");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
