import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelpers {
  static const _emailKey = 'user_email';

  static Future<void> saveEmail(String email) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_emailKey, email);
  }

  static Future<String?> getEmail() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_emailKey);
  }

  static Future<void> clearEmail() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_emailKey);
  }
}
