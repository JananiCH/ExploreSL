import 'package:flutter/material.dart';

class Sigiriya extends StatelessWidget {
  const Sigiriya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Sigiriya',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/images/pictures_d/s2.jpg', // Path to your image asset
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content here
                Text(
                  'Sigiriya is translated from Sinhalese as the “ Lion Rock ” (Sinha-giriya). This site of historical and archaeological significance is listed in the UNESCO s World Heritage List and is also called the eighth wonder of the world. ',
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
