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
      body: Stack(
        children: [
          SizedBox.expand(
            child: Transform.scale(
              scale: 360 / MediaQuery.of(context).size.width,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/pi2.jpg', // Path to your image asset
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
                    'Pinnawala is a locality in Rambukkana town in Kegalle district of Sri Lanka. It is located about 90 kilometers from Colombo city. Pinnawala is one of the main tourist areas in Sri Lanka.The Pinnawala Elephant Orphanage, the only one in the world, is also home to Sri Lanka s largest and only open- air zoo.',
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
