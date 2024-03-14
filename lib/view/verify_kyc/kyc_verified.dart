import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:easy_localization/easy_localization.dart';
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
            Center(child: Image.asset("assets/images/success.png")),
            Gap(20.h),
            Text(
              'Congrats'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 35.sp),
            ),
            Gap(20.h),
            Text(
              'desc3'.tr(),
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
