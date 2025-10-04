import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';

  static SharedPreferences? _prefs;

  // Initialize on first use
  static Future<SharedPreferences> _init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<SharedPreferences> get _instance async {
    return _prefs ?? await _init();
  }

  // Save tokens
  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    final prefs = await _instance;
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  // Save user data
  static Future<void> saveUserData(String userData) async {
    final prefs = await _instance;
    await prefs.setString(_userDataKey, userData);
  }

  // Get access token
  static Future<String?> getAccessToken() async {
    final prefs = await _instance;
    return prefs.getString(_accessTokenKey);
  }

  // Get refresh token
  static Future<String?> getRefreshToken() async {
    final prefs = await _instance;
    return prefs.getString(_refreshTokenKey);
  }

  // Get user data
  static Future<String?> getUserData() async {
    final prefs = await _instance;
    return prefs.getString(_userDataKey);
  }

  // Clear all data (logout)
  static Future<void> clearAll() async {
    final prefs = await _instance;
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userDataKey);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null;
  }
}