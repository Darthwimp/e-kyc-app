import 'package:e_kyc_app/utils/routes/routes.dart';
import 'package:e_kyc_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData(),
          initialRoute: "/",
          routes: routes,
        );
      },
    );
  }
}