import 'package:exploresl_login/models/guide_model.dart';
import 'package:exploresl_login/pages/ContactNowPage.dart';
import 'package:exploresl_login/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TourGuideProfile extends StatelessWidget {
  final Guide guide;

  const TourGuideProfile({
    Key? key,
    required this.guide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Guides'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(guide.image),
              ),
              const SizedBox(height: 16),
              Text(
                guide.name,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildLabelValueRow('Email:', guide.email),
              _buildLabelValueRow('Contact Number:', guide.phoneNumber),
              _buildLabelValueRow('Date of Birth:', guide.dob),
              _buildLabelValueRow('Languages:', guide.languages),
              _buildLabelValueRow('Experience:', guide.experience),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactNowPage(
                        guidePhoneNumber: guide.phoneNumber,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Contact Now',
                  style: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Additional Details',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                guide.additionalDetails,
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLabelValueRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(),
          ),
        ),
      ],
    ),
  );
}
