import 'package:flutter/material.dart';

class ThemeModeManager extends ChangeNotifier {
  ThemeMode? themeMode = ThemeMode.dark;
  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    print(themeMode);
    notifyListeners();
  }
}
