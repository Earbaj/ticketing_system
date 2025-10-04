import 'package:flutter/foundation.dart';
import 'dart:convert';

import '../../service/api_service.dart';
import '../../service/shared_preferences_service.dart';
import '../model/data/auth_model_data.dart';
import '../model/data/login_request_data.dart';
import '../model/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final request = LoginRequestModel(email: email, password: password);
      final AuthResponseModel response = await _authRepository.login(request);

      // Save tokens and user data to SharedPreferences
      await SharedPreferencesService.saveTokens(
          response.accessToken,
          response.refreshToken
      );
      await SharedPreferencesService.saveUserData(
          json.encode(response.user.toJson())
      );

      // Set the access token in Dio client for future requests
      DioClient().setAccessToken(response.accessToken);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
    } catch (e) {
      print('Logout error: $e');
    } finally {
      // Always clear local storage
      await SharedPreferencesService.clearAll();
      DioClient().clearAccessToken();
      notifyListeners();
    }
  }

  // Check if user is logged in and set up Dio if true
  Future<bool> checkLoginStatus() async {
    final accessToken = SharedPreferencesService.getAccessToken();
    if (accessToken != null) {
      DioClient().setAccessToken(accessToken);
      return true;
    }
    return false;
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}