import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final SharedPreferences _prefs;
  ThemeService(this._prefs);

  static const _themeKey = 'theme';
  static const _minimalKey = 'minimal';

  ThemeMode themeMode() {
    final themeValue = _prefs.getInt(_themeKey);
    if (themeValue == null) return ThemeMode.system;

    return ThemeMode.values[themeValue];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await _prefs.setInt(_themeKey, theme.index);
  }

  bool minimalTimer() {
    final themeValue = _prefs.getBool(_minimalKey);
    if (themeValue == null) return false;

    return themeValue;
  }

  Future<void> toggleMinimalTimer() async {
    final isMinimal = minimalTimer();
    await _prefs.setBool(_minimalKey, !isMinimal);
  }
}
