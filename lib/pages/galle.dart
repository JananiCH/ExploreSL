import 'package:flutter/material.dart';

class galle extends StatelessWidget {
  const galle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Galle',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/images/pictures_d/g2.jpg', // Path to your image asset
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content here
                Text(
                  'Galle is the capital city in the southern province of Sri Lanka. It is spread over 6.5 square miles. It has also been named a World Heritage City by UNESCO. Galle has been known as a trading city since ancient times.',
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
