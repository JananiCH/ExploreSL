import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sigiriya extends StatelessWidget {
  const Sigiriya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Sigiriya',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/pictures_d/s2.jpg',
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
                    'Sigiriya is translated from Sinhalese as the “Lion Rock” (Sinha-giriya). This site of historical and archaeological significance is listed in UNESCO\'s World Heritage List and is also called the eighth wonder of the world.',
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
                      'Climb to the top of Sigiriya Rock for panoramic views.'),
                  _buildListItem(
                      'Explore the ancient frescoes of Sigiriya Rock Fortress.'),
                  _buildListItem(
                      'Visit the Sigiriya Museum for historical insights.'),
                  _buildListItem(
                      'Stroll through the Sigiriya Gardens, including the Water Gardens.'),
                  _buildListItem(
                      'Discover the Boulder Gardens and other architectural marvels.'),
                  _buildListItem(
                      'Learn about the history and legends from local guides.'),
                  _buildListItem(
                      'Take a safari tour in nearby Minneriya or Kaudulla National Parks.'),
                  _buildListItem(
                      'Experience local culture and cuisine in nearby villages.'),
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
