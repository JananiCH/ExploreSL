import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kandy extends StatelessWidget {
  const Kandy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Kandy',
          style: GoogleFonts.poppins(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/pictures_d/k2.jpg',
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
                    'Kandy is a cosmopolitan city in the Central Province of Sri Lanka. It was the last headquarters of the ancient period of the Kingdoms of Sri Lanka. The city lies in the middle of the hills of the Kandy Plateau, which also traverses a vast region of tropical plantations, primarily tea. Kandy is both an administrative and a religious municipality, as well as being the capital of the Central Province of the country. '
                    'Kandy houses the Temple of the Tooth Relic (Sri Dalada Maligawa), among the most sacred places of devotion to the Buddhist community. It was declared a UNESCO World Heritage Site in 1988.',
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
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildListItem(
                      'Visit the Temple of the Tooth Relic (Sri Dalada Maligawa) and attend a puja (worship ritual).'),
                  _buildListItem(
                      'Explore the Royal Botanical Gardens for its diverse flora and serene atmosphere.'),
                  _buildListItem(
                      'Take a stroll around Kandy Lake and enjoy the scenic views.'),
                  _buildListItem(
                      'Witness a traditional Kandyan dance performance.'),
                  _buildListItem(
                      'Visit the Peradeniya Tea Factory for an insight into tea production.'),
                  _buildListItem(
                      'Explore the Udawatte Kele Sanctuary for a nature walk and bird watching.'),
                  _buildListItem(
                      'Take a day trip to nearby cultural sites like Gadaladeniya and Lankatilaka Temples.'),
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
            color: Colors.green,
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
