import 'package:flutter/material.dart';
import 'package:ticket_system/feature/auth/presentation/view/login_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,  // Use light theme
      darkTheme: AppTheme.darkTheme, // Define dark theme
      themeMode: ThemeMode.system, // Follow system theme (light/dark)
      home: LoginScreen(),
    );
  }
}
