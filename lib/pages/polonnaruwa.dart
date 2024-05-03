import 'package:flutter/material.dart';

class Polonnaruwa extends StatelessWidget {
  const Polonnaruwa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Polonnaruwa',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Transform.scale(
              scale: 360 / MediaQuery.of(context).size.width,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'lib/images/destinations_page/p2.jpg', // Path to your image asset
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
                    'Polonnaruwa was the second capital of Sri Lanka after the destruction of Anuradhapura in 993 . It comprises, besides the Brahmanic monuments built by the Cholas, the monumental ruins of the fabulous garden-city created by Parakramabahu I in the 12th century.',
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
