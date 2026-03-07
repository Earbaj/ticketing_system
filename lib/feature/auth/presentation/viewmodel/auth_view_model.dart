import 'package:flutter/material.dart';
import 'package:ticket_system/feature/auth/domain/usecase/login_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  final LoginUsecase loginUsecase;

  AuthViewModel(this.loginUsecase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    print("Login View model started");
    _isLoading = true;
    notifyListeners();

    try {
      final user = await loginUsecase(email, password);
      // Handle success (e.g., save token, navigate)
      print("Logged in as: ${user.email}");
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}