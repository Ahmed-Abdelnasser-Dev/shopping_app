import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresAtKey = 'expires_at';
  static const String _isLoggedInKey = 'is_logged_in';

  // Save tokens after successful login
  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setString(_expiresAtKey, expiresAt.toIso8601String());
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Get access token
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  // Get refresh token
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  // Get token expiration
  static Future<DateTime?> getTokenExpiration() async {
    final prefs = await SharedPreferences.getInstance();
    final expiresAtString = prefs.getString(_expiresAtKey);
    if (expiresAtString != null) {
      return DateTime.parse(expiresAtString);
    }
    return null;
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Check if token is expired
  static Future<bool> isTokenExpired() async {
    final expiresAt = await getTokenExpiration();
    if (expiresAt == null) return true;
    
    // Add 5 minutes buffer to refresh token before it actually expires
    final bufferTime = Duration(minutes: 5);
    return DateTime.now().add(bufferTime).isAfter(expiresAt);
  }

  // Check if token needs refresh
  static Future<bool> needsTokenRefresh() async {
    final isLoggedIn = await TokenManager.isLoggedIn();
    if (!isLoggedIn) return false;
    
    return await isTokenExpired();
  }

  // Update tokens after refresh
  static Future<void> updateTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    await saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  // Clear all tokens (logout)
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_expiresAtKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  // Get all token info
  static Future<Map<String, dynamic>?> getAllTokenInfo() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    final expiresAt = await getTokenExpiration();
    final isLoggedIn = await TokenManager.isLoggedIn();

    if (accessToken == null || refreshToken == null || expiresAt == null) {
      return null;
    }

    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresAt': expiresAt,
      'isLoggedIn': isLoggedIn,
    };
  }
}
