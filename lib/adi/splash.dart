import 'package:e_kyc_app/adi/provider.dart';
import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String selectedContainer = '';

  void selectContainer(String container) {
    setState(() {
      selectedContainer = container;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 59.0.sp),
              child: Text(
                "Choose your language",
                style: GoogleFonts.lato(
                  fontSize: 22.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0.sp, bottom: 20.0.sp),
              child: SizedBox(
                width: 293.sp,
                child: Text(
                  "Select your preferred chat language to proceed",
                  style: GoogleFonts.lato(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: buildContainer('English', 'en', 'US'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: buildContainer('हिन्दी', 'hi', 'IN'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: buildContainer('বাংলা', 'bn', 'IN'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: buildContainer('मराठी', 'mr', 'IN'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: buildContainer('தமிழ்', 'ta', 'IN'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 180.0.sp),
              child: GradientButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String text, String a, String b) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainer = text;
        });
        languageProvider.changeLanguage(Locale(a, b));
      },
      child: Container(
        width: 293,
        height: 50,
        decoration: BoxDecoration(
          color: selectedContainer == text ? Color(0xFFC4E2FF) : Colors.white,
          border: Border.all(
              color: selectedContainer == text
                  ? Color(0xFF0076EB)
                  : Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  color: selectedContainer == text
                      ? Color(0xFF0076EB)
                      : Color(0xFF8C8C8C),
                ),
              ),
              if (selectedContainer == text)
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0076EB),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                )
              else
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 1, color: const Color(0xFFDDDDDD)),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ) // Placeholder for the circular button
            ],
          ),
        ),
      ),
    );
  }
}
