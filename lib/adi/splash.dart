import 'package:e_kyc_app/adi/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    //import the provider, so that we can use it on the screen we need
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //using tr() after the keyboard will do things automatically
            Text(
              'intro'.tr(),
              style: const TextStyle(fontSize: 20),
            ),

            ElevatedButton(
              onPressed: () {
                languageProvider.changeLanguage(const Locale('en', 'US'));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
                onPressed: () {
                  languageProvider.changeLanguage(const Locale('hi', 'IN'));
                },
                child: const Text('Hindi')),
            ElevatedButton(
                onPressed: () {
                  languageProvider.changeLanguage(const Locale('bn', 'IN'));
                },
                child: const Text('Bengali')),
            ElevatedButton(
                onPressed: () {
                  languageProvider.changeLanguage(const Locale('gj', 'IN'));
                },
                child: const Text('Gujratii')),
            ElevatedButton(
                onPressed: () {
                  languageProvider.changeLanguage(const Locale('mr', 'IN'));
                },
                child: const Text('Marathi')),
            ElevatedButton(
                onPressed: () {
                  languageProvider.changeLanguage(const Locale('ta', 'IN'));
                },
                child: const Text('Tamil')),
          ],
        ),
      ),
    );
  }
}
