import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:e_kyc_app/widgets/phone_number_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EnterPhoneNumber extends StatelessWidget {
  const EnterPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(160.sp),
              Image.asset("assets/logo/logo-without-text.png"),
              Gap(20.h),
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
              const PhoneNumberField(),
              Gap(200.sp),
              GradientButton(
                  text: 'OTP'.tr(),
                  onPressed: () {
                    Navigator.pushNamed(context, "/enter-otp");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
