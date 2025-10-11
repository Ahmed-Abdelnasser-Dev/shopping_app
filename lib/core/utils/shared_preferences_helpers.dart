import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelpers {
  static const _emailKey = 'user_email';
  static const _firstNameKey = 'user_first_name';
  static const _lastNameKey = 'user_last_name';

  // Email management
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

  // User profile management
  static Future<void> saveUserProfile({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_emailKey, email);
    await sharedPreferences.setString(_firstNameKey, firstName);
    await sharedPreferences.setString(_lastNameKey, lastName);
  }

  static Future<Map<String, String>?> getUserProfile() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final email = sharedPreferences.getString(_emailKey);
    final firstName = sharedPreferences.getString(_firstNameKey);
    final lastName = sharedPreferences.getString(_lastNameKey);

    if (email == null || firstName == null || lastName == null) {
      return null;
    }

    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  static Future<void> clearUserProfile() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_emailKey);
    await sharedPreferences.remove(_firstNameKey);
    await sharedPreferences.remove(_lastNameKey);
  }

  // Clear all user data (for logout)
  static Future<void> clearAllUserData() async {
    await clearUserProfile();
    // TokenManager.clearTokens() will be called separately
  }
}
