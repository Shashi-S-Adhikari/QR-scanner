import 'package:flutter/material.dart';
import 'package:qr_scan_slt/pages/splash_screen.dart';
//import 'package:qr_scan_slt/pages/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),  // Start with the SplashScreen
    );
  }

}





