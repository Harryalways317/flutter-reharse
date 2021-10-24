import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void onToggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
