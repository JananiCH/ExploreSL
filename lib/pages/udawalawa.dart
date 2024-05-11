import 'package:flutter/material.dart';

class Udawalawa extends StatelessWidget {
  const Udawalawa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Pinnawala',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/images/pictures_d/pi2.jpg', // Path to your image asset
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content here
                Text(
                  'Pinnawala is a locality in Rambukkana town in Kegalle district of Sri Lanka. It is located about 90 kilometers from Colombo city. Pinnawala is one of the main tourist areas in Sri Lanka.The Pinnawala Elephant Orphanage, the only one in the world, is also home to Sri Lanka s largest and only open- air zoo.',
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
