import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  String _appLocal = 'en';

  String get appLocal => _appLocal;


  void changeLanguage(String newLanguage) {
    if (_appLocal == newLanguage) return;
    _appLocal = newLanguage;
    notifyListeners();
  }
  String _appTheme = 'Light';

  String get appTheme => _appTheme;

  ThemeMode get themeMode {
    if (_appTheme == 'Dark') {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  void changeTheme(String theme) {
    if (_appTheme == theme) return;
    _appTheme = theme;
    notifyListeners();
  }
}