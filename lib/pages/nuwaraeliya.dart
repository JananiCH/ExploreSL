import 'package:flutter/material.dart';

class NuwaraEliya extends StatelessWidget {
  const NuwaraEliya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'NuwaraEliya',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/images/pictures_d/n2.jpg', // Path to your image asset
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content here
                Text(
                  'Nuwara Eliya is a beautiful city located in a valley in the central hills of Sri Lanka. Located at a height of 1868 meters above sea level, this city belongs to the Nuwara Eliya district. Mount Piduruthalagala, the highest mountain in Sri Lanka, is also located near this city.',
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
