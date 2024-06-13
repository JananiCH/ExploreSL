import 'package:exploresl_login/pages/guideSignUp.dart'; // Replace with actual imports
import 'package:exploresl_login/pages/touristSignIn.dart'; // Replace with actual imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class ChooseUser extends StatelessWidget {
  const ChooseUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // No title or any other AppBar content
          ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
            20.0, 40.0, 20.0, 20.0), // Adjusted top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10), // Adjusted space to move title up
            Center(
              child: Text(
                'Choose User Type',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Kindly select your designated role below to commence the registration process with ExploreSL',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.location_city),
              label: Text(
                'I am a Tourist',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20), // Increased space between choices
            Text(
              'Discover and explore the beauty of Sri Lanka with local guides',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20), // Increased space after first choice
            Container(
              height: 1,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(horizontal: 40),
            ), // Horizontal line divider
            const SizedBox(height: 20), // Increased space after line divider
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateAccountPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.explore),
              label: Text(
                'I am a Tour guide',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20), // Increased space after second choice
            Text(
              'Share your knowledge and passion for Sri Lanka with tourists',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
