import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_system/splashScreen/splash_screen.dart';

import 'authentication/viewmodel/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
