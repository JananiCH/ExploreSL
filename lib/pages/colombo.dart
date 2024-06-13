import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class colombo extends StatelessWidget {
  const colombo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Colombo',
          style: GoogleFonts.poppins(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/pictures_d/c2.jpg',
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
                    'Colombo is the largest city and commercial capital of Sri Lanka. Sri Jayawardenepura Kotte, the administrative capital, is located on the outskirts of Colombo. Colombo is the administrative center of Colombo District. A population of 752,993 lives within the city limits of Colombo.',
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
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildListItem(
                      'Visit Galle Face Green for a stroll along the beachfront.'),
                  _buildListItem(
                      'Explore the historic Fort area, including the Colombo Dutch Museum.'),
                  _buildListItem(
                      'Check out the National Museum of Colombo for a glimpse into Sri Lankan history.'),
                  _buildListItem(
                      'Wander through the vibrant Pettah Market for local goods and souvenirs.'),
                  _buildListItem(
                      'Relax at the Viharamahadevi Park, the largest park in Colombo.'),
                  _buildListItem(
                      'Experience the beauty of Gangaramaya Temple, a blend of modern and traditional architecture.'),
                  _buildListItem(
                      'Take a boat ride on the Beira Lake and visit the Seema Malaka Temple.'),
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
            color: Colors.purple,
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
