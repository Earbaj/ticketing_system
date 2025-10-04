import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication/viewmodel/auth_view_model.dart';
import '../homeScreen/view/dashboard.dart';
import '../oneboardingScreen/one_boarding.dart';
import '../service/shared_preferences_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Wait 3 seconds then navigate
    Timer(const Duration(seconds: 3), () {
      // Use pushReplacement so splash can't be returned to by back button
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    // Check if user is already logged in
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final isLoggedIn = await authViewModel.checkLoginStatus();

    if (isLoggedIn && mounted) {
      // If already logged in, navigate to home screen
      _navigateToHome();
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    }
  }

  void _navigateToHome() {
    // Replace with your home screen navigation
    // Navigator.pushReplacementNamed(context, '/home');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_)=> HomeScreen()
        )
    );
    print('User is already logged in, navigate to home screen');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/app_splash_bg.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Image(
              image: AssetImage("assets/images/splash_logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
