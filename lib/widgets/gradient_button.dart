import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302.sp,
      height: 58.sp,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xfe004385),
            Color(0xfe38D200),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          text,
          style: GoogleFonts.lato(
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
