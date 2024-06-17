import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/logo-color.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Color.fromARGB(255, 12, 75, 138),
                      value: _animation.value,
                    ),
                    const SizedBox(height: 8),
                    // ignore: prefer_const_constructors
                    Text(
                      'Loading...',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 18, 51, 97),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255));
  }
}
