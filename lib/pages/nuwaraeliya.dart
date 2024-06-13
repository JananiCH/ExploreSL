import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NuwaraEliya extends StatelessWidget {
  const NuwaraEliya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Nuwara Eliya',
          style: GoogleFonts.poppins(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/pictures_d/n2.jpg',
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
                    'Nuwara Eliya is a beautiful city located in a valley in the central hills of Sri Lanka. Located at a height of 1868 meters above sea level, this city belongs to the Nuwara Eliya district. Mount Piduruthalagala, the highest mountain in Sri Lanka, is also located near this city.',
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
                      'Visit the Pedro Tea Estate and experience tea plucking and processing.'),
                  _buildListItem(
                      'Explore Victoria Park for its exotic flowers and bird species.'),
                  _buildListItem(
                      'Hike or take a scenic drive to World\'s End for breathtaking views.'),
                  _buildListItem(
                      'Enjoy boating or trout fishing at Lake Gregory.'),
                  _buildListItem(
                      'Experience the cool climate and colonial architecture of Nuwara Eliya town.'),
                  _buildListItem(
                      'Attend the Nuwara Eliya Horse Races during the season.'),
                  _buildListItem(
                      'Trek to Horton Plains National Park for a unique ecosystem and "Baker\'s Falls."'),
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
