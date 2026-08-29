import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  String _appLocal = 'en';

  String get appLocal => _appLocal;


  void changeLanguage(String newLanguage) {
    if (_appLocal == newLanguage) return;
    _appLocal = newLanguage;
    notifyListeners();
  }
}