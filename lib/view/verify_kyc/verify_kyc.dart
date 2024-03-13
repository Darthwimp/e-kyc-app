import 'package:e_kyc_app/widgets/document_verify_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyKyc extends StatelessWidget {
  const VerifyKyc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                Image.asset("assets/logo/sc-logo-small.png")
              ],
            ),
            Image.asset("assets/images/assthetic-card.png"),
            Text('lverify'.tr(), style: Theme.of(context).textTheme.titleLarge),
            Text(
              'desc2'.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            ),
            DocumentVerifyCard(
              icon: Icons.badge_outlined,
              title: 'procedure1'.tr(),
              subtitle: "To check if your personal information is correct",
            ),
            DocumentVerifyCard(
              icon: Icons.camera_alt_outlined,
              title: 'procedure2'.tr(),
              subtitle: "To match your face to your ID photo",
            ),
            Text(
              'why need'.tr(),
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
