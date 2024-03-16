import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class KycUnsuccessful extends StatelessWidget {
  const KycUnsuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.dangerous_outlined,
              size: 150.sp,
              color: Colors.red,
            ),
            Gap(10.h),
            Text(
              "KYC Unsuccessful",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gap(20.h),
            Text(
              "We were unalbe to find matching faces in the images you provided. Please try again.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
