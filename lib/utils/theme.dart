import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(){
  return ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lato(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xfe535353),
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xfe535353),
      ),
    ),
  );
}