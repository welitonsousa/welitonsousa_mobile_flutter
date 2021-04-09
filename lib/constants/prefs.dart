import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> setBool(String key, bool b) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, b);
  }
}
