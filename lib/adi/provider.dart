import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  late BuildContext _context;
  late Locale _currentLocale;

  LanguageProvider(BuildContext context) {
    _context = context;
    _currentLocale = Locale('en', 'US');
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = _prefs.getString('language_code');
    if (savedLanguageCode != null) {
      _currentLocale = Locale(savedLanguageCode);
    }
  }

  Locale get currentLocale => _currentLocale;
  Future<void> changeLanguage(Locale newLocale) async {
    //change it to != if you want to change the language even if the user selects the same language
    if (_currentLocale != newLocale) {
      _currentLocale = newLocale;
      final localization = EasyLocalization.of(_context)!;
      await localization.setLocale(newLocale);
      await _prefs.setString('language_code', newLocale.languageCode);
      notifyListeners();
    }
  }
}
