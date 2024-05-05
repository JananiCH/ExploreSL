import 'package:exploresl_login/pages/ScreenA.dart';
import 'package:flutter/material.dart';

// Import ScreenA

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenA(), // Set ScreenA as the initial screen
    );
  }
}
