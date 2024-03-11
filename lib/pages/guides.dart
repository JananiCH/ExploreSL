import 'package:flutter/material.dart';

class guides extends StatelessWidget {
  const guides({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center
        children: [
          Text('Tour Guides',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold

          ),)
        ],
      ),
    );
  }
}