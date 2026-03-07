import 'package:flutter/material.dart';
import 'package:ticket_system/feature/auth/domain/usecase/login_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  final LoginUsecase loginUsecase;

  AuthViewModel(this.loginUsecase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await loginUsecase(email, password);
      _isLoading = false;
      notifyListeners();
      return true; // Success
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false; // Failure
    }
  }
}