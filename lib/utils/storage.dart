import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  // Saves  woeid in storage.
  static Future<bool> setWoeid(String woeid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var result = await prefs.setString('woeid', woeid);

      return result;
    } catch (error) {
      return false;
    }
  }

  // Gets the saved woeid.
  static Future<String?> getWoeid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var result = prefs.getString('woeid');
      return result;
    } catch (err) {
      return null;
    }
  }
}
