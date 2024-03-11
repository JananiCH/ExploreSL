import 'package:exploresl_login/pages/choose_user.dart';
import 'package:exploresl_login/pages/guides.dart';
import 'package:exploresl_login/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: HomePage());
  }
}


