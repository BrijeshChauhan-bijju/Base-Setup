import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {

  static Future saveSharedPref(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> getSharedPref(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) != null) {
      return prefs.getString(key);
    } else {
      return '';
    }
  }

  static Future clearSharedPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  //clear all values from shared preferences
  static void clearMemory() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
