import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData currentTheme;

  Themeprovider({required isDarkmode})
      : currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
