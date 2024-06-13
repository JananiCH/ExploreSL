import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Udawalawa extends StatelessWidget {
  const Udawalawa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Udawalawa',
          style: GoogleFonts.poppins(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/pictures_d/pi2.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Udawalawa is a locality known for its wildlife and natural beauty in Sri Lanka. It is particularly famous for the Udawalawe National Park, which is home to a large population of elephants and other wildlife species.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Things to do:',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildListItem(
                      'Take a safari tour in Udawalawe National Park to observe elephants and diverse wildlife.'),
                  _buildListItem(
                      'Visit the Elephant Transit Home to learn about elephant conservation efforts.'),
                  _buildListItem(
                      'Explore the lush landscapes and reservoirs in the vicinity.'),
                  _buildListItem(
                      'Bird watching in Udawalawe National Park for bird enthusiasts.'),
                  _buildListItem(
                      'Enjoy a boat ride or fishing in Udawalawe reservoir.'),
                  _buildListItem(
                      'Learn about local flora and fauna from knowledgeable guides.'),
                  _buildListItem(
                      'Experience the rural life and culture in nearby villages.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.blue,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
