import 'package:e_kyc_app/widgets/gradient_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Instruction extends StatelessWidget {
  const Instruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions',style: TextStyle(fontSize: 25)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Aadhar'.tr()),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50.0),
            child: Image.asset("assets/images/aadhar-card.png"),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text('Room'.tr()),
          ),
          SizedBox(height: 30.h),
          Center(
            child: GradientButton(
                text: "Proceed",
                onPressed: () {
                  Navigator.pushNamed(context, "/camera-screen");
                }),
          )
        ],
      ),
    );
  }
}
