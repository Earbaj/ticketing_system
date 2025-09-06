import 'dart:async';

import 'package:flutter/material.dart';

import '../oneboardingScreen/one_boarding.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OneBoarding()),
      );
    });
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
