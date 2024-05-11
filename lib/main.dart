import 'package:exploresl_login/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/testNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(home: HomeScreen());
  }
}
