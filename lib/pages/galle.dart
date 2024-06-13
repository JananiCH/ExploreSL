import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class galle extends StatelessWidget {
  const galle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Galle',
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
              'lib/images/pictures_d/g2.jpg',
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
                    'Galle is the capital city in the southern province of Sri Lanka. It is spread over 6.5 square miles. It has also been named a World Heritage City by UNESCO. Galle has been known as a trading city since ancient times.',
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
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildListItem(
                      'Explore Galle Fort, a UNESCO World Heritage Site, known for its colonial architecture and sea views.'),
                  _buildListItem(
                      'Walk along the fort walls and visit historical landmarks like the Dutch Reformed Church and Galle Lighthouse.'),
                  _buildListItem(
                      'Visit the National Maritime Museum for insights into Galle\'s maritime history.'),
                  _buildListItem(
                      'Stroll through the vibrant Galle Dutch Hospital shopping and dining precinct.'),
                  _buildListItem(
                      'Relax at Unawatuna Beach, known for its turquoise waters and beachside cafes.'),
                  _buildListItem(
                      'Take a boat ride on the Madu River and explore its mangroves and islands.'),
                  _buildListItem(
                      'Experience a traditional stilt fishing demonstration near Koggala.'),
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
            color: Colors.deepOrangeAccent,
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
