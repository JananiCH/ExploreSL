import 'package:flutter/material.dart';

class Kandy extends StatelessWidget {
  const Kandy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 202, 150),
        title: const Flexible(
          child: Text(
            'Kandy',
            overflow: TextOverflow.ellipsis, // Handles overflow by ellipsis
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/images/pictures_d/k2.jpg', // Path to your image asset
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add your content here
                Text(
                  'Kandy is a cosmopolitan city in the Central Province of Sri Lanka. It was the last headquarters of the ancient period of the Kingdoms of Sri Lanka. The city lies in the middle of the hills of the Kandy Plateau, which also traverses a vast region of tropical plantations, primarily tea. Kandy is both an administrative and a religious municipality, as well as being the capital of the Central Province of the country. '
                  'Kandy houses the Temple of the Tooth Relic (Sri Dalada Maligawa), among the most sacred places of devotion to the Buddhist community. It was declared a UNESCO World Heritage Site in 1988.',
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
