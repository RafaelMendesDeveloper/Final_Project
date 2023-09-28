import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appThemeModeKey = 'appThemeMode';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    // ignore: discarded_futures
    _init();
  }

  late final SharedPreferences _sharedPreferences;

  var _isLight = true;

  bool get isLight => _isLight;

  Future<void> toggleTheme() async {
    _isLight = !_isLight;
    await _sharedPreferences.setBool(appThemeModeKey, _isLight);
    notifyListeners();
  }

  Future<void> _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _isLight = _sharedPreferences.getBool(appThemeModeKey) ?? true;
    notifyListeners();
  }
}
