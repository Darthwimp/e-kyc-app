import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class KycVerified extends StatelessWidget {
  const KycVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/logo/sc-logo-small.png"),
              ],
            ),
            Image.asset("assets/images/success.png"),
            Gap(20.h),
            Text(
              "Congrats,\n you're in!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 35.sp),
            ),
            Gap(20.h),
            Text(
              "Thank you! Your account is being verified, you will be notified by SMS shortly.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Gap(90.h),
            const GradientButton(text: "Continue")
          ],
        ),
      ),
    );
  }
}
