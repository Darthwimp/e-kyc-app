import 'package:e_kyc_app/widgets/document_verify_card.dart';
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
            Text("Let's verify KYC",
                style: Theme.of(context).textTheme.titleLarge),
            Text(
              "Please submit the following documents to verify your profile.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            ),
            const DocumentVerifyCard(
              icon: Icons.badge_outlined,
              title: "Take a valid picture of your ID",
              subtitle: "To check if your personal information is correct",
            ),
            const DocumentVerifyCard(
              icon: Icons.camera_alt_outlined,
              title: "Take a selfie of yourself",
              subtitle: "To match your face to your ID photo",
            ),
            Text(
              "Why is this needed?",
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
