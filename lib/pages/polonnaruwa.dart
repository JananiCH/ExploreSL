import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Polonnaruwa extends StatelessWidget {
  const Polonnaruwa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Polonnaruwa',
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
            Hero(
              tag: 'polonnaruwa_image',
              child: Image.asset(
                'lib/images/pictures_d/p2.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Polonnaruwa was the second capital of Sri Lanka after the destruction of Anuradhapura in 993. It comprises, besides the Brahmanic monuments built by the Cholas, the monumental ruins of the fabulous garden-city created by Parakramabahu I in the 12th century.',
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
                      'Explore the archaeological site including the Royal Palace and Quadrangle.'),
                  _buildListItem(
                      'Visit the Gal Vihara for its impressive Buddha statues carved into rock.'),
                  _buildListItem(
                      'Discover the engineering marvel of Parakrama Samudra reservoir.'),
                  _buildListItem(
                      'Rent a bicycle and tour the UNESCO World Heritage site.'),
                  _buildListItem(
                      'Visit ancient temples like Lankatilaka and Tivanka Image House.'),
                  _buildListItem(
                      'Embark on a wildlife safari in Minneriya National Park.'),
                  _buildListItem(
                      'Experience local culture and cuisine in Polonnaruwa town.'),
                  _buildListItem(
                      'Attend traditional cultural shows showcasing Sri Lankan heritage.'),
                  _buildListItem(
                      'Explore hidden treasures like Rankoth Vehera stupa.'),
                  _buildListItem(
                      'Participate in rural village tours for a glimpse of traditional life.'),
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
