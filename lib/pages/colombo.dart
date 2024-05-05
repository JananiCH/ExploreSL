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
      body: Stack(
        children: [
          SizedBox.expand(
            child: Transform.scale(
              scale: 380 / MediaQuery.of(context).size.width,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'lib/images/pictures_d/c2.jpg', // Path to your image asset
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
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
          ),
        ],
      ),
    );
  }
}
