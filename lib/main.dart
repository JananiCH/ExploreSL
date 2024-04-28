import 'package:exploresl/pages/auth_page.dart';
import 'package:exploresl/pages/login.dart';
import 'package:exploresl/pages/touristSignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: HomeScreen());
  }
}