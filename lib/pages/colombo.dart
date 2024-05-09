import 'package:flutter/material.dart';

class colombo extends StatelessWidget {
  const colombo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Colombo',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/images/pictures_d/c2.jpg', // Path to your image asset
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content here
                Text(
                  'Colombo is the largest city and commercial capital of Sri Lanka. Sri Jayawardenepura Kotte, the administrative capital, is located on the outskirts of Colombo. Colombo is the administrative center of Colombo District. A population of 752,993 lives within the city limits of Colombo. ',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
