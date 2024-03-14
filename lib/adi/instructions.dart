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
        title: Text('Instructions'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Aadhar'.tr()),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text('Room'.tr()),
          ),
          SizedBox(height: 10.h),
          Center(
            child: GradientButton(
                text: "Next",
                onPressed: () {
                  Navigator.pushNamed(context, "/camera-screen");
                }),
          )
        ],
      ),
    );
  }
}
