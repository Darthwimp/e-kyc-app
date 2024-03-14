import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 380.w,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
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
    );
  }
}
