import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save tokens
  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _prefs.setString(_accessTokenKey, accessToken);
    await _prefs.setString(_refreshTokenKey, refreshToken);
  }

  // Save user data
  static Future<void> saveUserData(String userData) async {
    await _prefs.setString(_userDataKey, userData);
  }

  // Get access token
  static String? getAccessToken() {
    return _prefs.getString(_accessTokenKey);
  }

  // Get refresh token
  static String? getRefreshToken() {
    return _prefs.getString(_refreshTokenKey);
  }

  // Get user data
  static String? getUserData() {
    return _prefs.getString(_userDataKey);
  }

  // Clear all data (logout)
  static Future<void> clearAll() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
    await _prefs.remove(_userDataKey);
  }

  // Check if user is logged in
  static bool isLoggedIn() {
    return getAccessToken() != null;
  }
}